import 'dart:convert';

import 'package:project_test/config/back_end.dart';
import 'package:project_test/data/model/category_model.dart';
import 'package:project_test/format/format.dart';
import 'package:project_test/service/api_controller.dart';

class BookRepo {
  Future get() {
    return BaseApi.instance
        .getData(
      "https://truyen-clone.getdata.one/category",
    )
        .then((response) {
      if (response.statusCode == 200) {
        // final List<dynamic> data = response.data;
        // return data.map((book) => BookModel.fromJson(book)).toList();
        return response.data;
      }
    }).catchError((e) {
      print("eror:$e");
      // return ResultError();
    });
  }
}
