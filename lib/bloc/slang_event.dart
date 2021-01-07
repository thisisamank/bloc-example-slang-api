part of 'slang_bloc.dart';

@immutable
abstract class SlangEvent extends Equatable {}

class GetSlangEvent extends SlangEvent {
  @override
  List<Object> get props => [];
}
