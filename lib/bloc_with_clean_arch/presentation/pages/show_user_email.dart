import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../controller/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowUserEmail extends StatefulWidget {
  const ShowUserEmail({Key? key}) : super(key: key);

  @override
  State<ShowUserEmail> createState() => _ShowUserEmailState();
}

class _ShowUserEmailState extends State<ShowUserEmail> {
  final _controller = GetIt.I.get<UserEmailBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Email'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: _UserEmail(
              controller: _controller,
            )),
            BlocBuilder<UserEmailBloc, UserEmailState>(
              bloc: GetIt.I.get<UserEmailBloc>(),
              builder: (context, state) {
                if (state is UserEmailSuccess) {
                  return const Text('There is no email yet');
                } else {
                  return const Text('This user has an email');
                }
              },
            ),
            ElevatedButton(
              onPressed: () => _controller.add(GetUserEmail()),
              child: const Text('Get the user email'),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserEmail extends StatelessWidget {
  final UserEmailBloc controller;

  const _UserEmail({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserEmailBloc, UserEmailState>(
        builder: (context, state) {
      if (state is UserEmailInitial) {
        return const Text('Initial Value');
      } else if (state is UserEmailLoading) {
        return Column(
          children: const [
            SizedBox(
              height: 56,
              width: 56,
              child: CircularProgressIndicator(),
            ),
            SizedBox(
              height: 16,
              width: 16,
            ),
            Text('Loading...'),
          ],
        );
      } else if (state is UserEmailSuccess) {
        return Text(state.userEmail.email);
      } else if (state is UserEmailError) {
        return const Text('An error happens.');
      } else {
        return const Text('Initial Value');
      }
    });
  }
}
