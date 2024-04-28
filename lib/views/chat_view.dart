import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_build_messages.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..getMessage(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          ChatCubit cubit = ChatCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              // leading: IconButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     icon: const Icon(Icons.arrow_back_ios)),
              centerTitle: true,
              elevation: 40.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/scholar.png',
                    height: height(context) / 15,
                  ),
                  SizedBox(
                    width: width(context) / 60,
                  ),
                  const Text("Chat"),
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width(context) / 40,
                  vertical: height(context) / 50),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) =>
                        const CustomBuildMessages(),
                    itemCount: 31,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: width(context) / 60,
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: width(context) / 40,
                        vertical: height(context) / 180),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.white,
                            onFieldSubmitted: (value) {
                              cubit.sendMessage(value);
                            },
                            controller: cubit.messageController,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Write your message..',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (cubit.messageController.text.isNotEmpty) {
                              cubit.sendMessage(cubit.messageController.text);
                              cubit.getMessage();
                            }
                          },
                          icon: Icon(
                            Icons.send,
                            size: width(context) / 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
