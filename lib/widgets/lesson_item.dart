import 'package:flutter/material.dart';
import '../theme/color.dart';
import 'custom_image.dart';

class LessonItem extends StatelessWidget {
  LessonItem({Key? key, required this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomImage(
            data["image"],
            radius: 10,
            width: 70,
            height: 70,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data["name"],
                    style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.schedule_outlined,
                      color: labelColor,
                      size: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(data["duration"],
                        style: TextStyle(color: labelColor, fontSize: 13)),
                  ],
                )
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: labelColor,
            size: 15,
          )
        ],
      ),
    );
  }
}
