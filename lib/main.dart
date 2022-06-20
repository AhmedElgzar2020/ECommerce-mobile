import 'package:e_commerce_layout/modules/e_commerce_layout/cubit/ecommerce_cubit.dart';
import 'package:e_commerce_layout/modules/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => EcommerceCubit())
        ],
        child: MaterialApp(

          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen(),
        ));
  }
}
