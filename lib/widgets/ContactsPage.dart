import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letters_to_juliet/api/ContactsClient.dart';
import 'package:letters_to_juliet/bloc/ContactsBloc.dart';
import 'package:letters_to_juliet/bloc/ContactsStatus.dart';
import 'package:letters_to_juliet/bloc/ContactsEvent.dart';
import 'package:letters_to_juliet/models/Contacts.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage>with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactsBloc>(
        create: (context) => ContactsBloc(ContactsEmpty(), ContactsClient()),
        child:
            BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
          if (!(state is ContactsLoaded)) {
            if (state is ContactsEmpty) {
              BlocProvider.of<ContactsBloc>(context, listen: false)
                  .add(FetchItem());
            }
            return Container(child: Center(child: CircularProgressIndicator()));
          } else {
            return DefaultTabController(
              length: 5,
              child: Scaffold(appBar:
                AppBar(title: Text("Contacts"),
                  bottom: TabBar(tabs: [
                    Tab(text: "Group1",),
                    Tab(text: "Group2",),
                    Tab(text: "Group3",),
                    Tab(text: "Group4",),
                    Tab(text: "Group5",),
                  ],),
                ),body: TabBarView(children: [
                  TabPage(),
                  TabPage(),
                  TabPage(),
                  TabPage(),
                  TabPage(),
              ],),),
            );
          }
        }));
  }
}

class TabPage extends StatelessWidget {
  const TabPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemBuilder: (context, position) {
        return ContactsItem(
            (BlocProvider.of<ContactsBloc>(context, listen: true)
                    .state as ContactsLoaded)
                .datas[position]);
      },
      itemCount:
          (BlocProvider.of<ContactsBloc>(context, listen: true)
                  .state as ContactsLoaded)
              .datas
              .length,
    ));
      }
}

class ContactsItem extends StatelessWidget {
  final Contacts contacts;

  const ContactsItem(this.contacts);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 8,top: 8),
                child: Text(contacts.name!,style: TextStyle(color: Colors.black),),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Icon(Icons.call,size: 16,),
                  ),
                  Text(contacts.contacts!,style: TextStyle(color: Colors.black54))
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              minRadius: 20,
              child: Image.network(
                contacts.url!,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Icon(Icons.supervised_user_circle_rounded);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
