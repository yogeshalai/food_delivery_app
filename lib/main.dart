import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/filter/filter_bloc.dart';
import 'package:food_delivery_app/bloc/geolocation/geolocation_bloc.dart';
import 'package:food_delivery_app/config/app_router.dart';
import 'package:food_delivery_app/config/theme.dart';
import 'package:food_delivery_app/repositories/repositories.dart';
import 'package:food_delivery_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => GeolocationRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GeolocationBloc(
                geolocationRepository: context.read<GeolocationRepository>())
              ..add(LoadGeolocation()),
          ),
          BlocProvider(
            create: (context) => FilterBloc()..add(FilterLoad()),
          ),
        ],
        child: MaterialApp(
          title: 'Food Delivery',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ),
      ),
    );
  }
}
