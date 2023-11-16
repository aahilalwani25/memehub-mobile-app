import 'package:equatable/equatable.dart';


sealed class ReactionState extends Equatable {
  const ReactionState();

  @override
  List<Object?> get props => [];
}

final class ReactionInitial extends ReactionState {}

class PrivacyChangedState extends ReactionState {
  String privacy;
  PrivacyChangedState({required this.privacy});

  @override
  List<Object> get props => [privacy];
}


class ReactionChangedState extends ReactionState{
  int reaction_type_id_fk = 0;
  ReactionChangedState({required this.reaction_type_id_fk});

  @override
  List<Object?> get props => [reaction_type_id_fk];
}