import 'package:star_destroyer/card/basic/star_card.dart';
import 'package:star_destroyer/card/basic/card_type.dart';
import 'package:star_destroyer/card/star_game/star_game.dart';
import 'package:star_destroyer/star_deck/star_deck.dart';
import 'package:star_destroyer/star_player/star_player.dart';

void main(List<String> arguments) {
  var deck1 = StarDeck.random();
  var deck2 = StarDeck.random();

  print('$deck1\n');
  print('$deck2\n');
  var player1 = StarPlayer(email: 'player1@gmail.com', name: 'p1');
  var player2 = StarPlayer(email: 'player2@gmail.com', name: 'p2');

  var game = StarSimpleGame(
      player1: player1, player2: player2, deck1: deck1, deck2: deck2);
  game.startGameLoop();
}
