import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letters_to_juliet/RedditClient.dart';
import 'package:letters_to_juliet/SubBloc.dart';
import 'package:letters_to_juliet/SubEvent.dart';
import 'package:letters_to_juliet/SubStatus.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create:(context) => SubBloc(SubEmpty(),RedditClient()),
          key:UniqueKey(),
          child: BlocBuilder<SubBloc,SubState>(builder: (context,state){

            if(state is SubEmpty)
              {
                BlocProvider.of<SubBloc>(context,listen: false).add(FetchItem());
                return Center(child: CircularProgressIndicator(),);
              }else if(state is SubLoading)
                {
                  return Center(child: CircularProgressIndicator(),);
                }else if(state is SubsLoaded)
                {
                 return ListView.builder(itemBuilder: (context,position){
                    return Text(state.datas[position].data!.title!);
                  },itemCount: state.datas.length,);
                } else{
              return Center(child: CircularProgressIndicator(),);
            }


          },),
        ),
      ),
    );
  }
}




