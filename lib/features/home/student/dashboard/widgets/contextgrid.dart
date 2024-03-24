import 'package:flutter/material.dart';

class Gridcontext extends StatelessWidget {
  final String title;
  final IconData iconData;

  const Gridcontext({
    Key? key,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 123,
      height: 17,
      decoration: ShapeDecoration(
        color: Color(0xFFDFE0F0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Spacer(),
          Icon(iconData),
          Spacer(),
          // Spacer(),
          // SizedBox(height: 4   ),
          SizedBox(
            // width: 69   ,
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              // style: CustomTextStyles.labelLargeSemiBold_1,
            ),
          ),
          SizedBox(height: 6),
          Spacer(),
        ],
      ),
    );
  }
}
