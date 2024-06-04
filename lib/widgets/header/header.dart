import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          color: Colors.deepOrange),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Image.asset('assets/images/Screenshot 2024-05-22 162512.png',
                height: 40, fit: BoxFit.contain),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.asset('assets/images/ezgif-5-a072fb69b0.jpg',
                      height: 40, fit: BoxFit.contain),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
