part of 'slang_bloc.dart';

@immutable
abstract class SlangState extends Equatable {}

class SlangInitial extends SlangState {
  @override
  List<Object> get props => [];
}

class SlangLoading extends SlangState {
  @override
  List<Object> get props => [];
}

class SlangLoaded extends SlangState {
  final SlangModel slang;
  SlangLoaded({this.slang});

  @override
  List<Object> get props => [slang];
}

class SlangError extends SlangState {
  @override
  List<Object> get props => [];
}
