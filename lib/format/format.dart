import 'package:flutter/material.dart';

class ResultError<T> {
  final String? msg;
  final Exception? exception;
  final T? data;
  ResultError({this.msg, this.exception, this.data});
}

double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
double scaleWidth(BuildContext context) =>
    MediaQuery.of(context).size.width / 375;
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
