import 'package:star_destroyer/card/basic/card_effect.dart';
import 'package:star_destroyer/card/basic/card_rarity.dart';
import 'package:star_destroyer/card/basic/card_type.dart';

class StarCard {
  String name;
  String description;
  CardType type;
  CardRarity rarity;
  CardEffect effect;

  StarCard({
    required this.name,
    required this.description,
    required this.effect,
    required this.type,
    this.rarity = CardRarity.common,
  });

  @override
  String toString() {
    var str = '$rarity[$name: $description';
    if (type == CardType.creator) {
      str += ' turnsToCreate: ${effect.turnsToCreate}';
    } else if (type == CardType.destroyer) {
      str += ' turnsToDestroy ${effect.turnsToDestroy}';
    } else if (type == CardType.both) {
      str += ' turnsToCreate: ${effect.turnsToCreate}'
          ' turnsToDestroy ${effect.turnsToDestroy}';
    }

    if (effect.createProbability < 100) {
      str += ' createProbability: ${effect.createProbability}';
    }

    if (effect.destroyProbability < 100) {
      str += ' destroyProbability: ${effect.destroyProbability}';
    }
    return str + ']';
  }
}
