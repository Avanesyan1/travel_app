import 'package:flutter/material.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/models/tour_info.dart';
import 'package:travel_app/pages/home_pages/tour_card.dart';

class ToursList extends StatelessWidget {
  final List<tour_info> tours;

  const ToursList({super.key, required this.tours});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: a16,
      child: ListView.builder(
        itemCount: tours.length,
        itemBuilder: (context, index) {
          return TourCard(tour: tours[index]);
        },
      ),
    );
  }
}
