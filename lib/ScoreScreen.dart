import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled24/PlayersScreen.dart';
import 'package:untitled24/WelcomeScreen.dart';

import 'Constants.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  _ScoreScreenState createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
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
              child: SvgPicture.asset('assets/background.svg',fit: BoxFit.fill,),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: PlayerArray.length,
                          itemBuilder: (BuildContext context, int index)
                          {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${PlayerArray[index][0]}",style: TextStyle(fontSize: 30,color: Colors.white),),
                                  Text("${PlayerArray[index][1]}",style: TextStyle(fontSize: 30,color: Colors.white),)

                                ],
                              ),
                            );
                          }
                      ),
                    ),
                    InkWell(
                      onTap: ()
                      {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=> PlayersScreen()));


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
                        child: Text("بدء من جديد",style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
