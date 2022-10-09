import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/home_page.dart';
import 'package:learn_flutter_bloc/pizza_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => PizzaBloc()..add(LoadPizzaCounter())),
      ],
      child: MaterialApp(
        home: HomePage(),

      ),
    );
  }
}

