import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.length});
  final int length;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade300),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 90.h,
                  width: 100.w,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 4.h,
                              width: double.infinity,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            height: 4.h,
                            width: 70,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 4.h,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 4.h,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 4.h,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 4.h,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 4.h,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 4.h,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 4.h,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
