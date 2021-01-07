import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test2/data/models/slang_model.dart';
import 'package:bloc_test2/data/repository/slang_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'slang_event.dart';
part 'slang_state.dart';

class SlangBloc extends Bloc<SlangEvent, SlangState> {
  SlangBloc() : super(SlangInitial());

  @override
  Stream<SlangState> mapEventToState(SlangEvent event) async* {
    if (event is GetSlangEvent) {
      yield SlangLoading();
      try {
        final SlangModel model = await SlangRepository().getSlang();
        yield SlangLoaded(slang: model);
      } catch (_) {
        yield SlangError();
      }
    }
  }
}
