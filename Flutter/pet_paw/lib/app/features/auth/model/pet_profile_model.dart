class PetProfileModel {
  final String name;
  final String breed;
  final String birthday;
  final String color;
  final double weight;
  final String gender;
  final String? medicalConditions;
  final String neuterStatus;
  final String petType;
  final String? photoPath;

  PetProfileModel({
    required this.name,
    required this.breed,
    required this.birthday,
    required this.color,
    required this.weight,
    required this.gender,
    required this.neuterStatus,
    required this.petType,
    this.medicalConditions,
    this.photoPath,
  });

  Map<String, String> toFields() {
    final fields = {
      'Name': _translate(name.trim()),
      'Breed': _translate(breed),
      'BirthDay.year': _getYear(),
      'BirthDay.month': _getMonth(),
      'BirthDay.day': _getDay(),
      'Color': _translate(color),
      'Weight': weight.toString(),
      'Gender': _translate(gender),
      'breedingRequestStatus': _translate(neuterStatus),
      'petType': _translate(petType).toLowerCase(),
    };

    if (medicalConditions != null && medicalConditions!.trim().isNotEmpty) {
      fields['MedicalConditions'] = _translate(medicalConditions!);
    }

    return fields;
  }

  String _getYear() => birthday.split('-')[0];
  String _getMonth() => birthday.split('-')[1];
  String _getDay() => birthday.split('-')[2];

  String _translate(String input) {
    final translations = {
      'ذكر': 'Male',
      'أنثى': 'Female',
      'مخصي': 'Neutered',
      'غير مخصي': 'Not Neutered',
      'كلب': 'Dog',
      'قطة': 'Cat',
      'أبيض': 'White',
      'أسود': 'Black',
      'بني': 'Brown',
      'رمادي': 'Gray',
      'ذهبي': 'Golden',
    };

    return translations[input.trim()] ?? input;
  }
}
