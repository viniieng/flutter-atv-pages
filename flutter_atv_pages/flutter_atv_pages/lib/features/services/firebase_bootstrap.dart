import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart'; // gerado pelo flutterfire
Future<void> initFirebase() async => Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
