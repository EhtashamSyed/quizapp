import 'package:flutter/animation.dart';
import 'package:quizapp/question.dart';


class QuizBrain {
  int _questionsNumber = 0;
    final List<questions> _questionbank = [
    questions(q: 'An octopus has five hearts', a:false ),
    questions(q: 'Nicolas and john both married a same women', a:true ),
    questions(q: 'Donald Ducks middle name is Fauntleroy', a:true ),
    questions(q: 'The statue of Liberty was a gift from France', a:true ),
    questions(q: 'A meter is further than a yard', a:true ),
    questions(q: 'The currenct of France is Franc', a:true ),
  ];
  void  nextQusetion(){
      if(_questionsNumber <_questionbank.length - 1 ){
        _questionsNumber++;
      }


    }

    String getQuestionText (){
       return _questionbank[_questionsNumber].questionText;
  }
  bool getAnswerText() {
    return _questionbank[_questionsNumber].questionAns;
  }
  //a method called isFinished() here that checks if
// we have reached the last question.
// It should return an output >> true
// if we have reached the last question and
// false if we have not reached there.

  bool  isFinished(){
    if(_questionsNumber >= _questionbank.length-1){
        return true;     }
    else{
        return false;
     }


  }

//create a reset() method that sets the questionNumber back to 0.
  void reset(){

      _questionsNumber = 0;

  }

}