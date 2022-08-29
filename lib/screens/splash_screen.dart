
import 'dart:async';

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
              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.green,
              ),
              const SizedBox(height: 5,),
              RichText(text: TextSpan(
                text: "E-",style: shoptitleStyle, 
                children: [
                   TextSpan(text: "Shop",
                   style: shoptitleStyle.copyWith(color: Colors.green)
                   ),
                ]
              ),),
            ],
            ),
        )
      );
    
  }
}
