part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class AddHomieButtonPressed extends ProfileEvent{
  int my_homie_id_fk,my_profile_id_fk;

  AddHomieButtonPressed({this.my_homie_id_fk=0, this.my_profile_id_fk=0});
  @override
  List<Object> get props => [my_homie_id_fk,my_profile_id_fk];
}


