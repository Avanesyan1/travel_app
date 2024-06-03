import 'package:flutter/material.dart';
import 'package:travel_app/models/excursion_info.dart';
import 'package:travel_app/models/news_info.dart';
import 'package:travel_app/models/tour_info.dart';
import 'package:travel_app/pages/home_pages/excursion_list.dart';
import 'package:travel_app/pages/home_pages/news_list_page.dart';
import 'package:travel_app/pages/home_pages/profile_page.dart';
import 'package:travel_app/pages/home_pages/tour_list_page.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int _selectedIndex = 0;

  List pages = [
    NewsList(news: news),
    DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Туры'),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Лагеря'),
              Tab(text: 'Экскурсии'),
            ],
          ),
        ),
        body: TabBarView(
          children:[
            ToursList(tours: tours),
            ExcursionList(excursions: excursions),
          ],
        ),
      ),
    ),
    const UserProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              label: 'Новости', icon: Icon(Icons.newspaper)),
          BottomNavigationBarItem(
              label: 'Туры', icon: Icon(Icons.card_travel)),
          BottomNavigationBarItem(
              label: 'Профиль', icon: Icon(Icons.person))
        ],
      ),
    );
  }
}
