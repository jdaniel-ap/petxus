import 'package:flutter/material.dart';
import 'package:pets/const/colors.dart';

class SectionHeader extends StatelessWidget {
  String title;
  String? action;
  SectionHeader({Key? key, required this.title, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Satoshi',
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                action == null ? 'Ver mais' : action!,
                style: TextStyle(
                  fontFamily: 'Satoshi',
                  fontWeight: FontWeight.w500,
                  color: kMainDarker,
                  fontSize: 16,
                ),
              ))
        ],
      ),
    );
  }
}
