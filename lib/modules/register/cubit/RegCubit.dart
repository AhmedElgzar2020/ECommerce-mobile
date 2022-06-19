import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'RegStates.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());


  static SocialRegisterCubit get(context) => BlocProvider.of(context);
  void userRegister({
    required String email,
    required String password,
    required String phone ,
    required String name
  }) {

  }

  Icon suffix = const Icon(Icons.visibility);
  bool isVisible = true;
  void passwordVisible(){
    isVisible = !isVisible;
    suffix = Icon(isVisible ? Icons.visibility : Icons.visibility_off );
    emit(SocialChangePasswordVisibilityState());
  }
}