part of 'hommies_bloc.dart';

sealed class HommiesState extends Equatable {
  const HommiesState();
  
  @override
  List<Object> get props => [];
}

final class HommiesInitial extends HommiesState {}
class HommieLoading extends HommiesState{}

class HommieFetchedState extends HommiesState{
  List<dynamic> hommies;
  HommieFetchedState({required this.hommies});
  @override
  List<Object> get props => [hommies];
}


