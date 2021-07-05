import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letters_to_juliet/AppColors.dart';
import 'package:letters_to_juliet/bloc/SubBloc.dart';
import 'package:letters_to_juliet/bloc/SubEvent.dart';
import 'package:letters_to_juliet/bloc/SubStatus.dart';

class BtmSheet extends StatefulWidget {
  int position = 0;

  BtmSheet(this.position);

  @override
  _BtmSheetState createState() => _BtmSheetState();
}

class _BtmSheetState extends State<BtmSheet> {
  PageController? _pageController;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: .90,
      expand: false,
      minChildSize: 0.25,
      initialChildSize: 0.5,
      builder: (BuildContext context, ScrollController scrollController) {
        return PageView.builder(
          controller: PageController(initialPage: widget.position),
          onPageChanged: (pos) {
            widget.position = pos;
          },
          pageSnapping: true,
          allowImplicitScrolling: false,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, position) {
            return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: scrollController,
                child: Column(
                  children: [
                    Container(
                      color: AppColors.colorList[position % 5],
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Center(
                            child: Text(
                          (BlocProvider.of<SubBloc>(context, listen: false)
                                  .state as SubsLoaded)
                              .datas[position]
                              .data!
                              .title!
                              .fixUtf(),
                          style: GoogleFonts.chivo(
                              fontStyle: FontStyle.normal,
                              fontSize: 20,
                              color: AppColors.lightTxt),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: (BlocProvider.of<SubBloc>(context,
                                          listen: false)
                                      .state as SubsLoaded)
                                  .datas[position]
                                  .data!
                                  .selftext![0],
                              style: GoogleFonts.inter(
                                  letterSpacing: 1,
                                  wordSpacing: 5,
                                  color: AppColors.darkTxt,
                                  fontSize: 40),
                              children: [
                                TextSpan(
                                    text: (BlocProvider.of<SubBloc>(context,
                                                listen: false)
                                            .state as SubsLoaded)
                                        .datas[position]
                                        .data!
                                        .selftext!
                                        .substring(
                                            1,
                                            ((BlocProvider.of<SubBloc>(context,
                                                            listen: false)
                                                        .state as SubsLoaded)
                                                    .datas[position]
                                                    .data!
                                                    .selftext!
                                                    .length -
                                                1))
                                        .fixUtf(),
                                    style: GoogleFonts.inter(
                                        color: AppColors.darkTxt, fontSize: 20))
                              ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: InkWell(
                          onTap: () {
                            (BlocProvider.of<SubBloc>(context, listen: false)
                                    .state as SubsLoaded)
                                .datas[position]
                                .data!
                                .url!
                                .launchInBrowser();
                          },
                          child: Icon(Icons.link_rounded),
                        ),
                      ),
                    )
                  ],
                ));
          },
          itemCount: (BlocProvider.of<SubBloc>(context, listen: false).state
                  as SubsLoaded)
              .datas
              .length,
        );
      },
    );
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.position);
    _pageController!.addListener(() {
      if (_pageController!.position.pixels ==
          _pageController!.position.maxScrollExtent) {
        BlocProvider.of<SubBloc>(context, listen: false)
            .add(EndOfListReached());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }
}

extension NumberParsing on String {
  String fixUtf() {
    return this.replaceAll("&amp;", "&");
  }
}
