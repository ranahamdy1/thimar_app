import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_image.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final list =[
      "+20",
      "+299",
      "+669"
    ];
    return ListView.separated(
      padding: EdgeInsets.all(16.r),
        itemBuilder: (context,index)=> GestureDetector(
          onTap: (){
            Navigator.pop(context,[list[index],"hello $index"]);
          },
          child: Center(
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  AppImage("assets/images/saudia.png"),
                  SizedBox(width: 18),
                  Text(list[index]),
                ],
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index)=> SizedBox(height: 16.h,),
        itemCount: list.length
    );
  }
}
