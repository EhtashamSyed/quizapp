import 'package:flutter/material.dart';
import 'package:quizapp/question.dart';
import 'package:quizapp/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main(){
  runApp(const MaterialApp(
    home: QuizApp(),
    debugShowCheckedModeBanner: false,
  ));
}
QuizBrain quizBrain = QuizBrain();
class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> scoreKeeper = [
     
  ];
  void checkAnswers(bool userPickedAns){
    bool correctans = quizBrain.getAnswerText();
    setState(() {
      //Use IF/ELSE to check if we have reached the end of the quize.
      // If so, on the next line, you can also use if(quizBrain.
      // isFinished()){},
      // It does the same thing.
      if(quizBrain.isFinished()==true) {
        //show an alert using rFlutter package
        //this is the code for the basic alert
        // for rFlutter Alert: Alert(context: context,
        // title: 'Great', dsc: 'Flutter is awesome').show();
        //Modified for our purposes:
        Alert(
          context: context,
          type: AlertType.success,
          title: "Finished!",
          desc: "You have reached end of the quiz",
          buttons: [
            DialogButton(
              child: const Text(
                "Start again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        quizBrain.reset();
        scoreKeeper = [];
      }else {
        if (userPickedAns == correctans) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),);
        }
        else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),);
        }
        quizBrain.nextQusetion();
      }
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Quiz App'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
              end: Alignment(0.8,0.4),
              colors: [Color(0xff355C7D),
                Color(0xff6C5878),
                Color(0xffC06C84),])
        ),
        child: Column(
          children:  [
             Expanded(
              flex: 3,
                child:Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    textAlign:TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),
                  ),

                )
            ),
            ElevatedButton(

              onPressed: () {
                 checkAnswers(true);
              },

              child: const Text('True',
                style: TextStyle(fontSize: 20 ),),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 50),
                  padding: const EdgeInsets.all(10),
                  primary:  Colors.green,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Colors.green)
                  )
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(

              onPressed: () {},

              child: const Text('False',
                style: TextStyle(fontSize: 20 ),),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 50),
                  padding: const EdgeInsets.all(10),
                  primary:  Colors.red,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(color: Colors.red)
                  )
              ),
            ),
            const SizedBox(height: 20,),
            Row(
             children:scoreKeeper,
            ),
            const SizedBox(height: 20,)

          ],
        ),
      ),

    );
  }
}
