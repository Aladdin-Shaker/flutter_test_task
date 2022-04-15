import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/app/config/theme.dart';
import 'package:test_task/app/data/controllers/upload_controller.dart';
import 'package:test_task/app/views/screens/files_screen/files_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UploadController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildThemeData(),
      title: 'Test_Task',
      home: const FilesScreen(),
    );
  }
}
