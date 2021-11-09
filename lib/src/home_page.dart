import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_example/src/cubit/contacts/contact_cubit.dart';

import 'models/contact_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact App"),
      ),
      body: SafeArea(
        child: BlocBuilder<ContactCubit,ContactState>(
              builder: (context,state){
                if(state is ContactLoading){
                  return CircularProgressIndicator();
                }else if(state is ContactLoaded){
                  List<ContactModel> contacts = state.contacts;
                  return ListView.separated(
                      itemBuilder: (context,pos){
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(contacts[pos].photo??''),
                          ),
                          title: Text(contacts[pos].name??''),
                          subtitle:  Text(contacts[pos].address??''),
                        );
                      },
                      separatorBuilder: (context,pos)=>Divider(),
                      itemCount: contacts.length
                  );
                }else if(state is ContactLoadError){
                  return Text(state.errorMessage);
                }
                else{
                  return Container();
                }
              },
        ),
      ),
    );
  }

  void fetchData() {
    BlocProvider.of<ContactCubit>(context).loadContacts();
  }


}
