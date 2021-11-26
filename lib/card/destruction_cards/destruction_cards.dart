import 'package:star_destroyer/card/basic/card_effect.dart';
import 'package:star_destroyer/card/basic/card_rarity.dart';
import 'package:star_destroyer/card/basic/card_type.dart';
import 'package:star_destroyer/card/basic/star_card.dart';

List<StarCard> GenericDestructionCards = [
  StarCard(
      name: 'asteroid',
      description: 'destroy 1 star',
      effect: CardEffect(destroys: 1),
      type: CardType.destroyer),
  StarCard(
      name: 'black hole',
      description: 'destroy 24 stars',
      effect: CardEffect(destroys: 24, turnsToDestroy: 3),
      rarity: CardRarity.legendary,
      type: CardType.destroyer),
  StarCard(
      name: 'solar explotion',
      description: 'destroy 10 star',
      effect: CardEffect(destroys: 10),
      rarity: CardRarity.common,
      type: CardType.destroyer),
  StarCard(
      name: 'star collition',
      description: 'destroy 2 star',
      effect: CardEffect(destroys: 2),
      type: CardType.destroyer),
];
