import 'package:flutter/material.dart';
import 'package:travel_app/global/const.dart';
import 'package:travel_app/models/news_info.dart';

class NewsCard extends StatelessWidget {
  final newsInfo news;

  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: black,
      color: white,
      child: Padding(
        padding: a10,
        child: Column(
          mainAxisAlignment: spb,
          children:[
          Column(
              children: [
                Text(news.name,style: bf14w4,),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Text(news.info1,style: bf12w4,),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Text(news.info2,style: bf12w4,),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Text(news.info3,style: bf12w4,),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Text(news.info4,style: bf12w4,),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Text(news.info5,style: bf12w4,),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Text(news.info6,style: bf12w4,),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              ],
            ),
          Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    news.image_link,
                  )
                ),
             ]
            ),
          ],
        ),
      ),
     );
   
  }
}
