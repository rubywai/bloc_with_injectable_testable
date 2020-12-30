import 'package:bloc_rest_api/bloc/get/cubit/getcontact_cubit.dart';
import 'package:bloc_rest_api/bloc/theme/theme_cubit.dart';
import 'package:bloc_rest_api/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_rest_api/di/injection.dart';

import 'common/theme/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  ThemeData themeData;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => getIt(),
        ),
        BlocProvider(
          create: (context) => GetContactCubit(getIt()),
        )
      ],
      child: BlocBuilder<ThemeCubit,ThemeState>(
        builder: (context,state){
          if(state is DarkThemeState)
          return MaterialApp(
            theme: state.themeData,
            home : Home()
          );
          if(state is LightThemeState)
            return MaterialApp(
                theme: state.themeData,
                home : Home()
            );
          else
            return MaterialApp(
              theme: appThemeData[AppTheme.Auto],
              home: Home(),
            );
        },
      )
    );
  }
}
