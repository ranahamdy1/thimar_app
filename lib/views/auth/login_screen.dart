import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_app/core/design/app_button.dart';
import 'package:thimar_app/core/design/app_input.dart';
import 'package:thimar_app/core/design/app_loading.dart';
import 'package:thimar_app/core/logic/input_validator.dart';
import 'package:thimar_app/features/auth/login/bloc.dart';
import 'package:thimar_app/views/auth/auth_header.dart';
import 'package:thimar_app/views/pages/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    String selectedCode = "966";
    final bloc = KiwiContainer().resolve<LoginBloc>();
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AuthHeaderScreen(),
                SizedBox(height: 12.h),
                AppInput(
                  text: "رقم الجوال",
                  prefixIcon: const Icon(Icons.call),
                  isPhone: true,
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  validator: (value) {
                    return InputValidator.phone(value);
                  },
                ),
                SizedBox(height: 12.h),
                AppInput(
                  text: "كلمة المرور",
                  prefixIcon: const Icon(Icons.lock_open_outlined),
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  validator: (value) {
                    return InputValidator.password(value);
                  },
                ),
                SizedBox(height: 12.h),
                const Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text("نسيت كلمة المرور ؟"),
                ),
                SizedBox(height: 12.h),
                BlocConsumer(
                    bloc: bloc,
                    listener: (context, state){
                      if (state is LoginSuccessState) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        });
                      }
                    },
                    builder: (context, state) {
                        return AppButton(
                        text: "تسجيل الدخول",
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            bloc.add(LoginEvent(
                                phone: phoneController.text,
                                code: selectedCode,
                                password: passwordController.text));
                          }
                        },
                      );
                    }),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("ليس لديك حساب ؟"),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        " تسجيل الأن",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
