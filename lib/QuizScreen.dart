import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled24/Constants.dart';
import 'package:untitled24/ScoreScreen.dart';

import 'Vote.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen(int playerindex,int newQuesIndex)
  {
    playerIndex = playerindex;
    random = newQuesIndex;
  }

  @override
  _QuizScreenState createState() => _QuizScreenState();
}
int random = RandomNum();
Color answer = Colors.grey;
int playerIndex = 0;
int correct = sample_data[random]["answer_index"];
late bool isCorrect;

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality
      (
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SvgPicture.asset('assets/background.svg',fit: BoxFit.fill,)),//The BackGround
              SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(

                        padding: const EdgeInsets.only(top: 16.0,right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("يا ${PlayerArray[turnCounter][0]} السؤال هو :",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                            Expanded(
                              child: InkWell(
                                onTap: ()
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Vote(turnCounter,random,correct,isCorrect)));


                                },





                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(12))
                                  ),
                                  child: Text("تصويت",style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black,fontWeight:FontWeight.bold ),),
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0,),
                            Expanded(
                              child: InkWell(
                                onTap: ()
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ScoreScreen()));

                                },





                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(12))
                                  ),
                                  child: Text("إنهاء الجولة",style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black,fontWeight:FontWeight.bold ),),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.white,thickness: 0.6,),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Text("${sample_data[random]["question"]}؟",style: TextStyle(fontSize: 30),),
                                    Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          setState(() {


                                          });
                                          colorstile = [Colors.red,Colors.red,Colors.red,Colors.red];
                                          colorstile[correct] = Colors.green;
                                          IconsTile[correct] = Icons.done;
                                          isCorrect = checkAns(random, 0);
                                          if(isCorrect)
                                            PlayerArray[turnCounter][1]+=10;
                                          else
                                            PlayerArray[turnCounter][1]+=0;







                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 16),
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: colorstile[0]),
                                            borderRadius: BorderRadius.circular(15),

                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${sample_data[random]["options"][0]}",style: TextStyle(color: colorstile[0],fontSize: 16),),
                                              Container(
                                                height: 26,
                                                width: 26,
                                                decoration: BoxDecoration(
                                                    color: colorstile[0],
                                                    borderRadius: BorderRadius.circular(50),
                                                    border: Border.all(color: colorstile[0]),

                                                ),
                                                child: Icon(IconsTile[0],color: Colors.white,),
                                              )

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          int correct = sample_data[random]["answer_index"];
                                          setState(() {

                                          });
                                          colorstile = [Colors.red,Colors.red,Colors.red,Colors.red];
                                          colorstile[correct] = Colors.green;
                                          IconsTile[correct] = Icons.done;
                                          isCorrect = checkAns(random, 1);
                                          if(isCorrect)
                                            PlayerArray[turnCounter][1]+=10;
                                          else
                                            PlayerArray[turnCounter][1]+=0;




                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 16),
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: colorstile[1]),
                                            borderRadius: BorderRadius.circular(15),

                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${sample_data[random]["options"][1]}",style: TextStyle(color: colorstile[1],fontSize: 16),),
                                              Container(
                                                height: 26,
                                                width: 26,
                                                decoration: BoxDecoration(
                                                    color: colorstile[1],
                                                    borderRadius: BorderRadius.circular(50),
                                                    border: Border.all(color: colorstile[1])

                                                ),
                                                child: Icon(IconsTile[1],color: Colors.white,),
                                              )

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          int correct = sample_data[random]["answer_index"];
                                          setState(() {

                                          });
                                          colorstile = [Colors.red,Colors.red,Colors.red,Colors.red];
                                          colorstile[correct] = Colors.green;
                                          IconsTile[correct] = Icons.done;
                                          isCorrect = checkAns(random, 2);
                                          if(isCorrect)
                                            PlayerArray[turnCounter][1]+=10;
                                          else
                                            PlayerArray[turnCounter][1]+=0;




                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 16),
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: colorstile[2]),
                                            borderRadius: BorderRadius.circular(15),

                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${sample_data[random]["options"][2]}",style: TextStyle(color: colorstile[2],fontSize: 16),),
                                              Container(
                                                height: 26,
                                                width: 26,
                                                decoration: BoxDecoration(
                                                    color: colorstile[2],
                                                    borderRadius: BorderRadius.circular(50),
                                                    border: Border.all(color: colorstile[2])

                                                ),
                                                child: Icon(IconsTile[2],color: Colors.white,),
                                              )

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          int correct = sample_data[random]["answer_index"];
                                          setState(() {

                                          });
                                          colorstile = [Colors.red,Colors.red,Colors.red,Colors.red];
                                          colorstile[correct] = Colors.green;
                                          IconsTile[correct] = Icons.done;
                                          isCorrect = checkAns(random, 3);
                                          if(isCorrect)
                                            PlayerArray[turnCounter][1]+=10;
                                          else
                                            PlayerArray[turnCounter][1]+=0;



                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 16),
                                          padding: EdgeInsets.all(16),
                                          decoration: BoxDecoration(

                                            border: Border.all(color: colorstile[3]),
                                            borderRadius: BorderRadius.circular(15),

                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${sample_data[random]["options"][3]}",style: TextStyle(color: colorstile[3],fontSize: 16),),
                                              Container(
                                                height: 26,
                                                width: 26,
                                                decoration: BoxDecoration(

                                                    color: colorstile[3],
                                                    borderRadius: BorderRadius.circular(50),
                                                    border: Border.all(color: colorstile[3])

                                                ),

                                                child: Icon(IconsTile[3],color: Colors.white,),
                                              )

                                            ],
                                          ),
                                        ),
                                      ),
                                    ),





                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(30.0))
                              ),
                              width: double.infinity),

                          )
                      ),
                ],
              ))
            ],
          ),
        )
    );
  }

}




