import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.green,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 2,
          title: const Text(
            "오늘의 웹툰",
            style: TextStyle(
              fontFamily: 'NanumBrushScript',
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Text("There is Data!!!");
            }
            return const Text("Loading....");
          },
        ));
  }
}
