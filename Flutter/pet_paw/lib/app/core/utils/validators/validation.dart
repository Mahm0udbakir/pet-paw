class Validator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(
      r'^[\w.-]+@(gmail\.com|yahoo\.com|outlook\.com|hotmail\.com|icloud\.com)$',
    );
    if (!emailRegExp.hasMatch(email)) {
      return 'Please enter a valid email address from Gmail, Yahoo, Outlook, Hotmail or iCloud';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validatePhone(String? phone) {
    if (phone == null || phone.trim().isEmpty) {
      return 'Phone number is required';
    }
    final cleanedPhone = phone.trim();
    final phoneRegExp = RegExp(r'^(010|011|012|015)\d{8}$');
    if (!RegExp(r'^\d{11}$').hasMatch(cleanedPhone)) {
      return 'Phone number must be exactly 11 digits';
    }
    if (!phoneRegExp.hasMatch(cleanedPhone)) {
      return 'Phone number must start with 010, 011, 012, or 015';
    }
    return null;
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name is required';
    }
    if (name.trim().isEmpty) {
      return 'Name cannot be just spaces';
    }
    final nameRegExp = RegExp(
      r'^[a-zA-Z\u0621-\u063A\u0641-\u064A\u064B-\u0652\u0649\u0671]+(?:\s[a-zA-Z\u0621-\u063A\u0641-\u064A\u064B-\u0652\u0649\u0671]+)*$',
    );
    if (!nameRegExp.hasMatch(name)) {
      return 'Please enter a valid name without numbers or symbols';
    }
    return null;
  }

  static String? validateAddress(String? address) {
    if (address == null || address.isEmpty) {
      return 'Address is required';
    }
    return null;
  }

  static String? validateCity(String? city) {
    if (city == null || city.isEmpty) {
      return 'City is required';
    }
    return null;
  }

  static String? validateZip(String? zip) {
    if (zip == null || zip.isEmpty) {
      return 'Zip code is required';
    }
    final zipRegExp = RegExp(r'^\d{5}$');
    if (!zipRegExp.hasMatch(zip)) {
      return 'Please enter a valid zip code';
    }
    return null;
  }

  static String? validateCountry(String? country) {
    if (country == null || country.isEmpty) {
      return 'Country is required';
    }
    return null;
  }

  static String? validateCardNumber(String? cardNumber) {
    if (cardNumber == null || cardNumber.isEmpty) {
      return 'Card number is required';
    }
    final cardNumberRegExp = RegExp(r'^\d{16}$');
    if (!cardNumberRegExp.hasMatch(cardNumber)) {
      return 'Please enter a valid card number';
    }
    return null;
  }

  static String? validatePetType(String? petType) {
    if (petType == null || petType.isEmpty) {
      return 'Pet type is required';
    }
    return null;
  }

  static String? validatePetBreed(String? petBreed) {
    if (petBreed == null || petBreed.isEmpty) {
      return 'Pet breed is required';
    }
    return null;
  }

  static String? validateGender(String? gender) {
    if (gender == null || gender.isEmpty) {
      return 'Gender is required';
    }
    return null;
  }

  static String? validateNeuterStatus(String? neuterStatus) {
    if (neuterStatus == null || neuterStatus.isEmpty) {
      return 'Neuter status is required';
    }
    return null;
  }

  static String? validateBirthday(String? birthday) {
    if (birthday == null || birthday.isEmpty) {
      return 'Birthday is required';
    }
    return null;
  }

  static String? validateWeight(String? weight) {
    if (weight == null || weight.trim().isEmpty) {
      return 'Weight is required';
    }
    final weight1 = double.tryParse(weight);
    if (weight1 == null) {
      return 'Please enter a valid number';
    }
    if (weight1 <= 0) {
      return 'Weight must be greater than 0';
    }
    return null;
  }

  static String? validateHeight(String? height) {
    if (height == null || height.trim().isEmpty) {
      return 'Height is required';
    }
    final height1 = double.tryParse(height);
    if (height1 == null) {
      return 'Please enter a valid number';
    }
    if (height1 <= 0) {
      return 'Height must be greater than 0';
    }
    return null;
  }

  static String? validateCharacteristic(String? characteristic) {
    if (characteristic == null || characteristic.isEmpty) {
      return 'Characteristic is required';
    }
    return null;
  }
}
