import 'package:uttt_package/src/model/GameState.dart';
import 'package:uttt_package/src/model/Evolution.dart';
import 'dart:convert';

const String typ_initialised = "INITIALISED";
const String typ_playMove = "PLAYMOVE";
const String typ_movePlayed = "MOVEPLAYED";
const String typ_config = "CONFIG";
const String typ_unknown = "UNKNOWN";

class Transmission {
  String typ;
  dynamic object;

  Transmission.initialised() : this._(typ_initialised, null);

  Transmission.playMove(GameState obj) : this._(typ_playMove, obj);

  Transmission.movePlayed(GameState obj) : this._(typ_movePlayed, obj);

  Transmission.config(DNA obj) : this._(typ_config, obj);

  Transmission._(this.typ, this.object);

  factory Transmission.fromJson(Map<dynamic, dynamic> json) {
    if (json["typ"] == typ_initialised) {
      return Transmission._(json["typ"], null);
    } else if (json["typ"] == typ_playMove) {
      return Transmission._(json["typ"], GameState.fromJson(json["object"]));
    }else if (json["typ"] == typ_movePlayed) {
      return Transmission._(json["typ"], GameState.fromJson(json["object"]));
    }else if (json["typ"] == typ_config) {
      return Transmission._(json["typ"], DNA.fromJson(json["object"]));
    }
    return Transmission._(typ_unknown, null);
  }

  Map<String, dynamic> toJson() {
    if (typ == typ_initialised) {
      return {
        "typ": typ,
      };
    } else if (typ == typ_playMove) {
      return {
        "typ": typ,
        "object": (object as GameState).toJson(),
      };
    } else if (typ == typ_movePlayed) {
      return {
        "typ": typ,
        "object": (object as GameState).toJson(),
      };
    } else if (typ == typ_config) {
      return {
        "typ": typ,
        "object": (object as DNA).toJson(),
      };
    }
    return {
      "typ": typ_unknown,
    };
  }

  String toTransmittable() {
    return json.encode(toJson());
  }

  factory Transmission.fromTransmittable(String s) {
    return Transmission.fromJson(json.decode(s));
  }
}