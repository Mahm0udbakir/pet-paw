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
      'Name': name.trim(),
      'Breed': breed,
      'BirthDay': birthday,
      'Color': color,
      'Weight': weight.toString(),
      'Gender': gender,
      'IsInBreedingPeriod': neuterStatus,
      'petType': petType,
    };

    if (medicalConditions != null && medicalConditions!.trim().isNotEmpty) {
      fields['MedicalConditions'] = medicalConditions!;
    }

    return fields;
  }
}
