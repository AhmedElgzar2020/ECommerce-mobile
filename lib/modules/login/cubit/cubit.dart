import 'package:e_commerce_layout/modules/login/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ECommerceLoginCubit extends Cubit<ECommerceLoginStates> {
  ECommerceLoginCubit() : super(ECommerceLoginInitialState());


  static ECommerceLoginCubit get(context) => BlocProvider.of(context);
  void userLogin({
    required String email,
    required String password,
  }) {

  }
  Icon suffix = const Icon(Icons.visibility);
  bool isVisible = true;
  void passwordVisible(){
    isVisible = !isVisible;
    suffix = Icon(isVisible ? Icons.visibility:Icons.visibility_off);
    emit(ECommerceChangePasswordVisibilityState());
  }
}
