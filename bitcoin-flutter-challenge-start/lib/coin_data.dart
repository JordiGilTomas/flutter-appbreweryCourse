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
  CoinData({this.base, this.quote});

  final String base;
  final String quote;

  Future<http.Response> getCoinData() async => http.get(
        coinAPIURL + '/$base/$quote',
        headers: {'X-CoinAPI-Key': apiKey},
      );
}
