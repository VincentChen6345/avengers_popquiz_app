import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


///////////////////////////////
//create new quizbrain object
//must do this after creating a QuizBrain class
QuizBrain quizBrain = new QuizBrain();
///////////////////////////////
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Avengers(),
    ));

class Avengers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuestionPage(),
    );
  }
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  ////////////////
  //Variables and functions
  ////////////////
  List<Widget> scoreKeeper = [];

  int choiceNumber = 1;
  int questionNumber = quizBrain.getQuestionNumber() + 1;
  var checkIcon= Icon(
    Icons.check,
    color: Colors.green,
  );
  var closeIcon=Icon(
    Icons.close,
    color: Colors.red,
  );

  void nextQNumber() {
    if (questionNumber <= 9) {
      questionNumber++;
    }
  }
  void alertPopUp({required String heading, required String description, required String img}){
    Alert(
      context: context,
      title: "$heading",
      desc: "$description",
      image: Image.asset("images/$img.jpeg"),
    ).show();
  }
  void resetQuiz(){
    quizBrain.reset();
    scoreKeeper=[];
  }
  void checkFunction({required int choiceNumber}) {
    setState(() {
      //CHECK IF THE QUIZ IS FINISHED?
      // print(scoreKeeper);
      if (quizBrain.isFinished() == true) {
        print('finished');

        //count number of ticks from the list
        var numOfChecks=scoreKeeper.map((e) => e == checkIcon ? 1:0).reduce((x,e)=>x+e);
        print(numOfChecks);
        //create flutter alert for 10/10
        if(numOfChecks==9){
          alertPopUp(heading: 'AVENGERS ASSEMBLE!', description: 'Congratz! 10/10', img:'avengers_assemble');
          resetQuiz();
        }else if
        //create alert for >4/10
        (numOfChecks>4){
          alertPopUp(heading: 'So you\'re the spiderboy...spiderling..crime fighting spider', description: '$numOfChecks/10, Keep training kid', img:'spiderman');
          resetQuiz();
        }else
        // create alert for <4/10
            {
          alertPopUp(heading: 'Reality is often disappointing',
              description:'$numOfChecks /10 ... Thanos has decided to erase you',
              img:'thanos');
          resetQuiz();
        }

      } else {
        /////IF CORRECT CHOICE
        if (choiceNumber == quizBrain.getCorrectAnswer()) {
          print('correct');
          //ADD TICK
          scoreKeeper.add(checkIcon);
          //Next question
          quizBrain.nextQuestion();
          nextQNumber();
        } else {
          print('incorrect');
          //ADD CROSS
          scoreKeeper.add(closeIcon);
          //Next question
          quizBrain.nextQuestion();
          nextQNumber();
        }
      }
    });
  }

  ////////////////
  ///////////////
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/avengers.jpeg'),
        fit: BoxFit.cover,
      )),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Color(0x74000000),
                      height: 80,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Text(
                                'Avengers PopQuiz',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 6
                                    ..color = Colors.blue,
                                ),
                              ),
                              Text(
                                'Avengers PopQuiz',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Color(0xB9000000),
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(' Question $questionNumber ',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                          Text(
                            quizBrain.getQuestion(),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextButton(
                  onPressed: () {
                    checkFunction(choiceNumber: 1);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.yellow.shade600),
                  child: Text(
                    quizBrain.getOption1(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  )),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5),
              child: TextButton(
                  onPressed: () {
                    checkFunction(choiceNumber: 2);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.green.shade600),
                  child: Text(
                    quizBrain.getOption2(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  )),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextButton(
                  onPressed: () {
                    checkFunction(choiceNumber: 3);
                  },
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                  child: Text(
                    quizBrain.getOption3(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  )),
            )),
            Row(children: scoreKeeper)

          ],
        ),
      ),
    );
  }
}
