import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled24/Constants.dart';
import 'package:untitled24/QuizScreen.dart';

class yourTurn extends StatelessWidget {

  yourTurn(int playerIndex)
  {
    index = playerIndex;
  }
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset('assets/background.svg',fit: BoxFit.fill,)),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text("اعطوا الجوال ل${PlayerArray[turnCounter][0]}",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: ()
                    {
                      colorstile = [Colors.grey,Colors.grey,Colors.grey,Colors.grey];
                      IconsTile = [Icons.close,Icons.close,Icons.close,Icons.close];
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizScreen(turnCounter,RandomNum())));
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
                      child: Text("التالي",style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black),),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
