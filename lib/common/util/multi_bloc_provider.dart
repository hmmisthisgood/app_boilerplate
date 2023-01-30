import 'package:boilerplate/feature/authentication/resource/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/authentication/bloc/authentication_cubit.dart';

class MultiBolcAndCubitProvider extends StatelessWidget {
  const MultiBolcAndCubitProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: child,
      providers: [
        BlocProvider(
          create: (_) => AuthCubit(
              userRepository: RepositoryProvider.of<UserRepository>(context)),
        )
      ],
    );
  }
}
