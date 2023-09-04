// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:search_zip_code/models/address.dart';

class SearchResponse extends StatefulWidget {

  final Address address;
  
  const SearchResponse({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  State<SearchResponse> createState() => _SearchResponseState();
}

class _SearchResponseState extends State<SearchResponse> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(widget.address.cep),
          Text(widget.address.logradouro),
          Text(widget.address.complemento),
          Text(widget.address.bairro),
          Text(widget.address.localidade),
          Text(widget.address.uf),
          Text(widget.address.ibge),
          Text(widget.address.gia),
          Text(widget.address.ddd),
          Text(widget.address.siafi)
        ],
      ),
    );
  }
}