import 'package:flutter/material.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/models/tour_info.dart';
import 'package:travel_app/pages/home_pages/tour_info_page.dart';

class TourCard extends StatelessWidget {
  final tour_info tour;

  const TourCard({super.key, required this.tour});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => TourInfoPage(tour: tour)));
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
                  tour.image_link,
                  width: MediaQuery.of(context).size.width * 0.4,
                  )),
            )
          ),
           ]
          ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              Center(child: Text(tour.name,style: bf14w4,)),
              Text(tour.city,style: bf12w4,),
              Text('${tour.price.toString()}р',style: bf14w4,),

            ],
          ),
        ),
        ],
      ),
     )
   );
  }
}
