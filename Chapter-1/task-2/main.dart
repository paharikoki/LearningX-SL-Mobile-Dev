void main() {
  // Contoh konversi tipe data

  // 1. String ke Int
  String stringNumber = "42";
  int convertedInt = int.parse(stringNumber);
  print("1. String to Int: $convertedInt");

  // 2. String ke Double
  String stringDecimal = "3.14";
  double convertedDouble = double.parse(stringDecimal);
  print("2. String to Double: $convertedDouble");

  // 3. Int ke String
  int integerNumber = 123;
  String convertedStringFromInt = integerNumber.toString();
  print("3. Int to String: $convertedStringFromInt");

  // 4. Double ke String
  double decimalNumber = 2.718;
  String convertedStringFromDouble = decimalNumber.toString();
  print("4. Double to String: $convertedStringFromDouble");

  // 5. Bool ke String
  bool isTrue = true;
  String convertedStringFromBool = isTrue.toString();
  print("5. Bool to String: $convertedStringFromBool");

  // 6. String ke Bool
  String boolString = "true";
  bool convertedBool = bool.parse(boolString);
  print("6. String to Bool: $convertedBool");
}
