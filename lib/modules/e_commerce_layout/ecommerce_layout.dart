import 'package:e_commerce_layout/modules/e_commerce_layout/cubit/ecommerce_cubit.dart';
import 'package:e_commerce_layout/modules/e_commerce_layout/cubit/ecommerce_state.dart';
import 'package:e_commerce_layout/style/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ECommerceLayout extends StatelessWidget {
  const ECommerceLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EcommerceCubit,EcommerceState>(
        builder: (context,state){
          var cubit = EcommerceCubit.get(context);
          return Scaffold(
            appBar: cubit.appBar[cubit.currentIndex],
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.black,
                elevation: 20.0,
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.currentIndex,
                onTap: (index){
                  cubit.changeBottomNav(index);
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(IconBroken.Home) , label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(IconBroken.Category) , label: 'categories'),
                  BottomNavigationBarItem(icon: Icon(IconBroken.Profile) , label: 'profile'),
                  BottomNavigationBarItem(icon: Icon(IconBroken.Discovery) , label: 'help'),
                ]
            ),
          );
        },
        listener: (context,state){});
  }
}
