import 'package:flutter/material.dart';
import 'package:flutter_machine_task/core/colors.dart';
import 'package:flutter_machine_task/model/users_response_model.dart';
import 'package:flutter_machine_task/screens/widgets/user_card_styling.dart';

class UserDetails extends StatelessWidget {
  final UsersResponseModel user;
  const UserDetails({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(user.name),
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: primaryColor,
      body: Center(
        child: Container(
          height: size.height * 0.45,
          width: size.width,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1.5, color: borderColor),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UserCardStyling(
                label: 'Username',
                details: user.username,
                fontSize: 18,
                flexStart: 4,
                flexEnd: 8,
              ),
              UserCardStyling(
                label: 'Email',
                details: user.email,
                fontSize: 18,
                flexStart: 4,
                flexEnd: 8,
              ),
              UserCardStyling(
                label: 'Phone',
                details: user.phone,
                fontSize: 18,
                flexStart: 4,
                flexEnd: 8,
              ),
              UserCardStyling(
                label: 'Address',
                details:
                    '${user.address.street}\n${user.address.suite}\n${user.address.city}\n${user.address.zipcode}',
                fontSize: 18,
                flexStart: 4,
                flexEnd: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
