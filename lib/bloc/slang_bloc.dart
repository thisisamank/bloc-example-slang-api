import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test2/data/models/slang_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'slang_event.dart';
part 'slang_state.dart';

class SlangBloc extends Bloc<SlangEvent, SlangState> {
  SlangBloc() : super(SlangInitial());

  @override
  Stream<SlangState> mapEventToState(SlangEvent event) async* {
    // TODO: implement mapEventToState
    if (event is GetSlangEvent) {
      yield SlangLoading();
    }
  }
}

//  @override
//   Stream<WeatherState> mapEventToState(
//     WeatherState currentState,
//     WeatherEvent event,
//   ) async* {
//     if (event is FetchWeather) {
//       yield WeatherLoading();
//       try {
//         final Weather weather = await weatherRepository.getWeather(event.city);
//         yield WeatherLoaded(weather: weather);
//       } catch (_) {
//         yield WeatherError();
//       }
//     }
