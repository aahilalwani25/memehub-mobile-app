import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/signup bloc/signup_bloc.dart';

Widget RadioButton(
    {required String title,
    required int value,
    required int groupValue,
    required state,
    required BuildContext context}) {
  return ListTile(
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodySmall,
    ),
    leading: Radio(
      fillColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.orange.withOpacity(.32);
        }
        return Colors.orange;
      }),
      value: value,
      groupValue: groupValue, //(state is GenderState) ? state.genderId : 0,
      onChanged: (value) {
        context.read<SignupBloc>().add(GenderSelectedEvent(genderId: value!));
      },
    ),
  );
}
