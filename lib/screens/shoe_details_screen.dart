import 'package:e_commerce_shoe_app/models/shoes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailsScreen extends StatelessWidget {
   DetailsScreen({Key? key,@required this.shoes}) : super(key: key);


   ShoeModel? shoes;


  @override
  Widget build(BuildContext context) {
    TextStyle tittleStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 18, fontWeight: FontWeight.bold);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Shoe Details",
          style: tittleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/3,
              child: ListView.builder(
                scrollDirection:Axis.horizontal,
                itemCount: shoes!.images!.length,
                itemBuilder: (context, index) => 
                 Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image:NetworkImage(
                          shoes!.images![0]),
                      ),
                       borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  shoes!.title.toString(),
                  style: tittleStyle,
                ),
                Text(
                  "- 1 +",
                  style: tittleStyle,
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "${shoes!.price}",
              style: tittleStyle,
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  "3.9",
                  style: tittleStyle,
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Wrap(
              children: [
                Text("Description:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(shoes!.description!, style: tittleStyle),
              ],
            ),
            SizedBox(height: 150,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 55,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.blue)),
                  child: Icon(
                    Icons.favorite_outline_rounded,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
                const SizedBox(
                    width: 10,
                  ),
                Expanded(
                  child: Material(
                    color: Color(0xff4faffa),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                            child: Text(
                          "Add to Cart",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
