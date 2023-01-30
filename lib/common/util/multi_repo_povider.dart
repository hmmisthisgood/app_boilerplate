import 'package:boilerplate/feature/authentication/bloc/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boilerplate/common/constant/env.dart';
import 'package:boilerplate/common/http/api_provider.dart';
import 'package:boilerplate/feature/authentication/resource/user_repository.dart';

import 'internet_check.dart';
import 'multi_bloc_provider.dart';

class MultiBlocAndRepositoryProvider extends StatelessWidget {
  final Widget child;
  final Env env;
  const MultiBlocAndRepositoryProvider(
      {required this.child, required this.env});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider<Env>(create: (context) => env, lazy: true),
      RepositoryProvider<ApiProvider>(
          create: (context) => ApiProvider(), lazy: true),
      RepositoryProvider<UserRepository>(
        create: (context) => UserRepository(
          env: RepositoryProvider.of<Env>(context),
          apiProvider: RepositoryProvider.of<ApiProvider>(context),
        )..initialState(),
        lazy: false,
      ),
    ], child: MultiBolcAndCubitProvider(child: child));
  }
}
