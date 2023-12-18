import 'package:equatable/equatable.dart';
//part of 'reels_bloc.dart';

sealed class ReelsEvent extends Equatable {
  const ReelsEvent();

  @override
  List<Object> get props => [];
}

class ReelsFetchedEvent extends ReelsEvent{}
