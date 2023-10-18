import 'package:http/http.dart' as http;
import 'dart:convert';

class BitCoinApi {
  static Future<String> getExchangeRatesBTC(String base) async {
    var url =
        'https://rest.coinapi.io/v1/exchangerate/BTC/$base?apiKey=1B18744D-F147-4BB2-98AD-A838EC00A5EA';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String body = response.body;
      var decodedBody = jsonDecode(body);
      return decodedBody['rate'].toStringAsFixed(1);
    } else {
      return response.statusCode.toString();
    }
  }

  static Future<String> getExchangeRatesETH(String base) async {
    var url =
        'https://rest.coinapi.io/v1/exchangerate/ETH/$base?apiKey=1B18744D-F147-4BB2-98AD-A838EC00A5EA';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String body = response.body;
      var decodedBody = jsonDecode(body);
      return decodedBody['rate'].toStringAsFixed(1);
    } else {
      return response.statusCode.toString();
    }
  }

  static Future<String> getExchangeRatesLTC(String base) async {
    var url =
        'https://rest.coinapi.io/v1/exchangerate/LTC/$base?apiKey=1B18744D-F147-4BB2-98AD-A838EC00A5EA';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String body = response.body;
      var decodedBody = jsonDecode(body);
      return decodedBody['rate'].toStringAsFixed(1);
    } else {
      return response.statusCode.toString();
    }
  }
}
