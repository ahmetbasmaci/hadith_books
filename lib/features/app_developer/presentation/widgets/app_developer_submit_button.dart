import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_developer.dart';

class AppDeveloperSubmitButton extends StatelessWidget {
  const AppDeveloperSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<AppDeveloperCubit>().sendMessageToDb(),
      child: const Text('ارسال'),
    );
  }
}
