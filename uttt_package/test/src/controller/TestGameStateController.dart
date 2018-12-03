import 'dart:convert';

import "package:test/test.dart";
import 'package:uttt_package/src/controller/GameStateController.dart';
import 'package:uttt_package/src/model/GameState.dart';

void main() {
  group("Tests method isGameFinished", () {
    test("newGame", () {
      GameState newGameState = new GameState();
      expect(isGameFinished(newGameState), false);
    });
    test("Nearly finished", () {
      GameState gameState = GameState.fromJson(json.decode('{"tiles":[{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"O"}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"X"}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}}],"state":{"state":"O"}}],"lastMove":{"state":{"state":"O"},"xBigTile":2,"yBigTile":2,"xTile":0,"yTile":0}}'));
      expect(isGameFinished(gameState), false);
    });
    test("Some moves played", () {
      GameState gameState = new GameState.fromJson(json.decode('{"tiles":[{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}}],"state":{"state":"."}}],"lastMove":{"state":{"state":"O"},"xBigTile":2,"yBigTile":1,"xTile":1,"yTile":2}}'));
      expect(isGameFinished(gameState), false);
    });
    test("Finished", () {
      GameState gameState = new GameState.fromJson(json.decode('{"tiles":[{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"O"}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"X"}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}}],"state":{"state":"O"}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}}],"state":{"state":"O"}}],"lastMove":{"state":{"state":"O"},"xBigTile":2,"yBigTile":1,"xTile":1,"yTile":0}}'));
      expect(isGameFinished(gameState), true);
    });
  });
  group("getAllPossibleMoves", () {
    test("newGame", () {
      GameState newGameState = new GameState();
      expect(getAllPossibleMoves(newGameState).length, 81);
    });
    test("One big target", () {
      GameState gameState = GameState.fromJson(json.decode('{"tiles":[{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"O"}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"X"}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}}],"state":{"state":"O"}}],"lastMove":{"state":{"state":"O"},"xBigTile":2,"yBigTile":2,"xTile":0,"yTile":0}}'));
      List<Move> moves = [
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":0,"yBigTile":0,"xTile":1,"yTile":0}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":0,"yBigTile":0,"xTile":0,"yTile":1}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":0,"yBigTile":0,"xTile":2,"yTile":1}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":0,"yBigTile":0,"xTile":1,"yTile":2}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":0,"yBigTile":0,"xTile":0,"yTile":0}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":0,"yBigTile":0,"xTile":0,"yTile":2}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":0,"yBigTile":0,"xTile":2,"yTile":2}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":0,"yBigTile":0,"xTile":1,"yTile":1}')),
      ];
      expect(getAllPossibleMoves(gameState), moves);
    });
    test("Some moves played", () {
      GameState gameState = new GameState.fromJson(json.decode('{"tiles":[{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}}],"state":{"state":"."}}],"lastMove":{"state":{"state":"O"},"xBigTile":2,"yBigTile":1,"xTile":1,"yTile":2}}'));
      List<Move> moves = [
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":1,"yBigTile":2,"xTile":1,"yTile":0}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":1,"yBigTile":2,"xTile":0,"yTile":1}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":1,"yBigTile":2,"xTile":2,"yTile":1}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":1,"yBigTile":2,"xTile":1,"yTile":2}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":1,"yBigTile":2,"xTile":0,"yTile":0}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":1,"yBigTile":2,"xTile":2,"yTile":0}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":1,"yBigTile":2,"xTile":0,"yTile":2}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":1,"yBigTile":2,"xTile":2,"yTile":2}')),
        Move.fromJson(json.decode('{"state":{"state":"X"},"xBigTile":1,"yBigTile":2,"xTile":1,"yTile":1}')),
      ];
      expect(getAllPossibleMoves(gameState), moves);
    });
    test("Finished", () {
      GameState gameState = new GameState.fromJson(json.decode('{"tiles":[{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"O"}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"X"}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}}],"state":{"state":"O"}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"X"}}],"state":{"state":"."}},{"tiles":[{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"X"}},{"state":{"state":"."}},{"state":{"state":"O"}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"."}},{"state":{"state":"O"}}],"state":{"state":"O"}}],"lastMove":{"state":{"state":"O"},"xBigTile":2,"yBigTile":1,"xTile":1,"yTile":0}}'));
      expect(getAllPossibleMoves(gameState).length, 0);
    });
  });
}