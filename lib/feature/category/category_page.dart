import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_test/feature/category/home_cubit/home_cubit.dart';
import 'package:project_test/format/format.dart';

class ViewCategory extends StatefulWidget {
  const ViewCategory({super.key});

  @override
  State<ViewCategory> createState() => _ViewCategoryState();
}

class _ViewCategoryState extends State<ViewCategory> {
  ScrollController _scrollController = ScrollController();

  late HomeCubit _bloc;
  @override
  void initState() {
    _bloc = context.read();
    _bloc.init(_scrollController);
    _bloc.getAllCategory();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is Error) {
        return const Text("Error");
      } else if (state is Loading) {
        return const Center(child: Text("Loading"));
      } else if (state is Success) {
        return RefreshIndicator(
            onRefresh: () async {
              _bloc.add();
            },
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  (state.listTypeBook.length / 2).ceil(), // number of rows
                  (rowIndex) => Row(
                    children: List.generate(
                      2, // number of items in each row
                      (columnIndex) {
                        final index = rowIndex * 2 + columnIndex;
                        if (index >= state.listTypeBook.length) {
                          return Expanded(child: SizedBox());
                        }
                        return Expanded(
                          child: Container(
                            height: 60, // set the height of each item here
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: GestureDetector(
                              onTap: () => {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Truyện ${state.listTypeBook[index].name}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black, height: 1.5),
                                  ),
                                  // Add more widgets here to show additional data
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ));
      }
      return Container();
    });
  }
}
