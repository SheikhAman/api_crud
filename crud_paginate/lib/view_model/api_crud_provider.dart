import 'package:flutter/material.dart';

import '../base_client.dart';

class ApiCrudProvider extends ChangeNotifier {
  //  Api get
  bool _getGetLoading = false;
  bool get getGetLoading => _getGetLoading;

  setGetLoading(value) {
    _getGetLoading = value;
    notifyListeners();
  }

  Future<dynamic> getGetApi() async {
    setGetLoading(true);
    var data = await BaseClient().get('/users/2').catchError((error) {});
    setGetLoading(false);
    if (data == null) return;
    debugPrint('get successful: $data.');
  }

  // Api post
  bool _getPostLoading = false;
  bool get getPostLoading => _getPostLoading;

  setPostLoading(value) {
    _getPostLoading = value;
    notifyListeners();
  }

  Future<dynamic> getPostApi() async {
    setPostLoading(true);
    var body = {'name': 'user', 'job': 'doctor'};
    var data = await BaseClient().post('/users', body).catchError((error) {});
    setPostLoading(false);
    if (data == null) return;
    debugPrint('post successful: $data.');
  }

  // Api put

  bool _getPutLoading = false;
  bool get getPutLoading => _getPutLoading;

  setPutLoading(value) {
    _getPutLoading = value;
    notifyListeners();
  }

  Future<dynamic> getPutApi() async {
    setPutLoading(true);
    var id = 2;
    var body = {'name': 'user', 'job': 'student'};
    var data =
        await BaseClient().put('/users/$id', body).catchError((error) {});
    setPutLoading(false);
    if (data == null) return;
    debugPrint('put successful: $data.');
  }

  // Api delete
  bool _getDeleteLoading = false;
  bool get getDeleteLoading => _getDeleteLoading;

  setDeleteLoading(value) {
    _getDeleteLoading = value;
    notifyListeners();
  }

  Future<dynamic> getDeleteApi() async {
    setDeleteLoading(true);
    var id = 2;
    var response =
        await BaseClient().delete('/users/$id').catchError((error) {});
    setDeleteLoading(false);
    if (response == null) return;
    debugPrint('deleted successful: $response ');
  }
}
