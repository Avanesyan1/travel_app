import 'package:flutter/material.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/models/news_info.dart';
import 'package:travel_app/pages/home_pages/news_card.dart';

class  NewsList extends StatelessWidget {
  final List<newsInfo> news;

  const NewsList({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: white,
        automaticallyImplyLeading: false,
        title: const Text('Новости'),
        centerTitle: true,
      ),
      body: Padding(
        padding: a16,
        child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            return NewsCard(news: news[index]);
          },
        ),
      ),
    );
  }
}
