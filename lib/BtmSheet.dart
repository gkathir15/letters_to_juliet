import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letters_to_juliet/AppColors.dart';
import 'package:letters_to_juliet/Sub.dart';
import 'package:letters_to_juliet/SubBloc.dart';
import 'package:letters_to_juliet/SubStatus.dart';

class BtmSheet extends StatelessWidget {
  int position = 0;

  BtmSheet(this.position);

  @override
  Widget build(BuildContext context) {
    late List<Children> list;

    var state = BlocProvider.of<SubBloc>(context, listen: false).state;
    if (state is SubsLoaded) {
      list = state.datas;
    }
    return DraggableScrollableSheet(
      maxChildSize: .90,
      expand: false,
      minChildSize: 0.25,
      initialChildSize: 0.5,
      builder: (BuildContext context, ScrollController scrollController) {
        return PageView.builder(
          controller: PageController(initialPage: position),
          onPageChanged: (pos){
            position = pos;
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
                    Container(color: AppColors.colorList[position%5],
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Center(child: Text(list[position].data!.title!.fixUtf(),
                          style: GoogleFonts.chivo(fontStyle: FontStyle.normal,fontSize: 20,color: AppColors.lightTxt),)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: RichText(textAlign: TextAlign.start,
                       text: TextSpan(
                          text: list[position].data!.selftext![0],
                           style: GoogleFonts.inter(
                             letterSpacing: 1,
                             wordSpacing: 5,
                             color: AppColors.darkTxt,
                           fontSize: 40),
                           children: [TextSpan(
                             text: list[position].data!.selftext!.substring(1,(list[position].data!.selftext!.length-1)).fixUtf(),style: GoogleFonts.inter(
                               color: AppColors.darkTxt,
                               fontSize: 20)
                           )]
                       )),
                    ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     mainAxisSize: MainAxisSize.max,
                     children: [
                     Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Align(alignment: Alignment.bottomRight,
                         child: InkWell(onTap: (){

                         },child: Icon(Icons.bookmark_add),),),
                     ),Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Align(alignment: Alignment.bottomLeft,
                         child: InkWell(onTap: (){

                         },child: Icon(Icons.link_rounded),),),
                     )
                   ],)
                  ],
                ));
          },
          itemCount: list.length,
        );
      },
    );
  }
}

extension NumberParsing on String {
  String fixUtf() {
    return this.replaceAll("&amp;", "&");
  }
}
