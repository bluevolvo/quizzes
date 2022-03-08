import 'package:flutter/material.dart';

class LandingPageListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  LandingPageListTile(
      {required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: ListTile(
        tileColor:  Colors.blue[400],
        leading: Icon(
          icon,
          size: 35,
          color: Colors.white
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            title,
            style:  TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.blue[500]),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Text(
            subtitle,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
