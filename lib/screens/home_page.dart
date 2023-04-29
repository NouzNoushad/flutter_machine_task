import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_machine_task/core/colors.dart';
import 'package:flutter_machine_task/screens/widgets/user_card_styling.dart';

import '../cubit/users_cubit.dart';
import 'user_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Users List'),
          centerTitle: true,
        ),
        body: BlocConsumer<UsersCubit, UsersState>(
          listener: (context, state) {
            if (state is BaseClientError) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: primaryColor,
                  content: Text(
                    'Please check your internet connect and try again',
                  )));
            }
            if (state is FetchUsersFailed) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: primaryColor,
                  content: Text(
                    'Something went wrong, cannot fetch the data',
                  )));
            }
          },
          builder: (context, state) {
            if (state is UsersInitial) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: primaryColor,
                  color: backgroundColor,
                ),
              );
            }
            return BlocBuilder<UsersCubit, UsersState>(
              builder: (context, state) {
                UsersCubit cubit = UsersCubit.getContext(context);
                return RefreshIndicator(
                  onRefresh: cubit.onRefresh,
                  color: primaryColor,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: cubit.users.isNotEmpty
                            ? ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                controller: cubit.scrollController,
                                itemCount: cubit.users.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 10,
                                ),
                                itemBuilder: (context, index) {
                                  var user = cubit.users[index];
                                  return GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => UserDetails(
                                                  user: user,
                                                ))),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1.5, color: borderColor),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          UserCardStyling(
                                            label: 'Name',
                                            details: user.name,
                                            fontSize: 16,
                                            flexStart: 2,
                                            flexEnd: 6,
                                          ),
                                          UserCardStyling(
                                            label: 'Email',
                                            details: user.email,
                                            fontSize: 16,
                                            flexStart: 2,
                                            flexEnd: 6,
                                          ),
                                          UserCardStyling(
                                            label: 'Phone',
                                            details: user.phone,
                                            fontSize: 16,
                                            flexStart: 2,
                                            flexEnd: 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const Center(
                                child: Text(
                                'No Data',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: primaryColor),
                              )),
                      ),
                      if (cubit.isLoading)
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(
                                bottom: 20,
                              ),
                              child: Center(
                                  child: CircleAvatar(
                                radius: 15,
                                backgroundColor: borderColor,
                                child: const CircularProgressIndicator(
                                  backgroundColor: primaryColor,
                                  color: backgroundColor,
                                ),
                              ))),
                        )
                      else
                        Container()
                    ],
                  ),
                );
              },
            );
          },
        ));
  }
}
