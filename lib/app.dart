import 'package:flutter/material.dart';
import 'ui/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colombia Words & Expressions',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 140, 255, 0),
        ),
        useMaterial3: true,
      ),

      // 🔹 RUTA INICIAL
      initialRoute: '/',

      // 🔹 DEFINICIÓN DE RUTAS
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}