import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:letters_to_juliet/widgets/ReadingApp.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(ReadingApp());
}


