part of 'users_cubit.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class FetchUsersSuccess extends UsersState{}

class FetchUsersFailed extends UsersState{}

class BaseClientError extends UsersState{}

class FetchMoreUsers extends UsersState {}



