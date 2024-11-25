import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoController {
  Future<Map<String, dynamic>> loadCategories() async {
    try {
      http.Response response = await http.get(Uri.parse('https://min-api.cryptocompare.com/data/top/mktcapfull?limit=10&tsym=USD'),
          headers: <String, String>{
            "Content-Type": 'application/json; charset=UTF-8',
            'authorization' : 'Apikey {01644ea6e1e3fe654d8a296fa1d51f007d597c782b413d85717fdeeea3ef75e1}'
          });

      //print(response.body);
      if (response.statusCode == 200) {
        //Ok
        //Get data from model constructor
        //final List<dynamic> data = jsonDecode(response.body);
        // List<CryptoEntity> categories =
        //     data.map((crypto) => CryptoEntity.fromJson(crypto)).toList();
        //return categories;

  //       List jsonResponse = json.decode(response.body);
  // return jsonResponse.map((job) => CryptoEntity.fromJson(job)).toList();
   Map<String, dynamic> jsonResponse = json.decode(response.body);
   //CryptoEntity cryptoEntity = CryptoEntity.fromJson(jsonDecode(response.body)) ;
  return jsonResponse;
      }else{
        //Throw an exception if the server responded with an error status code
        throw Exception('Failed to load Categories');
      }
    } catch (e) {
      throw Exception('Error loading Categories: $e');
    }
  }
}
