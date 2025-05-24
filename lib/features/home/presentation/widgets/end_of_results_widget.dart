import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EndOfResultsWidget extends StatelessWidget {
  const EndOfResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]),
      child: Text("-----End of results-----"),
    );
  }
}
