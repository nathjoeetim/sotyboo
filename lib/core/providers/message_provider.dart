import 'package:get/get.dart';
import 'package:sportboo_mobile_client/modules/messeges_model/inbox_model.dart';
import 'package:sportboo_mobile_client/modules/profile/sub_screens/messaging/model/profile_chat_model.dart';

class AllChatProvider extends GetxController {
  var isLoading = true.obs;
  List<ProfileChatModel> messages = <ProfileChatModel>[].obs;
  List<Conversation> messagesDetails = <Conversation>[].obs;

  List<ProfileChatModel> get getAllMessages => messages;

  List<Conversation> get getDetailedMessage => messagesDetails;

  @override
  void onInit() {
    super.onInit();
    getAllMessagesFn().then((value) {
      // Assign the retrieved messages to the messages list
      messages = value.obs;
    }).catchError((error) {
      // print('Error retrieving messages: $error');
    });
  }
}
