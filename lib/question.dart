

class Question {

  //define variables
  String questionText = '';
  String option1 = '';
  String option2 = '';
  String option3 = '';
  int correctAnswer=0;

  //constructor function
  Question(
      {required String questionText,
      required String option1,
      required String option2,
      required String option3,
      required int correctAnswer}){
    this.questionText=questionText;
    this.option1=option1;
    this.option2=option2;
    this.option3=option3;
    this.correctAnswer=correctAnswer;
  }

}