import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled24/Constants.dart';
import 'package:untitled24/WelcomeScreen.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}
class _PlayersScreenState extends State<PlayersScreen> {
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
                      Spacer(flex: 2,),
                      Text("قم بإدخال عدد اللاعبين المشاركين,",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FloatingActionButton(
                                heroTag: "addition",
                                backgroundColor: Colors.white,
                                onPressed: (){
                                  playernum++;
                                  setState(() {
                                  });},
                                child: Icon(Icons.add,color: Colors.black,),),
                              SizedBox(width: 10,),
                              Text("${playernum}",style: TextStyle(fontSize: 25,color: Colors.white),),
                              SizedBox(width: 10,),
                              FloatingActionButton(
                                heroTag: "subtract",
                                backgroundColor: Colors.white,
                                onPressed: (){
                                  setState(() {});
                                  if(playernum>3)
                                    playernum--;

                                  },
                                child: Icon(Icons.remove,color: Colors.black,),),

                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const WelcomeScreen()));
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
                            child: Text("التالي",style: Theme.of(context).textTheme.button!.copyWith(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                      Spacer()
                    ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
