import 'package:flutter/material.dart';
import 'package:flutter_machine_task/cubit/users_cubit.dart';
import 'package:flutter_machine_task/model/users_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  UsersCubit? usersCubit;

  setUp(() {
    usersCubit = UsersCubit();
  });

  tearDown(() {
    usersCubit!.close();
  });

  test('cubit should have initial state as UsersInitial', () {
    expect(usersCubit!.state.runtimeType, UsersInitial);
  });
  test('check the users return list of model UserResponseModel', () {
    expect(usersCubit!.users.runtimeType, List<UsersResponseModel>);
  });
  test('check the loading type', () {
    expect(usersCubit!.isLoading.runtimeType, bool);
  });
  test('check the scroll controller type', () {
    expect(usersCubit!.scrollController.runtimeType, ScrollController);
  });
}
