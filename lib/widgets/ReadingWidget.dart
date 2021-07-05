import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letters_to_juliet/bloc/SubBloc.dart';
import 'package:letters_to_juliet/bloc/SubStatus.dart';
import 'package:letters_to_juliet/widgets/AboutBottomSheet.dart';
import 'package:letters_to_juliet/AppColors.dart';
import 'package:letters_to_juliet/widgets/BtmSheet.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:letters_to_juliet/bloc/SubEvent.dart';
import 'package:letters_to_juliet/widgets/ContactsPage.dart';

class ReadingWidget extends StatefulWidget {
  const ReadingWidget({Key? key}) : super(key: key);

  @override
  _ReadingWidgetState createState() => _ReadingWidgetState();
}

class _ReadingWidgetState extends State<ReadingWidget>
    with AutomaticKeepAliveClientMixin<ReadingWidget> {
  ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.lightBlue,
      theme: AppColors.lLightTheme,
      home: Home(scrollController: _scrollController),
    );
  }

  @override
  void initState() {
    Firebase.initializeApp();
    _scrollController = ScrollController(keepScrollOffset: true);
    _scrollController!.addListener(() {
      if (_scrollController!.position.pixels ==
          _scrollController!.position.maxScrollExtent) {
        BlocProvider.of<SubBloc>(context, listen: false)
            .add(EndOfListReached());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
    required ScrollController? scrollController,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubBloc, SubState>(
      builder: (context, state) {
        if (state is SubEmpty) {
          BlocProvider.of<SubBloc>(context, listen: false)
              .add(FetchItem()); // remove from UI bloc
          return Splash();
        } else if (state is SubLoading) {
          return Splash();
        } else if (state is SubsLoaded) {
          return Scaffold(
              key: UniqueKey(),
              // bottomSheet: BtmSheet(),
              appBar: AppBar(
                actions: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Icon(
                        Icons.contacts_sharp,
                        color: Colors.orange,
                      ),
                    ),
                    onTap: () {
                      // showModalBottomSheet(
                      //     context: context,
                      //     builder: (context) {
                      //       return AboutBottomSheet();
                      //     },
                      //     clipBehavior: Clip.antiAlias,
                      //     elevation: 10,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.only(
                      //             topLeft: const Radius.circular(10),
                      //             topRight: const Radius.circular(10))));

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactsPage()),
                      );
                    },
                  )
                ],
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  "Fallen words",
                  style: GoogleFonts.chivo(color: AppColors.darkTxt),
                ),
              ),
              body: ListView.builder(
                addAutomaticKeepAlives: true,
                key: PageStorageKey("SubsList"),
                controller: _scrollController,
                itemBuilder: (context, position) {
                  // print("child length ${state.datas.length}");
                  // print("pos  ${position}");
                  // return Text(state.datas[position].data!.title!);
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: true,
                          enableDrag: true,
                          context: context,
                          builder: (context) {
                            return BtmSheet(position);
                          },
                          clipBehavior: Clip.antiAlias,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(10),
                                  topRight: const Radius.circular(10))));
                    },
                    child: Card(
                      color: AppColors.colorList[position % 5],
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                          child: Text(
                            (BlocProvider.of<SubBloc>(context, listen: false)
                                .state as SubsLoaded)
                                .datas[position]
                                .data!
                                .title!
                                .fixUtf(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.chivo(
                                fontStyle: FontStyle.normal,
                                fontSize: 20,
                                color: AppColors.lightTxt),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: (BlocProvider.of<SubBloc>(context, listen: true)
                    .state as SubsLoaded)
                    .datas
                    .length,
              ));
        } else {
          return Splash();
        }
      },
      buildWhen: (SubState prev, SubState curr) =>
      !(prev is SubsLoaded && curr is SubsLoaded),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[200],
      child: Center(
        child: Text("Fallen Words",
            style:
            GoogleFonts.amaticSc(fontSize: 60, color: AppColors.darkTxt,fontWeight: FontWeight.w700)),
      ),
    );
  }
}