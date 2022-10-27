import 'package:contact_app/src/cubit/contacts/contact_cubit.dart';
import 'package:contact_app/src/models/record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPage extends StatefulWidget {

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("JSON Example"),
      ),
      body: SafeArea(
          child: BlocBuilder<ContactCubit,ContactState>(
            builder: (context, state) { // UI = f(state)
              if (state is ContactLoading) {
                return const CircularProgressIndicator();
              } else if (state is ContactLoaded) {
                return _buildRecordsListUI(state.records);
              } else if (state is ContactLoadError) {
                return Text(state.errorMessage);
              } else {
                return const CircularProgressIndicator();
              }
            },
          )
      ),
    );
  }

  _buildRecordsListUI(List<Record> records) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 0,),
      itemCount: records.length,
      itemBuilder: (context, index) { //
        Record item = records[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(item.photo),),
              title: Text(item.name),
            ),
          ),
        );
      },
    );
  }

// 1. Integrating the cubit -- Bloc Provider  -- this will provide the cubit to the wrapping widget
// 2. Show UI according to the state

// Bloc Builder is used to build the UI according to different state
}