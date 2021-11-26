import 'package:star_destroyer/card/star_game/star_move.dart';
import 'package:star_destroyer/star_deck/star_deck.dart';
import 'package:star_destroyer/star_player/star_player.dart';

class StarSimpleGame {
  List<StarMove> moves = [];
  StarPlayer player1, player2;
  StarDeck deck1, deck2;
  int player1Stars = 100, player2stars = 100;

  StarSimpleGame(
      {required this.player1,
      required this.player2,
      required this.deck1,
      required this.deck2});

  bool get gameOver => !deck1.isEmpty && !deck2.isEmpty;
  bool playerTurn = true;

  void startGameLoop() {
    while (!gameOver) {
      startPlayerTurn(playerTurn);
    }
  }

  void startPlayerTurn(bool player) {}
}
