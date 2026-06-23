import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecomm_474/ui/dashboard/bloc/product_bloc.dart';
import 'package:ecomm_474/ui/dashboard/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product_model.dart';

class NavHomePage extends StatelessWidget {
  List<String> mSliderImgPath = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyxa-eLd8zev29fJrS3QzTlELGkqngF4JKEplyHrpWRQ&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsd4kK67BG6vp6UqWDFpKsaJB0YMRgrK_6hRibt3FyLg&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREodNODEQbv_Dz9x3Ai7rubEGfxnfJ7gSon57P6xWZ0Q&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQALWckVvDJ-vIcC-y-wEq7bJrH-aHb-c3ky2BIvwxCZw&s=10"
  ];
  int currentBannerIndex = 0;

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
            StatefulBuilder(
                builder: (context, ss) {
                  return Stack(
                    children: [
                      CarouselSlider.builder(
                          itemCount: mSliderImgPath.length,
                          itemBuilder: (_, index, _) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 11),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          mSliderImgPath[index]),
                                      fit: BoxFit.cover
                                  )
                              ),
                            );
                          },
                          options: CarouselOptions(
                              onPageChanged: (value, _) {
                                currentBannerIndex = value;
                                ss(() {});
                              },
                              autoPlay: true,
                              viewportFraction: 1,
                              aspectRatio: 16 / 7,
                              autoPlayInterval: Duration(seconds: 2),
                              autoPlayAnimationDuration: Duration(seconds: 1),
                              autoPlayCurve: Curves.bounceOut
                          )),
                      Positioned(
                          bottom: 11,
                          child: SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Center(
                              child: DotsIndicator(
                                decorator: DotsDecorator(
                                  spacing: EdgeInsets.all(3),
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      side: BorderSide()
                                  ),
                                  activeSize: Size(22, 8),
                                  activeColor: Colors.black,
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      side: BorderSide()
                                  ),
                                ),
                                dotsCount: mSliderImgPath.length,
                                animate: true,
                                position: currentBannerIndex.toDouble(),
                                mainAxisSize: MainAxisSize.min,
                              ),
                            ),
                          ))
                    ],
                  );
                }
            ),
            SizedBox(
              height: 11,
            ),
            BlocBuilder<ProductBloc, ProductState>(builder: (_, state) {
              if (state is ProductLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepOrangeAccent,
                  ),
                );
              }

              if (state is ProductLoadedState) {
                return state.mProducts.isNotEmpty
                    ? Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.mProducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        mainAxisSpacing: 11,
                        crossAxisSpacing: 11
                      ),
                      itemBuilder: (_, index){
                        ProductModel currProduct = state.mProducts[index];
                        return Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Center(
                                      child: Image.network(
                                        currProduct.image ?? "",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Text(
                                    currProduct.name ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${currProduct.price}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),

                                      Row(
                                        children: [
                                          /*_colorDot(Colors.black),
                                          _colorDot(Colors.blue),
                                          _colorDot(Colors.orange),*/

                                          Container(
                                            margin:
                                            const EdgeInsets.only(left: 4),
                                            width: 20,
                                            height: 20,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Text(
                                              "+2",
                                              style: TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,

                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(12),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            )
                          ],
                        );
                      }
                                      ),
                    )
                    : Center(
                  child: Text("No Products Yet!!"),
                );
              }

              if (state is ProductErrorState) {
                return Center(
                  child: Text(state.errorMsg),
                );
              }

              return Container();
            })
          ],
        ),
      ),
    );
  }
}
