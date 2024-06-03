import 'package:flutter/material.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/models/excursion_info.dart';
import 'package:travel_app/pages/home_pages/excursion_card.dart';

class ExcursionList extends StatelessWidget {
  final List<excursionInfo> excursions;

  const ExcursionList({super.key, required this.excursions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: a16,
      child: ListView.builder(
        itemCount: excursions.length,
        itemBuilder: (context, index) {
          return ExcursionCard(excursions: excursions[index]);
        },
      ),
    );
  }
}
