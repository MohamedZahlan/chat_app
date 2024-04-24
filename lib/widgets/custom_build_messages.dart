import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/constants.dart';
import 'custom_message_widget.dart';

class CustomBuildMessages extends StatelessWidget {
  const CustomBuildMessages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            // this widget for other users messages
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: CustomMessageWidget(
                color: Colors.grey,
                text: "Hii",
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(10),
              ),
            ),

            // this widget for personal message
            const Align(
              alignment: AlignmentDirectional.centerEnd,
              child: CustomMessageWidget(
                color: Colors.white,
                text: "How are u",
                bottomRight: Radius.zero,
                bottomLeft: Radius.circular(15),
              ),
            ),
            SizedBox(
              height: height(context) / 10.8,
            ),
          ],
        );
      },
    );
  }
}
