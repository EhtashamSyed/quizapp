import 'package:flutter/animation.dart';

 class questions {
   late String questionText;
   late bool  questionAns;
   questions({ required String q, required bool a }){
     questionText = q;
     questionAns = a;
   }
 }