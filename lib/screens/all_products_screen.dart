import 'package:e_commerce_shoe_app/models/shoes_model.dart';
import 'package:e_commerce_shoe_app/network/shoes_network.dart';
import 'package:e_commerce_shoe_app/screens/shoe_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final AllShoesProductNetwork _allShoesProductNetwork =
      AllShoesProductNetwork();

  Future<List<ShoeModel>>? getShoes;

  @override
  void initState() {
    getShoes = _allShoesProductNetwork.getAllShoeProduct();
    super.initState();
  }

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
        child: SingleChildScrollView(
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
                  itemCount: brands.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(brands[index]),
                      backgroundColor: Colors.blueGrey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Products",
                        style: tittleStyle,
                      ),
                      Text("13 items")
                    ]),
              ),
              FutureBuilder<List<ShoeModel>>(
                  future: getShoes,
                  builder: (context, AsyncSnapshot<List<ShoeModel>> snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data![0].images![1]);
                      return ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.0,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => ProductsCard(
                            tittleStyle: tittleStyle,
                            allShoes: snapshot.data![index]),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
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
          image: DecorationImage(
              image: NetworkImage(
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

class ProductsCard extends StatelessWidget {
  ProductsCard({Key? key, required this.tittleStyle, this.allShoes})
      : super(key: key);

  final TextStyle tittleStyle;
  ShoeModel? allShoes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 234, 234),
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 150,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          GestureDetector(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://cdn.lorem.space/images/fashion/.cache/640x480/ian-dooley-TT-ROxWj9nA-unsplash.jpg"),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailsScreen(
                    shoes: allShoes
                  )
                  ));
            },
          ),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allShoes!.title.toString(),
                  style: tittleStyle.copyWith(fontSize: 13),
                ),
                Text("ID : ${allShoes!.id}"),
                Text("Category:${allShoes!.category!}"),
                Text(
                  allShoes!.price.toString(),
                  style: tittleStyle.copyWith(fontSize: 10),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.favorite_border_outlined),
                Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: const Color(0xff4faffa),
                    child: const Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

List brands = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScumRGeMSi2VnqpOktu4AL8vecHkWCMGjhxg&usqp=CAU"
      "https://images.unsplash.com/photo-1608541737042-87a12275d313?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bmlrZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuR2SvrTD_2l5VIuTLwl4eVIPh1WK37r4IAQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ37NUyqBg7HGgMhcmWfj-y6tWC-c2VbJtTwQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLivMVwUfAVjb4235Cy9OssyM-8aV4a7PH4g&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGgKM6e28_63gGt8aIPKXSs5pbWP74cu3KUg&usqp=CAU"
];
