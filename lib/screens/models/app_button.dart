import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:h2n_app/utils/constants.dart';

enum ButtonType { PRIMARY, PLAIN }

class AppButton extends StatelessWidget {
  final ButtonType type;
  final VoidCallback onPressed;
  final String text;

  const AppButton({Key? key, required this.type, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: getButtonColor(type),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(169, 176, 185, 0.42),
              spreadRadius: 0,
              blurRadius: 8.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.roboto(
              color: getTextColor(type),
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

Color getButtonColor(ButtonType type) {
  switch (type) {
    case ButtonType.PRIMARY:
      return Constants.primaryColor;
    case ButtonType.PLAIN:
      return Colors.white;
    default:
      return Constants.primaryColor;
  }
}

Color getTextColor(ButtonType type) {
  switch (type) {
    case ButtonType.PLAIN:
      return Colors.black54;
    case ButtonType.PRIMARY:
      return Colors.black54;
    default:
      return Colors.white;
  }
}
