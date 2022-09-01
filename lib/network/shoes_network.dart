import 'package:e_commerce_shoe_app/models/shoes_model.dart';
import 'package:http/http.dart';

class AllShoesProductNetwork  {
  //How to get the API


  Future<List<ShoeModel>>getAllShoeProduct() async {
    final response = await get(Uri.parse("https://api.escuelajs.co/api/v1/products"),);


    if(response.statusCode == 200){
       return shoeModelFromJson(response.body);

    }else{
      throw{
        Exception("failed to get data from API")
      };
    }

  }

}