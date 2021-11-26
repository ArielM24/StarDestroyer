import 'dart:io';

import 'package:star_destroyer/card/basic/card_effect.dart';
import 'package:star_destroyer/card/basic/star_card.dart';
import 'package:star_destroyer/card/star_game/star_move.dart';
import 'package:star_destroyer/star_deck/star_deck.dart';
import 'package:star_destroyer/star_player/star_player.dart';

class StarSimpleGame {
  List<StarMove> moves = [];
  StarPlayer player1, player2;
  StarDeck deck1, deck2;
  int player1Stars = 0, player2Stars = 0;
  List<StarCard> hand1 = [], hand2 = [];
  List<CardEffect> player1Effects = [];
  List<CardEffect> player2Effects = [];
  int turn = 1;

  StarSimpleGame(
      {required this.player1,
      required this.player2,
      required this.deck1,
      required this.deck2});

  bool get gameOver =>
      (deck1.isEmpty || deck2.isEmpty) ||
      (player1Stars >= deck1.starsToWin) ||
      (player2Stars >= deck2.starsToWin);

  bool playerTurn = true;

  void startGameLoop() {
    hand1 = deck1.draw(6);
    hand2 = deck2.draw(6);
    while (!gameOver) {
      startPlayerTurn(playerTurn);
      playerTurn = !playerTurn;
    }
    print('game over');
  }

  void startPlayerTurn(bool player) {
    if (player) {
      print('player 1 turn');
      hand1.addAll(deck1.draw(1));
      makeMoves(player);
    } else {
      print('player 2 turn');
      hand2.addAll(deck2.draw(1));
      makeMoves(player);
    }
    turn++;
  }

  void printHand(List<StarCard> hand) {
    print('cards in hand:');
    for (var i = 0; i < hand.length; i++) {
      print('-$i ${hand[i]}');
    }
    print('\n');
  }

  void makeMoves(bool player) {
    activatePendingEffects();
    if (player) {
      player1Moves();
    } else {
      player2Moves();
    }
  }

  void player1Moves() {
    while (hand1.isNotEmpty) {
      printPlayersStars();
      print('player1');
      printHand(hand1);
      print('choose a card to activate:');
      var choice = stdin.readLineSync();
      if (choice != null) {
        if (choice == 'e') {
          break;
        }
        var index = int.parse(choice);
        var card = hand1.removeAt(index);
        moves.add(StarMove(player: player1, card: card));
        activateEffectPlayer1(card.effect);
      }
    }
  }

  void player2Moves() {
    while (hand2.isNotEmpty) {
      printPlayersStars();
      print('player2');
      printHand(hand2);
      print('choose a card to activate, type "e" to pass:');
      var choice = stdin.readLineSync();
      if (choice != null) {
        if (choice == 'e') {
          break;
        }
        var index = int.parse(choice);
        var card = hand2.removeAt(index);
        moves.add(StarMove(player: player2, card: card));
        activateEffectPlayer2(card.effect);
      }
    }
  }

  void printPlayersStars() {
    print(
        'turn $turn\nplayer 1 stars: $player1Stars - player 2 stars $player2Stars');
  }

  void activatePendingEffects() {
    activatePlayer1Effects();
    activatePlayer2Effects();
  }

  void activatePlayer1Effects() {
    var toRemove = <CardEffect>[];
    for (var i = 0; i < player1Effects.length; i++) {
      var effect = player1Effects[i];
      effect.passTurns(1);
      if (effect.canActivateCreation) {
        player1Stars += effect.startsToCreate;
      }
      if (effect.canActivateDestruction) {
        player2Stars -= effect.startsToDestroy;
      }
      if (effect.allEffectsActivated) {
        print('removed $effect');
        toRemove.add(effect);
      }
    }
    toRemove.forEach(player1Effects.remove);
  }

  void activatePlayer2Effects() {
    var toRemove = <CardEffect>[];
    for (var i = 0; i < player2Effects.length; i++) {
      var effect = player2Effects[i];
      effect.passTurns(1);
      if (effect.canActivateCreation) {
        player2Stars = effect.startsToCreate;
      }
      if (effect.canActivateDestruction) {
        player1Stars = effect.startsToDestroy;
      }
      if (effect.allEffectsActivated) {
        print('removed $effect');
        toRemove.add(effect);
      }
    }
    toRemove.forEach(player2Effects.remove);
  }

  void activateEffectPlayer1(CardEffect effect) {
    if (effect.canActivateCreation) {
      player1Stars += effect.startsToCreate;
    } else if (effect.canActivateDestruction) {
      player2Stars -= effect.startsToDestroy;
    }
    if (effect.activationDelayed) {
      print('Added $effect');
      player1Effects.add(effect);
    }
  }

  void activateEffectPlayer2(CardEffect effect) {
    if (effect.canActivateCreation) {
      player2Stars += effect.startsToCreate;
    } else if (effect.canActivateDestruction) {
      player1Stars -= effect.startsToDestroy;
    }
    if (effect.activationDelayed) {
      player2Effects.add(effect);
      print('Added $effect');
    }
  }
}
