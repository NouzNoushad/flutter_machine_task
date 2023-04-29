import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../model/users_response_model.dart';
import '../network/endpoint.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  final ScrollController scrollController = ScrollController();

  static UsersCubit getContext(context) => BlocProvider.of(context);

  var baseClient = http.Client();
  var baseHeader = {'content-type': 'application/json'};
  List<UsersResponseModel> users = [];
  bool isLoading = false;

  initializeState() {
    emit(UsersInitial());
    fetchUsersData();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          !isLoading) {
        // print('max reached');
        fetchUsersData();
        isLoading = true;
        emit(FetchMoreUsers());
      }
    });
  }

  Future<dynamic> get(String endpoint, [Map<String, String>? header]) async {
    try {
      var uri = Uri.parse(endpoint);
      var response = await baseClient.get(uri, headers: header ?? baseHeader);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        // print('error');
        emit(FetchUsersFailed());
      }
    } catch (err) {
      // print(err);
      emit(BaseClientError());
    }
  }

  fetchUsersData() async {
    var response = await get(ApiEndPoints.users);
    if (response == null) {
      // print('error');
      emit(FetchUsersFailed());
    } else {
      // print(response);
      isLoading = false;
      users = usersResponseModelFromJson(response);
      emit(FetchUsersSuccess());
    }
  }

  Future<void> onRefresh() {
    return fetchUsersData();
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
