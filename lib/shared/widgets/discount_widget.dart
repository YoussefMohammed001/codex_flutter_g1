import 'package:flutter/material.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key, required this.discount});
final int discount;
  @override
  Widget build(BuildContext context) {
    return  Visibility(
      visible: discount > 0,
      child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red.withOpacity(0.5),
          ),
          child: Text("$discount % off",
            style: TextStyle(
                fontSize: 10,
              color: Colors.white
            ),
          )),
    );
  }
}
