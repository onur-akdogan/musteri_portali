import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:musteri_portali/core/variables.dart';

Future<void> fetchData() async {
  var url = Uri.http(baseurl, 'fatura/faturalar');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print('Veri: ${json.decode(response.body)}');
  } else {
    print('Hata: ${response.statusCode}');
  }
}
