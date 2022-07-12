import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:untitled24/Constants.dart';
import 'package:untitled24/main.dart';
import 'package:untitled24/yourTurn.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}
int counter = 0;
class _WelcomeScreenState extends State<WelcomeScreen> {
  final PlayerController = TextEditingController();
  bool validate = false;
  @override
  Widget build(BuildContext context) {


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SvgPicture.asset('assets/background.svg',fit: BoxFit.fill,)),
            SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(flex: 2,),
                      Text("ادخل اسم اللاعب رقم ${counter},",style: Theme.of(context).textTheme.button!.copyWith(color: Colors.white,fontSize: 40),),
                      Spacer(flex: 1,),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(

                            controller: PlayerController,
                            decoration: InputDecoration(
                              focusedBorder:OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.white54, width: 1.0),
                                    borderRadius: BorderRadius.circular(12.0),),
                              filled: true,
                              fillColor: Color(0xFF1C2341),
                              hintText: "اسم اللاعب",
                              hintStyle: TextStyle(color: Colors.white54),
                              errorText: validate?"قم بإدخال اسم لاعب": null,
                              errorStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),




                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              )
                            ),
                            style: TextStyle(color: Colors.white),

                            ),
                          ),
                        ),
                      Spacer(),
                      InkWell(
                        onTap: ()
                        {

                          if(counter<playernum)
                          {
                            if(PlayerController.text.isEmpty)
                            {
                              validate=true;
                            }
                            else
                            {
                              validate = false;
                              PlayerArray.add(["${PlayerController.text}",0]);
                              PlayerController.clear();
                              counter++;
                            }
                          }

                          else{
                              print(PlayerArray);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> yourTurn(turnCounter)));
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
                          child: Text("التالي",style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black),),
                        ),
                      ),
                      Spacer(flex: 2,),

                    //TODO: Change the look of player insert to text fields and a button to go to the quiz

                    ],
                  ),
                )
            )


          ],
        ),
      ),
    );
  }
}
