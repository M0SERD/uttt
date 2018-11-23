@JS()
library sw;

import 'dart:html';

import 'package:js/js.dart';
import 'package:uttt_package/src/controller/algorithms/RandomMove.dart';
import 'package:uttt_package/src/model/Algorithm.dart';

import '../../transmission/Transmission.dart';

void _log(e) => print("Backend GameSimulator: $e");
//void _log(Object o) => {};

@JS("getMyGlobalScope")
external DedicatedWorkerGlobalScope getMyGlobalScope();

// Reminder: ServiceWorker mustn't use async in the [main] method.
void main() {
  DedicatedWorkerGlobalScope _self = getMyGlobalScope();
  _log('SW started.');
  Algorithm algorithm1 = RandomMove();
  Algorithm algorithm2 = RandomMove();
  _self.onMessage.listen((e) {
    _log(e.data);
    Transmission transmission = Transmission.fromTransmittable(e.data);
    if (transmission.typ == typ_configAlgorithm) {
      _log("CONFIGURATED");
      algorithm1 = transmission.object;
      algorithm2 = Transmission.fromTransmittable(e.data).object;
    }
  });
  _self.postMessage(Transmission.initialised().toTransmittable());
}
