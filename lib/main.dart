

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  const MyApp({super.key});
  Widget build(BuildContext context){
    return MaterialApp(home: QuizApp());
  } 

}

class QuizApp extends StatefulWidget{
  const QuizApp({super.key});
  @override
  State createState(){
    return _QuizAppState();
  }

}

class _QuizAppState extends State<QuizApp>{

  int currentQuestionIndex=0;
  int selectedAnswerIndex = -1;
  bool isQuestionPage=true;
  int marks=0;


  List<Map>questions=[
    {
      'question':'What is the size of an int variable in Java?',
      'answers':['2bytes','4bytes','8bytes','Depends on system'],
      'correctanswer':1,
    },
  {
    'question': 'Which of the following is not a Java keyword?',
    'answers': ['static', 'true', 'void', 'private'],
    'correctanswer': 1,
  },
  {
    'question': 'What will happen if you divide an integer by zero in Java?',
    'answers': ['Returns 0', 'Runtime error', 'Compile-time error', 'Infinity'],
    'correctanswer': 1,
  },
  {
    'question': 'Which concept allows code reuse in Java?',
    'answers': ['Encapsulation', 'Inheritance', 'Polymorphism', 'Abstraction'],
    'correctanswer': 1,
  },
  {
    'question': 'Which of these is used to handle exceptions in Java?',
    'answers': ['try-catch', 'finally-throw', 'if-else', 'for-while'],
    'correctanswer': 0,
  },
  ];

  WidgetStatePropertyAll<Color?> checkAnswer(int answerIndex) {
    if (selectedAnswerIndex != -1) {
      if (answerIndex == questions[currentQuestionIndex]['correctanswer']) {
        return WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        return WidgetStatePropertyAll(Colors.red);
      } 
      else {
        return WidgetStatePropertyAll(null);
      }
    } else {
      return WidgetStatePropertyAll(null);
    }
  }

  void Score(int answerIndex){
    if(selectedAnswerIndex!=-1){
      if(answerIndex== questions[currentQuestionIndex]['correctanswer']){
        marks++;

      }
    }
    setState(() {});
  }

  Widget build(BuildContext context){
  return quizAppPage();
  }

  Scaffold quizAppPage(){
    if(isQuestionPage){
  return Scaffold(
    appBar: AppBar(
      title:Text("QuizApp",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.white)),
      backgroundColor: Colors.black,
      centerTitle: true,
    ),

    body:Column(
     
      children: [

        const SizedBox(height:10),
      
      Row(children: [
      const SizedBox(width:135),
 
        Text(
        "Question:${currentQuestionIndex+1}/${questions.length}",
        style:TextStyle(fontSize: 30,fontWeight: FontWeight.w600),
      ),


      ],),
      

      const SizedBox(height: 50),


      SizedBox(
        height: 50,
        width: 400,
        child:Text(
          "${questions[currentQuestionIndex]['question']}",
          style:TextStyle(fontSize: 20,fontWeight: FontWeight.w600)
        ),
      ),

      const SizedBox(height: 20),

      SizedBox(
        height: 50,
        width:300,

        child:ElevatedButton(
          style:ButtonStyle(backgroundColor: checkAnswer(0)),

          onPressed: (){
            if(selectedAnswerIndex==-1){
              selectedAnswerIndex=0;
              Score(0);
              setState((){});
            }
          },
          child:Text(
            "${questions[currentQuestionIndex]['answers'][0]}",
            style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600)

          )
        )
      ),
      SizedBox(height: 15),
      SizedBox(
        height: 50,
        width:300,

        child:ElevatedButton(
          style:ButtonStyle(backgroundColor: checkAnswer(1)),

          onPressed: (){
            if(selectedAnswerIndex==-1){
              selectedAnswerIndex=1;
              Score(1);
              setState((){});
            }
          },
          child:Text(
            "${questions[currentQuestionIndex]['answers'][1]}",
            style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600)

          )
        )
      ),
            SizedBox(height: 15),

      SizedBox(
        height: 50,
        width:300,

        child:ElevatedButton(
        style:ButtonStyle(backgroundColor: checkAnswer(2)),

          onPressed: (){
             if(selectedAnswerIndex==-1){
              selectedAnswerIndex=2;
              Score(2);
              setState((){});
            }
          },
          child:Text(
            "${questions[currentQuestionIndex]['answers'][2]}",
            style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600)

          )
        )
      ),
            SizedBox(height: 15),

      SizedBox(
        height: 50,
        width:300,

        child:ElevatedButton(
          style:ButtonStyle(backgroundColor: checkAnswer(3)),

          onPressed: (){
             if(selectedAnswerIndex==-1){
              selectedAnswerIndex=3;
              Score(3);
              setState((){});
            }
          },
          child:Text(
            "${questions[currentQuestionIndex]['answers'][3]}",
            style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600)

          )
        )
      ),
   ],),

  floatingActionButton:
   SizedBox(
    width:100,
    
    child:FloatingActionButton(
    onPressed: (){
      if(selectedAnswerIndex!=-1){
        if(currentQuestionIndex<questions.length-1){
          currentQuestionIndex++;
          selectedAnswerIndex=-1;
        }
        else{
          isQuestionPage=false;
        }
      }
      setState(() {});


    },
    child: Text("Next",style: TextStyle(fontSize: 25,color: Colors.white),),
    backgroundColor: Colors.blue,
  

  ),
  
),
  
);

}
else{
  return Scaffold(
     appBar: AppBar(
      title:Text("QuizApp",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.white)),
      backgroundColor: Colors.black,
      centerTitle: true,
    ),

    body:Center(
      child: Column(children: [
         Image.network(
                "https://i.pinimg.com/1200x/fe/03/de/fe03de80cec8372ed64e0d24e10f3e60.jpg",
                width: 500,
                height: 500,
              ),

        SizedBox(height:30),

        Text("Score:${marks}/${questions.length}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

      SizedBox(height: 20,),

      ElevatedButton(
        
        onPressed: (){
          setState(() {
            selectedAnswerIndex=-1;
            currentQuestionIndex=0;
            marks=0;
            isQuestionPage=true;
          });
        },

      
      child: Text("Restart"),
      
      )


    ],),)

  );
}

}

}



