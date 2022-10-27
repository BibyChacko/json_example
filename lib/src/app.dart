import 'package:contact_app/src/pages/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/contacts/contact_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ContactCubit()
        ..getRecordsData(),
      child: MaterialApp(
        title: "JSON Example",
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: ContactPage(),
      ),
    );
  }

}