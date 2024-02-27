import 'dart:io';

class ProfileChatModel {
  ProfileChatModel({
    this.isRead = false,
    this.title,
    this.messages,
    // this.time,
  });

  bool? isRead;
  String? title;
  List<Message>? messages;
  //final String? message;
  //String? time;
}

class Message {
  String? id;
  String? sender;
  String? time;
  String? message;
  File? photo;
  //final File? document;

  Message({this.id, this.sender, this.time, this.message, this.photo
      //this.uploadPrescription,
      });

  /*Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> medicationList =
        medicationDetails!.map((medication) => medication.toJson()).toList();

    return {
      'owner': owner,
      'upload_prescription': uploadPrescription != null
          ? base64Encode(uploadPrescription!.readAsBytesSync())
          : null,
      'medication_details': medicationList,
      'recipent_name': recipientName,
      'recipent_phone_number': recipientPhoneNumber,
      'recipent_address': recipientAddress,
      'state': state,
      'city': city,
      //'status': status,
      //'created': created,
    };
  }


  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> medicationList =
        medicationDetails!.map((medication) => medication.toJson()).toList();

    return {
      'owner': owner,
      'medication_details': medicationList,
      'recipent_name': recipientName,
      'recipent_phone_number': recipientPhoneNumber,
      'recipent_address': recipientAddress,
      'state': state,
      'city': city,
    };
  }

  Map<String, List<File>> toFileData() {
    final fileData = <String, List<File>>{};

    if (uploadPrescription != null) {
      fileData['upload_prescription'] = [uploadPrescription!];
    }

    return fileData;
  }

 Future<Map<String, dynamic>> toJson() async {
    final medicationList =
        medicationDetails?.map((medication) => medication.toJson()).toList();

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('your_upload_url'),
    );

    // Add the owner field
    request.fields['owner'] = owner!;

    // Add the medication details
    request.fields['medication_details'] = json.encode(medicationList);

    // Add the recipient fields
    request.fields['recipent_name'] = recipientName!;
    request.fields['recipent_phone_number'] = recipientPhoneNumber!;
    request.fields['recipent_address'] = recipientAddress!;
    request.fields['state'] = state!;
    request.fields['city'] = city!;

    // Add the prescription file if available
    if (uploadPrescription != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'upload_prescription',
          uploadPrescription!.path,
        ),
      );
    }

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    return json.decode(response.body);
  } */
}
