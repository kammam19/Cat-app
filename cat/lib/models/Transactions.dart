class Transactions {
  late int id;
  String title;
  String gender; // Changed from late to normal declaration
  String foodName;
  double nutritionValue;
  int age;
  double weight;
  String fd;
  double nutri;

  Transactions({
    this.id = 0,
    this.title = '',
    this.gender = '', // Set default value to an empty string
    this.foodName = '',
    this.age = 0,
    this.nutritionValue = 0.0,
    this.fd = '',
    this.nutri = 0.0,
    double? weight,
  }) : weight = weight != null ? weight : 0.0;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'gender': gender,
      'foodName': foodName,
      'nutritionValue': nutritionValue,
      'age': age,
      'weight': weight,
      'fd': fd,
      'nutri': nutri,
    };
  }

  String getAgeString() {
    return 'Age: ${this.age.toString()} years';
  }

  String getWeightString() {
    return 'Weight: ${this.weight.toString()} kg.';
  }

  String getGenderString() {
    return 'Gender: ${this.gender.toString()}';
  }
}