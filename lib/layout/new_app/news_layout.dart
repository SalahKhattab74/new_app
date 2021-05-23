import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:new_app/layout/new_app/cubit/app_cubit.dart';
import 'package:new_app/layout/new_app/cubit/cubit.dart';
import 'package:new_app/layout/new_app/cubit/states.dart';
import 'package:new_app/modules/search/search_screen.dart';
import 'package:new_app/network/remote/dio_helper.dart';
import 'package:new_app/shared/components/components.dart';
class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
    listener: (context,state){},
      builder: ( context,  state) {
      var cubit = NewsCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          title: Text('News App'),
          actions: [
            IconButton(onPressed: (){
              navigateTo(context,SearchScreen());
            }, icon: Icon(Icons.search)),
            IconButton(onPressed: (){
              AppCubit.get(context).changeAppMode();
            }, icon: Icon(Icons.brightness_4_outlined ))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: cubit.bottomItems,
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomNavBar(index);
          },
        ),
        body: cubit.screens[cubit.currentIndex],
      );
      },
    );
  }
}
