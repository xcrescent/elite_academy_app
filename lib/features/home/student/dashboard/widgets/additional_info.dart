import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdditionalInfo extends StatelessWidget {
  final Text text;
  final String label;
  final String value;
  final String category;
  final int index;
  final String detail;

  const AdditionalInfo({
    super.key,
    required this.text,
    required this.label,
    required this.value,
    required this.index,
    required this.category,
    required this.detail,
  });

// Color? get randomColor {
  //   final colors = [
  //     Colors.cyanAccent,
  //     Colors.orangeAccent, // selected
  //     Colors.pinkAccent,
  //     Colors.greenAccent, // selected
  //     Colors.lightBlueAccent,
  //   ];
  //   return colors[DateTime.now().microsecond % colors.length];
  // }

  static List<Color> selectedColor = [
    Color(0xFFD9D9D9),
    Colors.greenAccent,
    Colors.cyan,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topLeft,
      height: 245,
      padding: const EdgeInsets.all(10.0),
      width: 390,
      decoration: BoxDecoration(
        boxShadow: [
          //dark shadow at bottom right
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromARGB(255, 151, 150, 150)
                : const Color.fromARGB(255, 103, 102, 102),
            blurRadius: 5,
            offset: const Offset(1, 1),
          ),
          // white shadow at left
          BoxShadow(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromARGB(255, 35, 35, 35)
                : const Color.fromARGB(255, 231, 229, 229),
            blurRadius: 5,
            offset: const Offset(-1, -1),
          ),
        ],
        color: selectedColor[index],
        // shape: BoxShape.rectangle,
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromARGB(31, 19, 18, 18)
              : const Color.fromARGB(255, 230, 228, 228),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 75,
            // width: 80,
            // padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: text,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            category,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
            maxLines: 2,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            detail,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
