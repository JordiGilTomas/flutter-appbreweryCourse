import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
final String apiKey = DotEnv().env['API_KEY'];

class CoinData {
  Map<String, String> getCoinData(String selectedCurrency) {
    Map<String, String> result = Map();

    cryptoList.map((crypto) async {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency/?apikey=$apiKey';

      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        final lastPrice = decodedData['rate'].toStringAsFixed(2);
        result[crypto] = lastPrice;
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    });
    return result;
  }
}
