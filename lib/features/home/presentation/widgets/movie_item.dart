import 'package:codex_flutter_g1/core/network/app_end_points.dart';
import 'package:codex_flutter_g1/features/home/domain/entities/top_movies_entitiy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.topMoviesEntity});
final TopMoviesEntity topMoviesEntity;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Image.network(
            AppEndPoints.baseImageIrl+topMoviesEntity.img,
            height: 100.h,
            width: 50.w,
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text( topMoviesEntity.title,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    Text( topMoviesEntity.date.toString(),
                      style: TextStyle(
                          color: Colors.grey.shade700
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5.h,),
                Text(
                  topMoviesEntity.description,
                  maxLines: 3,
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
