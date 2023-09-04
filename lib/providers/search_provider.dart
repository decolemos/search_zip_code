import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:search_zip_code/models/address.dart';

class SearchProvider extends ChangeNotifier {

  final String urlViaCep = "https://viacep.com.br/ws";

  Future<Address> searchZipCode(String cep) async {
    final response = await http.get(Uri.parse("$urlViaCep/$cep/json/"));

    log("$urlViaCep/$cep/json/");
    log(response.statusCode.toString());
    log(response.body);

    if(response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final address = Address(
        cep: jsonResponse["cep"], 
        logradouro: jsonResponse["logradouro"], 
        complemento: jsonResponse["complemento"], 
        bairro: jsonResponse["bairro"], 
        localidade: jsonResponse["localidade"], 
        uf: jsonResponse["uf"], 
        ibge: jsonResponse["ibge"], 
        gia: jsonResponse["gia"], 
        ddd: jsonResponse["ddd"], 
        siafi: jsonResponse["siafi"]
      );
      return address; 
    } else {
      throw Exception("Erro na busca do CEP: ${response.statusCode.toString()}");
    }
  }
}