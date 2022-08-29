import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle tittleStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 18, fontWeight: FontWeight.bold);
    var outlineInputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.0));
    return Scaffold(
      appBar: productsScreenAppBar(context, tittleStyle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15.0),
              child: Text(
                "Choose your brand",
                style: tittleStyle,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10),
                        border: outlineInputBorder,
                        focusedBorder: outlineInputBorder,
                        hintText: "Search for brand",
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        )),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Material(
                  color: Color(0xff4faffa),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.sort,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blueGrey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar productsScreenAppBar(BuildContext context, TextStyle tittleStyle) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leadingWidth: 80,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.grey[400]),
      automaticallyImplyLeading: false,
      leading: Container(
        margin: const EdgeInsets.only(left: 20),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: const DecorationImage(
              image: const NetworkImage(
                  "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
              fit: BoxFit.fill),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hello", style: tittleStyle),
          Text(
            "Arabian",
            style: tittleStyle,
          )
        ],
      ),
      actions: const [
        Icon(Icons.notifications),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
