import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/bloc/geolocation/geolocation_bloc.dart';

import '../../widgets/widgtets.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<GeolocationBloc, GeolocationState>(
            builder: (context, state) {
              if (state is GeolocationLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GeolocationLoaded) {
                return GMap(
                    lat: state.position!.latitude,
                    lng: state.position!.longitude);
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
          Positioned(
            top: 30,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 100,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/logo.svg',
                    height: 50,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(child: LocationSearchBox()),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: ElevatedButton(
                onPressed: () {},
                child: const Text('Save'),
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor)),
          ),
        ],
      ),
    );
  }
}
