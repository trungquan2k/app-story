import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_test/feature/category/category_page.dart';
import 'package:project_test/feature/category/home_cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final StreamController<bool> isSwitchingTabStream = StreamController<bool>();
  bool isSwitchingTab = true;
  List<String> tabLabels = ["Cập nhật", "Danh mục", "Đã full", "Sáng tác"];
  late TabController _tabController;
  @override
  void initState() {
    isSwitchingTabStream.stream.listen((value) {
      isSwitchingTab = value;
      setState(() {});
    });
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    isSwitchingTabStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        actions: <Widget>[
          ClipRRect(
            child: Container(
              padding: const EdgeInsets.all(0),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          IconButton(
            // icon: Assets.icons.bell.image(width: 24, height: 24),
            icon: Icon(Icons.book, size: 24, color: Colors.grey),
            onPressed: () async {},
          ),
        ],
        title: ClipRRect(
          child: Container(
            width: 150,
            padding: const EdgeInsets.all(0),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Trang chủ",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ),
        ),
      ),
      body: Column(children: [
        Align(
          alignment: Alignment.center,
          child: IgnorePointer(
            ignoring: !isSwitchingTab,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              // indicatorWeight: 3,
              indicatorColor: Color(0xff10AE6A),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 3),
              controller: _tabController,
              isScrollable: true,
              labelColor: Color(0xff10AE6A),
              unselectedLabelColor: Color(0xff4D4D4D),
              unselectedLabelStyle:
                  const TextStyle(fontSize: 16, color: Colors.black87),
              labelStyle: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff10AE6A),
                  fontWeight: FontWeight.bold),
              tabs: tabLabels.map((e) => Tab(text: e)).toList(),
            ),
          ),
        ),
        Expanded(
          // flex: 15,
          child: Material(
            elevation: 5,
            child: Container(
              color: Colors.white,
              child: TabBarView(
                physics: (!isSwitchingTab)
                    ? NeverScrollableScrollPhysics()
                    : ClampingScrollPhysics(),
                controller: _tabController,
                children: [
                  // ViewCategory(),
                  Container(
                    child: Text("atb 5"),
                  ),
                  BlocProvider<HomeCubit>(
                      create: (BuildContext context) {
                        final cubit = HomeCubit();
                        cubit.getAllCategory();
                        return cubit;
                      },
                      child: const ViewCategory()),
                  Container(
                    child: Text("atb 5"),
                  ),
                  Container(
                    child: Text("atb 5"),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
