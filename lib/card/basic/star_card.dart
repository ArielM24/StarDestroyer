import 'package:star_destroyer/card/basic/card_rarity.dart';
import 'package:star_destroyer/card/basic/card_type.dart';

class StarCard {
  String name;
  String description;
  CardType type;
  int destroys;
  int creates;
  int turnsToActivate;
  CardRarity rarity;

  StarCard(
      {required this.name,
      required this.description,
      this.destroys = 0,
      required this.type,
      this.turnsToActivate = 0,
      this.rarity = CardRarity.common,
      this.creates = 0});

  @override
  String toString() =>
      '$name: $description\n$type\ndestroys: $creates\ncreates: $destroys'
      '\nactivates in: $turnsToActivate turns\n$rarity';
}
