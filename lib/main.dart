import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letters_to_juliet/AppColors.dart';
import 'package:letters_to_juliet/BtmSheet.dart';
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
      color: Colors.lightBlue,
      theme: AppColors.lLightTheme,
      home: BlocProvider(
        create: (context) => SubBloc(SubEmpty(), RedditClient()),
        key: UniqueKey(),
        child: BlocBuilder<SubBloc, SubState>(
          builder: (context, state) {
            if (state is SubEmpty) {
              BlocProvider.of<SubBloc>(context, listen: false).add(FetchItem());
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SubLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SubsLoaded) {
              return Scaffold(
                  // bottomSheet: BtmSheet(),
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    title: Text("Fallen words",style: GoogleFonts.chivo(color: AppColors.darkTxt),),
                  ),
                  body: ListView.builder(
                    itemBuilder: (context, position) {
                      // return Text(state.datas[position].data!.title!);
                      return InkWell(
                        onTap: () {
                          Scaffold.of(context)
                              .showBottomSheet<void>((BuildContext context) {
                            return BtmSheet(position);
                          },clipBehavior: Clip.antiAlias,
                              elevation: 10,shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: const Radius.circular(10),topRight: const Radius.circular(10))));
                        },
                        child: Card(color: AppColors.colorList[position%5],
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20 ,30, 20),
                              child: Text(
                                state.datas[position].data!.title!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.chivo(fontStyle: FontStyle.normal,fontSize: 20,color: AppColors.lightTxt),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: state.datas.length,
                  ));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
