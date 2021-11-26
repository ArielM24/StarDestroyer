import 'dart:math';

import 'package:star_destroyer/card/creation_cards/creation_cards.dart';
import 'package:star_destroyer/card/destruction_cards/destruction_cards.dart';
import 'package:star_destroyer/card/basic/star_card.dart';

class StarDeck {
  String name;
  List<StarCard> destructionCards = [];
  List<StarCard> creationCards = [];
  int starsToWin;

  StarDeck(
      {this.name = 'star deck',
      this.starsToWin = 100,
      required this.destructionCards,
      required this.creationCards});

  StarDeck.random({
    int destructive = 10,
    int creator = 10,
    this.name = 'star deck',
    this.starsToWin = 100,
  }) {
    for (var i = 0; i < creator; i++) {
      var r = Random().nextInt(GenericCreationCards.length);
      creationCards.add(GenericCreationCards[r]);
    }

    for (var i = 0; i < destructive; i++) {
      var r = Random().nextInt(GenericDestructionCards.length);
      destructionCards.add(GenericDestructionCards[r]);
    }
  }

  @override
  String toString() => '$name:\n${creationCards.length} creation cards'
      '\n${destructionCards.length} destruction cards';

  bool get isEmpty => creationCards.isNotEmpty || destructionCards.isNotEmpty;

  List<StarCard> draw(int n) {
    var cards = <StarCard>[];
    n = n > 5 ? n : 6;
    creationCards.shuffle();
    destructionCards.shuffle();
    var maxCards = creationCards.length + destructionCards.length;
    n = n <= maxCards ? n : 6;
    var creation = true;
    for (var i = 0; i < n; i++) {
      StarCard card;
      if (creation) {
        card = creationCards.removeLast();
      } else {
        card = creationCards.removeLast();
      }
      cards.add(card);
      creation = !creation;
    }
    return cards;
  }
}
