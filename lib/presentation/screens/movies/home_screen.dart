import 'package:cinemapedia/config/const/environment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  static const name = 'home-secreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Environment.theMovieDbKey),
      ),
    );
  }
}