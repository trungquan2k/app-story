import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_test/data/model/category_model.dart';
import 'package:project_test/data/repo/book_respo.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());
  BookRepo service = BookRepo();
  List<BookModel> listBooks = [];
  late ScrollController _controller;
  bool isLast = false;

  init(ScrollController controller) {
    _controller = controller;
    _controller.addListener(getMoreWhenScrolled);
  }

  Future<void> add() async {
    listBooks = [];
    getAllCategory();
  }

  getAllCategory() async {
    startFetching();
    try {
      var result = await service.get();
      final List<dynamic> data = result;
      listBooks = data.map((book) => BookModel.fromJson(book)).toList();
      endFetching();
    } catch (e) {
      catchErrors(e.toString());
    }
  }

  getMoreWhenScrolled() async {
    if (isLast == false) {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // await loadMore();
      }
    }
  }

  startFetching() {
    isLast = false;
    emit(HomeState.loading());
  }

  endFetching() {
    emit(HomeState.success(listBooks));
  }

  catchErrors(String error) {
    emit(HomeState.error(error: error));
  }
}
