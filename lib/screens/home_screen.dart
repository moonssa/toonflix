import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var webtoon = snapshot.data![index];
                  return Text(webtoon.title);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
