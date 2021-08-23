import 'package:e_commerce/shopX/product.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return productFromJson(jsonString);
    } else {
      //show error
      return null;
    }
  }
}
