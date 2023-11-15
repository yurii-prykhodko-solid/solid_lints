// ignore_for_file: unused_local_variable
// ignore_for_file: prefer_match_file_name
// ignore_for_file: avoid_unused_parameters
// ignore_for_file: no_empty_block

/// Check the `no_magic_number` rule

const pi = 3.14;
const radiusToDiameterCoefficient = 2;

// expect_lint: no_magic_number
double circumference(double radius) => 2 * 3.14 * radius;

double correctCircumference(double radius) =>
    radiusToDiameterCoefficient * pi * radius;

bool canDrive(int age, {bool isUSA = false}) {
// expect_lint: no_magic_number
  return isUSA ? age >= 16 : age > 18;
}

const usaDrivingAge = 16;
const worldWideDrivingAge = 18;

bool correctCanDrive(int age, {bool isUSA = false}) {
  return isUSA ? age >= usaDrivingAge : age > worldWideDrivingAge;
}

class ConstClass {
  final int a;

  const ConstClass(this.a);
}

enum ConstEnum {
  // Allowed in enum arguments
  one(1),
  two(2);

  final int value;

  const ConstEnum(this.value);
}

void fun() {
  // Allowed in const constructors
  const classInstance = ConstClass(1);

  // Allowed in list literals
  final list = [1, 2, 3];

  // Allowed int map literals
  final map = {1: 'One', 2: 'Two'};

  // Allowed in indexed expression
  final result = list[1];

  // Allowed in DateTime because it doesn't have const constructor
  final apocalypse = DateTime(2012, 12, 21);
}

// Allowed for defaults in constructors and methods.
class DefaultValues {
  final int value;

  DefaultValues.named({
    this.value = 2,
  });

  DefaultValues.positional([
    this.value = 3,
  ]);

  void methodWithNamedParam({int value = 4}) {}

  void methodWithPositionalParam([int value = 5]) {}
}

void topLevelFunctionWithDefaultParam({int value = 6}) {
  ({int value = 7}) {};
}
