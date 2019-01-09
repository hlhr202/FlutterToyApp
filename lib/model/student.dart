import "dart:math";

final rng = Random();
const testData = '{"name": "Frek", "age": 12, "gender": "M"}';

enum Gender { M, F, U }

String _randomString(int length) {
  final codeUnits = List.generate(length, (index) => rng.nextInt(33) + 89);
  return String.fromCharCodes(codeUnits);
}

final _randomGender = () => Gender.values[rng.nextInt(2)];

class Student {
  final String _name;
  final int _age;
  final Gender _gender;

  const Student(this._name, this._age, this._gender);

  static Student fromJson(Map<String, dynamic> parsedJson) {
    final String name = parsedJson['name'];
    final int age = parsedJson['age'];
    final Gender gender = Gender.values.firstWhere((g) {
      return g.toString().split(',').last == parsedJson['gender'];
    }, orElse: () => Gender.U);
    return Student(name, age, gender);
  }

  static Student generateRandom() {
    final String name = _randomString(10);
    final int age = rng.nextInt(99);
    final Gender gender = Gender.values.firstWhere((g) {
      return g == _randomGender();
    }, orElse: () => Gender.U);
    return Student(name, age, gender);
  }

  String get name => _name;
  int get age => _age;
  String get gender {
    switch (_gender) {
      case Gender.M:
        return "Male";
      case Gender.F:
        return "Female";
      case Gender.U:
      default:
        return "Unknown";
    }
    ;
  }
}
