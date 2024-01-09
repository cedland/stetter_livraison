import 'package:flutter/material.dart';

class ClientSettings extends StatelessWidget {
  const ClientSettings({super.key, required this.icon, required this.text, required this.text2});

  final IconData icon;
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(icon, size: 26,),
                  const SizedBox(width: 10,),
                  Text(text, style:TextStyle(fontSize: 16, fontFamily: 'LatoRegular'),),
                ],
              ),
              Text(text2, style:TextStyle(fontSize: 16, fontFamily: 'LatoRegular'),)
            ],
          ),
        ),
      ),
    );
  }
}
