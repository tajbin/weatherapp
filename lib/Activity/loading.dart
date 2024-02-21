import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/Activity/home.dart';
import 'package:weatherapp/Worker/worker.dart ';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {


  @override
  State<Loading> createState() => _LoadingState();

}

class _LoadingState extends State<Loading> {
  String Temperature  = "Loading";
  Future<void> startApp() async
  {
    String tmp;
    String hum;
    String aSpeed;
    String des;
    String mainn;

    Worker instance= Worker(location: "mumbai");
     await instance.getData();

     tmp = instance.temp.toString();
     hum = instance.humidity.toString();
     aSpeed= instance.airSpeed.toString();
     des=instance.desc.toString();
     mainn=instance.main.toString();
     Future.delayed(Duration(seconds: 3),(){
       Navigator.pushReplacementNamed(context, '/home', arguments: {
         "temp_value": tmp,
         "hum_value" : hum,
         "air_speed_valu": aSpeed,
         "des_value": des,
         "main_value" : mainn

       });

     });

  }
  //const Loading({super.key});
 @override
  void initState() {
    // TODO: implement initState
   startApp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo.png',height: 200,width: 200,),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text("Weather App",
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: Colors.white70

                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text("Develop By Tasbin",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white54
                ),),
              ),
         SpinKitWave(
          color: Colors.blue,
          size: 50.0,
        ),


            ],
          )
       ),
      backgroundColor: Colors.blue[200],
     );
  }
}
