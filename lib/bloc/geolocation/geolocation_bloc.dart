import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/repositories/repositories.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geolocationSubscription;

  GeolocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepository = geolocationRepository,
        super(GeolocationLoading()) {
    on<LoadGeolocation>(_geolocationLoading);
    on<UpdateGeolocation>(_updateGeolocationToState);
  }

  void _geolocationLoading(
      LoadGeolocation event, Emitter<GeolocationState> emit) async {
    final Position? position =
        await _geolocationRepository.getCurrentLocation();
    emit(GeolocationLoaded(position: position));
  }

  void _updateGeolocationToState(
      UpdateGeolocation event, Emitter<GeolocationState> emit) async {
    emit(GeolocationLoaded(position: event.position));
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
