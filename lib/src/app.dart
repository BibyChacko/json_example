import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/contacts/contact_cubit.dart';
import 'home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JSON Example",
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: BlocProvider(
        create: (context) => ContactCubit(),
        child: HomePage(),
      ),
    );
  }
}
