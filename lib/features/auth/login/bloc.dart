import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_app/core/logic/dio_helper.dart';

part 'event.dart';
part 'model.dart';
part 'state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc():super(LoginStates()){
    on<LoginEvent> (_sendData);
  }


  Future<void> _sendData(LoginEvent event, Emitter<LoginStates> emit) async{
    emit(LoginLoadingState());
    final response = await DioHelper.post("login", {
      "password": "${event.code}${event.password}",
      "phone": event.phone,
      "device_token": "test",
      "type": Platform.operatingSystem,
      "user_type": "client"
    });
    if(response.isSuccess){
      emit(LoginSuccessState(msg: response.msg!));

    }else{
      emit(LoginFailedState(msg: response.msg!));
    }
  }
}