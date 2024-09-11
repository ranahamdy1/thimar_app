import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_app/core/design/app_image.dart';
import 'package:thimar_app/views/sheets/countries.dart';

class AppInput extends StatefulWidget {
  final String text;
  final Icon? prefixIcon;
  final bool isPhone;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const AppInput({super.key, this.text = '', this.prefixIcon, this.isPhone = false, this.validator, this.keyboardType, this.controller});

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  String selectedCode = "966";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          icon: widget.isPhone? GestureDetector(
            onTap: () async{
              final result = await showModalBottomSheet(context: context, builder: (context)=> CountriesScreen());
              if(result != null){
                selectedCode = result[0];
                setState(() {

                });
              }
              print(result);
              },
            child: Container(
              height: 55,
              width: 66,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppImage("assets/images/saudia.png"),
                  Text(selectedCode),
                ],
              ),
            ),
          ): null,
          labelText: widget.text,
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}
