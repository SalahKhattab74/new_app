import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/layout/new_app/cubit/cubit.dart';
import 'package:new_app/layout/new_app/cubit/states.dart';
import 'package:new_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
    listener: (context,state){},
      builder: (context,state){
    var list = NewsCubit.get(context).search;
      return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: defaultFormField(
                  controller: searchController,
                  onChange: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  type: TextInputType.text,
                  validate: (String value){
                    if(value.isEmpty){
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search),
            ),
            Expanded(child: articleBuilder(list, context))
          ],
        ),
      );
      },
      );
  }
}
