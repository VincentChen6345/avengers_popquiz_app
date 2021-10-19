import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List _questionBank = [
    Question(
        questionText: 'What is Tony Stark\'s superhero name?',
        option1: 'Metal Man',
        option2: 'Ironman',
        option3: 'Laser Guy',
        correctAnswer: 2),
    Question(
        questionText: 'What is Vision\'s power source?',
        option1: 'The Mind Stone',
        option2: 'The Soul Stone',
        option3: 'The Space Stone',
        correctAnswer: 1),
    Question(
        questionText: 'What is Captain America\'s catchphrase?',
        option1: 'I am justice',
        option2: 'I can do this all day',
        option3: 'I hate bullies',
        correctAnswer: 2),
    Question(
        questionText: 'What is Thano\'s Infinity Gauntlet made out of?',
        option1: 'Vibranium',
        option2: 'Adamantium',
        option3: 'Uru',
        correctAnswer: 3),
    Question(
        questionText: 'What is the name of Odin\'s weapon of choice?',
        option1: 'Mjolnir',
        option2: 'Gungnir',
        option3: 'Ragnarok',
        correctAnswer: 2),
    Question(
        questionText: 'What is Thor\'s title?',
        option1: 'God of Hammers',
        option2: 'God of Thunder',
        option3: 'God of Mischief',
        correctAnswer: 2),
    Question(
        questionText:
            'What movie does Peter Parker reference in `Captain America, Civil War`?',
        option1: 'Aliens',
        option2: 'Empire Strikes Back',
        option3: 'Flash Gordon',
        correctAnswer: 2),
    Question(
        questionText: 'What is Scarlett Witch\'s superpower?',
        option1: 'Super Speed',
        option2: 'Time Manipulation',
        option3: 'Telekinesis and Mind Control',
        correctAnswer: 3),
    Question(
        questionText: 'Who injured Nick Fury\'s eye? ',
        option1: 'Skrulls',
        option2: 'Captain Marvel',
        option3: 'His Cat',
        correctAnswer: 3),
    Question(
        questionText: 'Who is the strongest Avenger?',
        option1: 'Scarlett Witch',
        option2: 'Thor',
        option3: 'Dr Strange',
        correctAnswer: 3),
  ];

  getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  getQuestionNumber() {
    return _questionNumber;
  }

  getOption1() {
    return _questionBank[_questionNumber].option1;
  }

  getOption2() {
    return _questionBank[_questionNumber].option2;
  }

  getOption3() {
    return _questionBank[_questionNumber].option3;
  }

  getCorrectAnswer() {
    return _questionBank[_questionNumber].correctAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  reset() {
    _questionNumber = 0;
  }

  isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

}
