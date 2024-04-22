import 'package:flutter/material.dart';
import 'package:meal_planner/components/days_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> dayList = [
    'Saturday',
    'Sunday',
    'Monday',
    'Thuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home Page'),
        ),
      ),
      body: ListView.builder(
          itemCount: dayList.length,
          itemBuilder: (BuildContext context, int index) {
            return DaysCard(day: dayList[index]);
          }),
    );
  }
}
