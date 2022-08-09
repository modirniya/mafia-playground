import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mafia_playground/firebase_options.dart';
import 'package:mafia_playground/presentation/mafia_playground.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  runApp(const MafiaPlaygroundApp());
}
