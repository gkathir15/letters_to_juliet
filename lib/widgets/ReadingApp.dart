import 'package:flutter/material.dart';
import 'package:letters_to_juliet/api/RedditClient.dart';
import 'package:letters_to_juliet/bloc/SubBloc.dart';

import 'package:letters_to_juliet/bloc/SubStatus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letters_to_juliet/widgets/ReadingWidget.dart';



class ReadingApp extends StatelessWidget {
  const ReadingApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: ReadingWidget(),
        create: (context) => SubBloc(SubEmpty(), RedditClient()));
  }
}

