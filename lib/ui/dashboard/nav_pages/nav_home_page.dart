import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NavHomePage extends StatelessWidget {
  List<String> mSliderImgPath = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyxa-eLd8zev29fJrS3QzTlELGkqngF4JKEplyHrpWRQ&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsd4kK67BG6vp6UqWDFpKsaJB0YMRgrK_6hRibt3FyLg&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREodNODEQbv_Dz9x3Ai7rubEGfxnfJ7gSon57P6xWZ0Q&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQALWckVvDJ-vIcC-y-wEq7bJrH-aHb-c3ky2BIvwxCZw&s=10"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF6F6F6)
                  ),
                  child: Center(
                    child: Icon(Icons.menu_outlined),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF6F6F6)
                  ),
                  child: Center(
                    child: Icon(Icons.notifications_none),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 11,
            ),
            CarouselSlider.builder(
                itemCount: mSliderImgPath.length, 
                itemBuilder: (_, index, _){
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 11),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      image: DecorationImage(
                        image: NetworkImage(mSliderImgPath[index]),
                        fit: BoxFit.cover
                      )
                    ),
                  );
                }, 
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  aspectRatio: 16/7,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.bounceOut
                ))
          ],
        ),
      ),
    );
  }
}
