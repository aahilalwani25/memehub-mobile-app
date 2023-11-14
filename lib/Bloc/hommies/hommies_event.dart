part of 'hommies_bloc.dart';

sealed class HommiesEvent extends Equatable {
  const HommiesEvent();

  @override
  List<Object> get props => [];
}

class HommiesFetchedEvent extends HommiesEvent{
  final int id;
  HommiesFetchedEvent({required this.id});

  @override
  List<Object> get props => [id];
}



