import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/sub_screen/message_details_screen.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/viewmodels/messaging_viewmodel.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/widgets/chat_tile.dart';

import '../../../../../unils/navigation.dart';

class DraftTab extends StatelessWidget {
  const DraftTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Consumer<MessagingViewmodel>(
          builder: (context, model, child) {
            return Expanded(
              child: ListView.builder(
                  itemCount: model.chats.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final chat = model.chats[index];
                    final isSelected = model.selectedChats.contains(chat);

                    return ChatTile(
                      chat: model.chats[index],
                      isSelected: isSelected,
                      isDraft: true,
                      showCheckbox: model.isSelectMode,
                      onPressed: () {
                        if (model.isSelectMode) {
                          model.toggleChatSelection(chat);
                        } else {
                          PageRouter.gotoWidget(
                            context,
                            rootNavigator: true,
                            MessageDetailsScreen(chat: chat),
                          );
                          model.markAsRead(chat);
                        }
                      },
                      onLongPressed: () {
                        if (!isSelected) {
                          model.toggleChatSelection(chat);
                        }
                      },
                    );
                  }),
            );
          },
        ),
      ],
    );
  }
}
