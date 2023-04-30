import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_machine_task/cubit/users_cubit.dart';
import 'package:flutter_machine_task/screens/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home Page test', (tester) async {
    await tester.pumpWidget(BlocProvider(
      create: (context) => UsersCubit()..initializeState(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    ));

    // text the widget
    expect(find.text('Users List'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
