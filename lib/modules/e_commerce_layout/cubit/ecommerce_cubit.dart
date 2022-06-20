import 'package:bloc/bloc.dart';
import 'package:e_commerce_layout/modules/e_commerce_layout/categories.dart';
import 'package:e_commerce_layout/modules/e_commerce_layout/cubit/ecommerce_state.dart';
import 'package:e_commerce_layout/modules/e_commerce_layout/help.dart';
import 'package:e_commerce_layout/modules/e_commerce_layout/home.dart';
import 'package:e_commerce_layout/modules/e_commerce_layout/profile.dart';
import 'package:e_commerce_layout/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EcommerceCubit extends Cubit<EcommerceState> {
  EcommerceCubit() : super(EcommerceInitial());

  static EcommerceCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens =[
    const HomeScreen(),
    const CategoriesScreen(),
    const ProfileScreen(),
    const HelpScreen(),
  ];

  List<AppBar> appBar = [
    buildAppBar( isCategoryOrHome: true,actions: [Icon(Icons.shopping_cart,size: 30)]),
    buildAppBar( isCategoryOrHome: true,actions: [Icon(Icons.shopping_cart,size: 30)]),
    buildAppBar( isCategoryOrHome: false,title: 'Your profile' , actions: [Icon(Icons.search,size: 30,),SizedBox(width: 8,),Icon(Icons.shopping_cart,size: 30,)]),
    buildAppBar( isCategoryOrHome: false,title: 'Help', actions: [Icon(Icons.search,size: 30,),SizedBox(width: 8,),Icon(Icons.shopping_cart,size: 30,)]),

  ];

  void changeBottomNav(int index){
    currentIndex = index;
    emit(ChangeNavBarState());
  }

}
