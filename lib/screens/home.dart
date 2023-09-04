import 'package:flutter/material.dart';
import 'package:search_zip_code/components/search_response.dart';

import '../components/form.dart';
import '../models/address.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Address? address;

  setAddress(Address newAddress) {
    setState(() {
      address = newAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buscar endereço"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(
            child: Text("Informe o CEP e encontro o endereço"),
          ),
          FormCep(
            label: "CEP:",
            hint: "Informe um CEP válido",
            setAddress: (newAddress) => setAddress(newAddress),
          ),
          address == null
          ? const Center(
            child: Text("Aguardando"),
          )
          : SearchResponse(address: address!)
        ],
      ),
    );
  }
}