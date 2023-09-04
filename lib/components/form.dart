// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:search_zip_code/models/address.dart';
import 'package:search_zip_code/providers/search_provider.dart';

class FormCep extends StatefulWidget {

  final String label;
  final String hint;
  final void Function(Address newAddress) setAddress;

  const FormCep({
    Key? key,
    required this.label,
    required this.hint,
    required this.setAddress,
  }) : super(key: key);

  @override
  State<FormCep> createState() => _FormCepState();
}

class _FormCepState extends State<FormCep> {

  final _formKey = GlobalKey<FormState>();
  late String cep;

  Future<void> seachrCep() async {

    if(!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final addressData = await Provider.of<SearchProvider>(
      context, listen: false).searchZipCode(cep);

    widget.setAddress(addressData);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: "89254300",
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.hint
            ),
            validator: (value) {
              if(value == null || value.isEmpty) {
                return "O campo CEP não pode ser vazio!";
              } else if(value.length < 8) {
                return "Informe um CEP válido, minimo 8 caracteres!";
              }
              return null;
            },
            onSaved: (newValue) {
              cep = newValue!;
            },
          ),
          ElevatedButton(
            onPressed: () {
              seachrCep();
            }, 
            child: const Text("Buscar"))
        ],
      ),
    );
  }
}
