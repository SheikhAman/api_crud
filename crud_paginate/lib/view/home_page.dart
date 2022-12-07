import 'dart:ui';

import 'package:crud_paginate/view_model/api_crud_provider.dart';
import 'package:crud_paginate/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utlis/utils.dart';
import '/base_client.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ApiCrudProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'API CRUD',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                  operation: 'GET',
                  description: 'Fetch users',
                  isLoading: provider.getGetLoading,
                  onPressed: () async {
                    await provider.getGetApi();
                    Utils.snakBar('GET API CALLED', context);
                  },
                  operationColor: Colors.greenAccent),
              SizedBox(
                height: 8,
              ),
              AppButton(
                  operation: 'POST',
                  description: 'Add user',
                  isLoading: provider.getPostLoading,
                  onPressed: () async {
                    await provider.getPostApi();
                    Utils.snakBar('POST API CALLED', context);
                  },
                  operationColor: Colors.brown),
              SizedBox(
                height: 8,
              ),
              AppButton(
                  operation: 'PUT',
                  description: 'Edit user',
                  isLoading: provider.getPutLoading,
                  onPressed: () async {
                    await provider.getPutApi();
                    Utils.snakBar('PUT API CALLED', context);
                  },
                  operationColor: Colors.orangeAccent),
              SizedBox(
                height: 8,
              ),
              AppButton(
                  operation: 'DEL',
                  description: 'Delete users',
                  isLoading: provider.getDeleteLoading,
                  onPressed: () async {
                    await provider.getDeleteApi();
                    Utils.snakBar('DELETE API CALLED', context);
                  },
                  operationColor: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
