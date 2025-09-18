abstract class Drink {
  final String name;
  const Drink(this.name);

  double get price => 10.0;

  @override
  String toString() => name;
}

class Shai extends Drink {
  const Shai() : super('شاي');
  @override
  double get price => 8.0;
}

class TurkishCoffee extends Drink {
  const TurkishCoffee() : super('قهوة تركي');
  @override
  double get price => 12.0;
}

class HibiscusTea extends Drink {
  const HibiscusTea() : super('كركديه');
  @override
  double get price => 9.0;
}
