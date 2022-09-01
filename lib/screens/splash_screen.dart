
import 'dart:async';
import 'dart:ui';

import 'package:e_commerce_shoe_app/screens/all_products_screen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // wait for 3 second beforing to the screen

 Timer(Duration(seconds: 2), ()=> Navigator.push(
  context,
 MaterialPageRoute(builder: (context)=>AllProductScreen()),
  ),
 );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  TextStyle shoptitleStyle =Theme.of(context). textTheme.bodyText1!.copyWith(fontSize: 30);

    return  Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("images/kicks.png")
              ),
              const SizedBox(height: 5,),
              RichText(text: TextSpan(
                text: "E-",style: shoptitleStyle, 
                children: [
                   TextSpan(text: "Shop",
                   style: shoptitleStyle.copyWith(color: Color.fromARGB(255, 113, 134, 114))
                   ),
                ]
              ),),
            ],
            ),
        )
      );
    
  }
}
