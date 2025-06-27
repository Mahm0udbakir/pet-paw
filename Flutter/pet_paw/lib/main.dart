import 'package:flutter/material.dart';
import 'package:petpaw/app.dart';

import 'app/core/utils/constants/constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Constants.init();
  runApp(const PetPaw());
}
