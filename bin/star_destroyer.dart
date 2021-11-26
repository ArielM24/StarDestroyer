import 'package:star_destroyer/card/basic/star_card.dart';
import 'package:star_destroyer/card/basic/card_type.dart';
import 'package:star_destroyer/star_deck/star_deck.dart';

void main(List<String> arguments) {
  var c1 = StarCard(
      name: 'asteroid',
      description: 'destroy 1 star',
      destroys: 1,
      type: CardType.destroyer);

  var c2 = StarCard(
      name: 'star',
      description: 'create 1 star',
      creates: 1,
      type: CardType.creator);

  var deck1 = StarDeck.random();
  var deck2 = StarDeck.random();

  print('$deck1\n');
  print('$deck2\n');

  var initialHand1 = deck1.draw(6);
  var initialHand2 = deck2.draw(6);
}
