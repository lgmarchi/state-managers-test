import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../controller/get_user_email.controller.dart';

class ShowUserEmail extends StatefulWidget {
  const ShowUserEmail({Key? key}) : super(key: key);

  @override
  State<ShowUserEmail> createState() => _ShowUserEmailState();
}

class _ShowUserEmailState extends State<ShowUserEmail> {
  final _controller = GetIt.I.get<GetUserEmailController>();

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
            Observer(
              builder: (_) => Text(_controller.userEmail != null
                  ? 'This user has an email'
                  : 'There is no email yet'),
            ),
            ElevatedButton(
              onPressed: () => _controller.getUserEmail(),
              child: const Text('Get the user email'),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserEmail extends StatelessWidget {
  final GetUserEmailController controller;

  const _UserEmail({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      switch (controller.userEmailState) {
        case GetUserEmailState.initial:
          return const Text('Initial Value');
        case GetUserEmailState.loading:
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
        case GetUserEmailState.success:
          return Text(controller.userEmail!.email);
        case GetUserEmailState.error:
          return const Text('An error happens.');
        default:
          return const Text('Initial Value');
      }
    });
  }
}
