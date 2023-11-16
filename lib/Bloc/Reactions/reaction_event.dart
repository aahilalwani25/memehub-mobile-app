import 'package:equatable/equatable.dart';

sealed class ReactionEvent extends Equatable {
  const ReactionEvent();

  @override
  List<Object> get props => [];
}

class ReactionChangedEvent extends ReactionEvent{
  
  int post_id_fk=0;
int profile_id_fk=0;
int reaction_type_id_fk=0;
   
 ReactionChangedEvent({required this.reaction_type_id_fk,required this.post_id_fk,required this.profile_id_fk,});


  @override
  List<Object> get props => [reaction_type_id_fk,post_id_fk,profile_id_fk];

}