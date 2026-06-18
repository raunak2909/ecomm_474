import 'package:flutter/material.dart';

class NavCartPage extends StatelessWidget {
  const NavCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    child: Icon(Icons.arrow_back_ios, size: 16,),
                  ),
                ),
                Text("My Cart", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
                Container(
                  width: 50,
                  height: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
