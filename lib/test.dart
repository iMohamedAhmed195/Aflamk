import 'package:clean_arch/movies/presentation/screens/movies_screen.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const MoviesScreen()));
          }, child: const Text('go to'),
        ),
      ),
    );
  }
}
