import 'dart:math';

class CardEffect {
  int creates;
  int destroys;
  int turnsToCreate;
  int turnsToDestroy;
  int createProbability;
  int destroyProbability;
  bool repeatCreate;
  bool repeatDestroy;

  CardEffect(
      {this.creates = 0,
      this.destroys = 0,
      this.repeatCreate = false,
      this.repeatDestroy = false,
      this.turnsToCreate = 0,
      this.turnsToDestroy = 0,
      this.createProbability = 100,
      this.destroyProbability = 100});

  bool get canActivateCreation => turnsToCreate == 0 && creates > 0;
  bool get canActivateDestruction => turnsToDestroy == 0 && destroys > 0;
  bool get activationDelayed => turnsToCreate > 0 || turnsToDestroy > 0;
  bool get allEffectsActivated => turnsToCreate == 0 && turnsToDestroy == 0;

  int get startsToCreate {
    var r = Random().nextInt(100) + 1;
    if (createProbability >= r) {
      return creates;
    }
    return 0;
  }

  int get startsToDestroy {
    var r = Random().nextInt(100) + 1;
    if (destroyProbability >= r) {
      return destroys;
    }
    return 0;
  }

  void passTurns(int n) {
    if (creates > 0) {
      turnsToCreate--;
    }
    if (turnsToDestroy > 0) {
      turnsToDestroy--;
    }
  }
}
