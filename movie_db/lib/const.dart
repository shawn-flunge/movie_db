
import 'package:flutter/cupertino.dart';

const API_KEY = 'your api key';
const AUTH_TOKEN ='yout token';

Map<int, Color> customColor =
{
  50:Color.fromRGBO(0 ,0 ,0 , .1),
  100:Color.fromRGBO(0 ,0 ,0 , .2),
  200:Color.fromRGBO(0 ,0 ,0 , .3),
  300:Color.fromRGBO(0 ,0 ,0 , .4),
  400:Color.fromRGBO(0 ,0 ,0 , .5),
  500:Color.fromRGBO(0 ,0 ,0 , .6),
  600:Color.fromRGBO(0 ,0 ,0 , .7),
  700:Color.fromRGBO(0 ,0 ,0 , .8),
  800:Color.fromRGBO(0 ,0 ,0 , .9),
  900:Color.fromRGBO(0 ,0 ,0 , 1),
};


Widget convertAverageToStar(var score){
     if(score>9.5){
      return Row(
        children: [
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
        ],
      );
    }
    else if(score>8){
      return Row(
        children: [
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
        ],
      );
    }
    else if(score>6){
      return Row(
        children: [
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
        ],
      );
    }
    else if(score>4){
      return Row(
        children: [
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
        ],
      );
    }
    else if(score >2){
      return Row(
        children: [
          Image.asset('assets/yellowStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
        ],
      );
    }
    else{
      return Row(
        children: [
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
          Padding(padding: EdgeInsets.symmetric(horizontal: 3),),
          Image.asset('assets/greyStar.png',height: 15,),
        ],
      );
    }
  }