import 'package:flutter/material.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/models/excursion_info.dart';
import 'package:travel_app/pages/home_pages/excursion_info_page.dart';

class ExcursionCard extends StatelessWidget {
  final excursionInfo excursions;

  const ExcursionCard({super.key, required this.excursions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ExcursionInfoPage(excursion: excursions,)));
    },
    child :Card(
      shadowColor: black,
      color: white,
      child: Row(
        mainAxisAlignment: spb,
        children: <Widget>[
        Column(
          children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.16,
            child:  Padding(
              padding: a10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                    excursions.image_link,
                    width: MediaQuery.of(context).size.width * 0.4,
                  )
                ),
            )
          ),
           ]
          ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              Center(child: Text(excursions.name,style: bf14w6,)),
            ],
          ),
        ),
        ],
      ),
     )
   );
  }
}
