import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled24/Constants.dart';
import 'package:untitled24/QuizScreen.dart';
import 'package:untitled24/yourTurn.dart';

import 'QuizScreen.dart';

class Vote extends StatelessWidget {
  bool playerCorrect = false;
  int indexPlayer = 0;
  int QueIndex = 0;
  int AnsIndex = 0;
  Vote(int playerIndex,int QuestionIndex,int AnswerIndex,bool isCorrect)
  {
    indexPlayer = playerIndex;
    QueIndex = QuestionIndex;
    AnsIndex = AnswerIndex;
    playerCorrect = isCorrect;

  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset('assets/background.svg',fit: BoxFit.fill,)),
            SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("برأيكم كمجموعة هل ${PlayerArray[turnCounter][0]} إجابته صحيحة ؟",style: TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                    InkWell(
                      onTap: ()
                      {
                        if(!playerCorrect)
                          {
                            PlayerArray[turnCounter][1]+=10;

                          }
                        else
                          PlayerArray[turnCounter][1]+=0;


                        if(turnCounter<playernum) {
                          if(turnCounter-playernum==-1)
                          {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => yourTurn(0)));
                            turnCounter = 0;
                          }
                          else{
                            int next = turnCounter++;
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => yourTurn(next)));
                          }

                        }


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
                        child: Text("إجابة صحيحة",style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(height: 6,),
                    InkWell(
                      onTap: ()
                      {
                        if(turnCounter<playernum) {
                          if(turnCounter-playernum==-1)
                          {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => yourTurn(0)));
                            turnCounter = 0;
                          }
                          else{
                            int next = turnCounter++;
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => yourTurn(next)));
                          }
                        }





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
                        child: Text("إجابة خاطئة",style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black,fontWeight:FontWeight.bold ),),
                      ),
                    ),

                  ],
                )),
          ],
        ),
      ),
    );
  }
}
