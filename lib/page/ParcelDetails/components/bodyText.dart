import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BodyText extends StatelessWidget {
  const BodyText(
      {super.key,
      this.fontsize = 15,
      required this.text,
      this.color,
      this.textAlign = TextAlign.center,
      this.fontWeight = false});
  final double fontsize;
  final String text;
  final Color? color;
  final TextAlign textAlign;
  final bool fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: fontWeight ? FontWeight.bold : FontWeight.normal,
          fontSize: fontsize.sp,
          color: color ?? Theme.of(context).textTheme.bodyText1!.color),
    );
  }
}
