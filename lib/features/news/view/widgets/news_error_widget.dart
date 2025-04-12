import 'package:flutter/material.dart';

class NewsErrorWidget extends StatelessWidget {
  const NewsErrorWidget({super.key, required this.errorMessage});
final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return  Center(child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red,size: 60,),
          Text(errorMessage,textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w800,
                fontSize: 16,
              )
          ),
        ],
      ),
    ));
  }
}
