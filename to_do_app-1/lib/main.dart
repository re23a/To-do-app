import 'package:flutter/material.dart';
import 'package:to_do_app/integration/supabase.dart';
import 'package:to_do_app/screens/nav_bar.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  SupabaseIntegration().getSupabaseInitialize;

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Rubik Mono One"),
        debugShowCheckedModeBanner: false,
        home: NavBar(),
      ),
    );
  }
}
