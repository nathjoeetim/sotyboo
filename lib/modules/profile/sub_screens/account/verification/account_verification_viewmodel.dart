import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

enum VerificationStage { notVerified, pending, verified }

enum DocType { driversLicense, idCard, passport, permit }

extension StatsTabExtension on DocType {
  String get value {
    switch (this) {
      case DocType.driversLicense:
        return 'driving license';
      case DocType.idCard:
        return 'ID Card';
      case DocType.passport:
        return 'passport';
      case DocType.permit:
        return 'residency permit or visa';
    }
  }
}

enum UploadStage { choose, tryAgain, confirm }

enum SelectOption { photoLibrary, camera, documents }

class AccountVerificationViewmodel extends ChangeNotifier {
  late VerificationStage _verificationStage;
  late DocType _docType;
  late UploadStage _uploadStage;
  late File? _frontDocument;
  late File? _backDocument;

  void checkVerificationStage() {
    ////////
    _verificationStage = VerificationStage.notVerified;
  }

  void initialize({required DocType docType}) {
    _docType = docType;
    reset();
  }

  void reset() {
    _uploadStage = UploadStage.choose;
    _frontDocument = null;
    _backDocument = null;
    notifyListeners();
  }

  VerificationStage get verificationStage => _verificationStage;
  DocType get docType => _docType;
  UploadStage get uploadStage => _uploadStage;
  File? get frontDocument => _frontDocument;
  File? get backDocument => _backDocument;

  selectImage({
    required SelectOption selectOption,
    bool frontImage = true,
  }) async {
    late FileType fileType;

    if (selectOption == SelectOption.photoLibrary) {
      fileType = FileType.image;
    } else if (selectOption == SelectOption.camera) {
      fileType = FileType.image;
    } else {
      fileType = FileType.any;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileType,
    );

    if (result != null && result.files.isNotEmpty) {
      if (frontImage) {
        _frontDocument = File(result.files.single.path ?? '');
      } else {
        _backDocument = File(result.files.single.path ?? '');
      }

      // Upload the Image
      // updateCurrentMessage(attachedPhoto: selectedImage);

      String fileName = result.files.first.name;
      log('Selected file: $fileName');

      // If verification failed, move to the tryAgain stage.
      // If successful, move to the Confirm stage
      _uploadStage = UploadStage.confirm;

      notifyListeners();
    }
  }
}
