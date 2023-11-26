import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as Path;
import 'dart:async';
import 'package:path/path.dart';

// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:flutter/src/foundation/isolates.dart';
import 'package:we_chat/core/file_manager/directory_name.dart';
import 'package:we_chat/core/string_extension/string_extension.dart';

class FileManager {
  static final FileManager _singleton = FileManager._internal();

  factory FileManager() {
    return _singleton;
  }

  FileManager._internal();

  /// provides documents directory path.
  /// we set path while launching app
  static String documentsDirectoryPathString = "";

  static Future<void> initialise() async {
    await FileManager.documentsDirectoryPath();
    print(documentsDirectoryPathString);
    FileManager.createDirectory(DirectoryNames.userProfileImage);
  }

  /* ************** */
  // DOCUMENTS DIRECTORY
  /// returns documents directory path
  /* ************** */
  static Future<String> documentsDirectoryPath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = documentsDirectory.path;
    documentsDirectoryPathString = path;
    return path;
  }

  /* ************** */
  // DB PATH
  /// return database path
  /* ************** */
  static String dbPath(String dbName) {
    String dPath = documentsDirectoryPathString;
    String path = join(dPath, dbName);
    return path;
  }

  /* ************** */
  /// FLOG DB FILE PATH
  /// return the flog db file path
  /* ************** */

  static String flogDbFilePath(String flogDbFilePath) {
    String dPath = documentsDirectoryPathString;
    String path = join(dPath, flogDbFilePath);

    return path;
  }

//-----

  /* ************** */
  // USER SIGNATURE
  /// Generate Path for User Signature for [uniqeuKey] provided
  /* ************** */
  static String userSignaturePath({
    required String uniqueKey,
  }) {
    String name = "$uniqueKey.png";

    Directory signatureDirectoryPath = Directory(
        '$documentsDirectoryPathString/${DirectoryNames.userProfileImage}');
    String path = Path.join(signatureDirectoryPath.path, name);
    return path;
  }

  ///Writes provided [image] user signature to the path generated
  ///using [uniqueKey]
  static Future<String> writeUserSignature({
    required Uint8List image,
    required String uniqueKey,
  }) async {
    String path = userSignaturePath(uniqueKey: uniqueKey);
    final imagePath = await File(path).create();
    await imagePath.writeAsBytes(image);
    return path.fileName;
  }

  ///Delete user signature generated on the path
  static Future<int> deleteUserSignature({required String uniqueKey}) async {
    String path = userSignaturePath(uniqueKey: uniqueKey);
    final imagePath = await File(path).create();
    try {
      await imagePath.delete();
      return 1;
    } catch (e) {
      return 0;
    }
  }

//-----

  /* ************** */
  // COMPANY LOGO
  /// Generate Path for company logo for [uniqeuKey] provided
  /* ************** */
  static String companyLogoPath({
    required String name,
  }) {
    String path = Path.join(documentsDirectoryPathString, name);
    return path;
  }

  ///Writes provided [image] for company logo to the path generated
  ///using [uniqueKey]
  static Future<String> writeCompanyLogo({
    required String sourceURL,
    required String name,
  }) async {
    final source = await File(sourceURL).create();
    final bytes = await source.readAsBytes();

    String path = companyLogoPath(name: name);
    final file = await File(path).create();
    await file.writeAsBytes(bytes);
    return path.fileName;
  }

  ///Delete user signature generated on the path
  static Future<int> deleteCompanyLogo({required String name}) async {
    String path = companyLogoPath(name: name);
    final imagePath = await File(path).create();
    try {
      await imagePath.delete();
      return 1;
    } catch (e) {
      return 0;
    }
  }

  /* ************** */
  // Hazard Icon PATH
  /// Provides full hazard path of the provided [iconName]
  /* ************** */
//   static String hazardIconPath({
//     required String iconName,
//   }) {
//  /
  /* ************** */
  // WRITE SUPPORT ATTACHMENT IMAGES
  /// writes the image path for the given [image] and uniqueKey
  /* ************** */
  // static Future<String> writeSupportAttachmentImages({
  //   required Uint8List image,
  //   required String uniqueKey,
  // }) async {
  //   String path = supportAttachmentImagePath(uniqueKey: uniqueKey);
  //   final imagePath = await File(path).create();
  //   await imagePath.writeAsBytes(image);
  //   return path.fileName;
  // }

  /// method to read json from the [fileName] json file
  /// present int he assets folder.
  static dynamic readJSON(String fileName) async {
    final String response =
        await rootBundle.loadString('assets/json/$fileName');
    final data = await json.decode(response);
    return data;
  }

  /* ************** */
  static Future<Uint8List> fileBytes(String path) async {
    File sourceFile = File(path);
    return await sourceFile.readAsBytes();
  }

  static Future<dynamic> copyFile(String source, String destination) async {
    File sourceFile = File(source);
    return await sourceFile.copy(destination);
  }

  static createDirectory(String directoryName) async {
    Directory signatureDirectoryPath = Directory(
      '$documentsDirectoryPathString/$directoryName',
    );
    if (await signatureDirectoryPath.exists() == false) {
      signatureDirectoryPath.create();
    }
  }

  static Future<Uint8List> returnBytesImage(String imagePath) async {
    ByteData imageByteData = await rootBundle.load(imagePath);
    Uint8List imageBytes = imageByteData.buffer.asUint8List();
    return imageBytes;
  }

  static bool fileExists(String path) {
    return File(path).existsSync();
  }

  /* ************** */
  // MERGE PDF

  ///
  // /* ************** */

  // static Future<int> mergePDf({
  //   required RiskAssessmentEntity riskAssessmentEntity,
  //   required MsAssessmentEntity msAssessmentEntity,
  // }) async {
  //   var mergePath = Path.join(documentsDirectoryPathString, "Combined.pdf");

  //   var raPath = FileManager.raPdfPath(
  //       raAssessmentUniqueKey: riskAssessmentEntity.uniqueKey ?? '');
  //   var msPath = FileManager.msPdfPath(
  //       msAssessmentUniqueKey: msAssessmentEntity.uniqueKey ?? "");

  //   MergeMultiplePDFResponse response =
  //       await PdfMerger.mergeMultiplePDF(paths: [
  //     raPath,
  //     msPath,
  //   ], outputDirPath: mergePath);

  //   if (response.status == "success") {
  //     await copyFile(mergePath, msPath);
  //     await copyFile(mergePath, raPath);
  //     return 1;
  //   } else {
  //     return 0;
  //   }
  // }
}
