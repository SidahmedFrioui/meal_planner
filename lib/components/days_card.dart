import 'package:flutter/material.dart';

class DaysCard extends StatelessWidget {
  const DaysCard({super.key, required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  this.day,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.visibility,
                    color: Colors.redAccent,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.redAccent,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
