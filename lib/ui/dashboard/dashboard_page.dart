import 'package:ecomm_474/ui/dashboard/nav_pages/nav_cart_page.dart';
import 'package:ecomm_474/ui/dashboard/nav_pages/nav_home_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  List<Widget> mNavPages = [
    NavHomePage(),
    NavCartPage(),
    NavHomePage(),
    NavCartPage(),
    NavHomePage(),
  ];
  int selectedNavIndex = 2;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mNavPages[selectedNavIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                selectedNavIndex = 0;
              },
              icon: Icon(Icons.menu_open, color: Colors.grey, size: 30),
            ),
            IconButton(
              onPressed: () {
                selectedNavIndex = 1;
              },
              icon: Icon(Icons.favorite_border, color: Colors.grey, size: 30),
            ),
            SizedBox(width: 50),
            IconButton(
              onPressed: () {
                selectedNavIndex = 3;
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.grey,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                selectedNavIndex = 4;
              },
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {},
        child: Icon(Icons.home, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
