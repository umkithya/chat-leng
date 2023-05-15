import 'package:chat_leng/app/core/values/app_colors.dart';
import 'package:chat_leng/app/modules/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/values/app_values.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      leadingWidth: 56 + 10,
      leading: Padding(
        padding: const EdgeInsets.only(left: AppValues.padding),
        child: Image.asset("assets/icons/png/msg_logo.png"),
      ),
      title: const Text("Chat Leng"),
    );
    final Widget searchTextField = Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppValues.padding, vertical: AppValues.padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppValues.radius_12),
        child: TextFormField(
          decoration: const InputDecoration(
              fillColor: AppColors.textFieldBackColor,
              filled: true,
              // disabledBorder: InputBorder.none,
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: "Search..."),
        ),
      ),
    );
    final Widget onlineFriendChat = SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...controller.chatFriendList
              .asMap()
              .entries
              .map((e) => Padding(
                    padding: EdgeInsets.only(
                        left: e.key.isEqual(0) ? AppValues.padding : 0,
                        right: e.key.isEqual(19)
                            ? AppValues.padding
                            : AppValues.smallPadding),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(e.value.toString()),
                    ),
                  ))
              .toList()
        ],
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: Column(children: [
        searchTextField,
        onlineFriendChat,
        Padding(
          padding: const EdgeInsets.all(50),
          child: ElevatedButton(
              onPressed: () {
                context.push("/detail");
              },
              child: const Icon(Icons.arrow_forward_outlined)),
        )
      ]),
    );
  }
}
