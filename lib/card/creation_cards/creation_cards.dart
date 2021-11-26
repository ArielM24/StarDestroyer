import 'package:star_destroyer/card/basic/card_rarity.dart';
import 'package:star_destroyer/card/basic/card_type.dart';
import 'package:star_destroyer/card/basic/star_card.dart';

List<StarCard> GenericCreationCards = [
  StarCard(
      name: 'star',
      description: 'create 1 star',
      creates: 1,
      type: CardType.creator),
  StarCard(
      name: 'orion',
      description: 'create 24 stars',
      creates: 24,
      turnsToActivate: 3,
      rarity: CardRarity.legendary,
      type: CardType.creator),
  StarCard(
      name: 'rigel',
      description: 'create 10 star',
      creates: 10,
      rarity: CardRarity.common,
      type: CardType.creator),
  StarCard(
      name: 'binary system',
      description: 'create 2 star',
      creates: 2,
      type: CardType.creator),
];
