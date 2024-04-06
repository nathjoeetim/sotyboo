import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportboo_mobile_client/core/providers/message_provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/model/profile_chat_model.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/sub_screen/message_details_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/messaging_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/widgets/chat_tile.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/widgets/no_message_card.dart';
import '../../../../../unils/navigation.dart';

class InboxTab extends StatefulWidget {
  const InboxTab({Key? key}) : super(key: key);

  @override
  State<InboxTab> createState() => _InboxTabState();
}

class _InboxTabState extends State<InboxTab> {
  AllChatProvider allMessages = Get.put(AllChatProvider());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<ProfileChatModel> chats = allMessages.getAllMessages;

      // Reverse the order of the chats
      chats = chats.reversed.toList();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (chats.isEmpty)
            const NoMessageCard()
          else
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  final isSelected = MessagingViewmodel().selectedChats.contains(chat);
                  return ChatTile(
                    chat: chat,
                    isSelected: isSelected,
                    showCheckbox: MessagingViewmodel().isSelectMode,
                    onPressed: () {
                      if (MessagingViewmodel().isSelectMode) {
                        MessagingViewmodel().toggleChatSelection(chat);
                      } else {
                        PageRouter.gotoWidget(
                          context,
                          rootNavigator: true,
                          MessageDetailsScreen(chat: chat),
                        );
                        MessagingViewmodel().markAsRead(chat);
                      }
                    },
                    onLongPressed: () {
                      if (!isSelected) {
                        MessagingViewmodel().toggleChatSelection(chat);
                      }
                    },
                  );
                },
              ),
            ),
        ],
      );
    });
  }
}
