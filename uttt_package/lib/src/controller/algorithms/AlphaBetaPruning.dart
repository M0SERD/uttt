import 'dart:math';

import 'package:uttt_package/src/controller/GameStateController.dart';
import 'package:uttt_package/src/model/Algorithm.dart';
import 'package:uttt_package/src/model/GameState.dart';

/// Implementation of a Alpha Beta Pruning Algorithm
///
class AlphaBetaPruning implements Algorithm {
  int depth;
  Heuristic heuristic;
  State ourState;

  AlphaBetaPruning(this.depth, this.heuristic);

  @override
  Move getNextMove(GameState state) {
    if (isGameFinished(state)) return null;
    ourState = State.flip(state.lastMove.state);
    Move returnMove;
    double value = double.negativeInfinity;
    for (Move move in getAllPossibleMoves(state, ourState)) {
      RevertMove revert = playMove(state, move);
      double alphabeta = _alphabeta(
          state, depth, value, double.infinity, false);
      if (alphabeta > value) {
        value = alphabeta;
        returnMove = move;
      }
      revertMove(state, revert);
    }
    return returnMove;
  }

  double _alphabeta(GameState state, int depth, double alpha, double beta, maximizingPlayer) {
    if (depth == 0 || isGameFinished(state))
      return heuristic.evaluateState(state, ourState);
    if (maximizingPlayer) {
      double value = double.negativeInfinity;
      for (Move move in getAllPossibleMoves(state, State.flip(state.lastMove.state))) {
        RevertMove revert = playMove(state, move);
        value = max(value, _alphabeta(state, depth - 1, alpha, beta, false));
        revertMove(state, revert);
        alpha = max(alpha, value);
        if (alpha >= beta) {
          break;
        }
      }
      return value;
    } else {
      double value = double.infinity;
      for (Move move in getAllPossibleMoves(state, State.flip(state.lastMove.state))) {
        RevertMove revert = playMove(state, move);
        value = min(value, _alphabeta(state, depth - 1, alpha, beta, true));
        revertMove(state, revert);
        beta = min(beta, value);
        if (alpha >= beta) {
          break;
        }
      }
      return value;
    }
  }

  factory AlphaBetaPruning.fromJson(Map<String, dynamic> json) {
    return AlphaBetaPruning(json["depth"], Heuristic.fromJson(json["heuristic"]));
  }

  Map<String, dynamic> toJson() {
    return {
        "depth": depth,
        "heuristic": heuristic.toJson(),
        "class": "AlphaBetaPruning",
      };
  }
}
