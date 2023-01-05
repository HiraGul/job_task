import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InstagramStories extends StatelessWidget {
  final List<String> stories;
  const InstagramStories({required this.stories, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: stories.map((story) {
        return Row(
          children: [
            Column(
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(left: 10.sp, top: 30.sp, right: 10.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70.sp),
                    border: Border.all(
                      width: 3.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(
                      2.sp,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70.r),
                      child: Image(
                        image: NetworkImage(story),
                        width: 70.sp,
                        height: 70.sp,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
