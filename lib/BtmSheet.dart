import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      maxChildSize: .80,
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
          allowImplicitScrolling: true,
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
                        child: Center(child: Text(list[position].data!.title!)),
                      ),
                    ),
                    RichText(
                     text: TextSpan(
                        text: list[position].data!.selftext![0],
                         style: GoogleFonts.inter(
                         fontSize: 20),
                         children: [TextSpan(
                           text: list[position].data!.selftext!.substring(1,(list[position].data!.selftext!.length-1))
                         )]
                     ))
                  ],
                ));
          },
          itemCount: list.length,
        );
      },
    );
  }
}
