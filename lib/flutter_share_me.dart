import 'dart:io';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'file_type.dart';

//export file type enum
export 'package:flutter_share_me/file_type.dart';

class FlutterShareMe {
  final MethodChannel _channel = const MethodChannel('flutter_share_me');

  static const String _methodWhatsApp = 'whatsapp_share';
  static const String _methodWhatsAppPersonal = 'whatsapp_personal';
  static const String _methodWhatsAppBusiness = 'whatsapp_business_share';
  static const String _methodFaceBook = 'facebook_share';
  static const String _methodMessenger = 'messenger_share';
  static const String _methodTwitter = 'twitter_share';
  static const String _methodInstagramShare = 'instagram_share';
  static const String _methodSystemShare = 'system_share';
  static const String _methodTelegramShare = 'telegram_share';
  static const String _methodSnapchatShare = 'snapchat_share';

  ///share to WhatsApp
  /// [imagePath] is local image
  /// [phoneNumber] enter phone number with counry code
  /// For ios
  /// If include image then text params will be ingored as there is no current way in IOS share both at the same.
  Future<String?> shareToWhatsApp(
      {String msg = '',
      String imagePath = '',
      FileType? fileType = FileType.image}) async {
    final Map<String, dynamic> arguments = <String, dynamic>{};
    arguments.putIfAbsent('msg', () => msg);
    arguments.putIfAbsent('url', () => imagePath);
    if (fileType == FileType.image) {
      arguments.putIfAbsent('fileType', () => 'image');
    } else {
      arguments.putIfAbsent('fileType', () => 'video');
    }

    String? result;
    try {
      result = await _channel.invokeMethod<String>(_methodWhatsApp, arguments);
    } catch (e) {
      return e.toString();
    }

    return result;
  }

  ///share to WhatsApp
  /// [phoneNumber] phone number with counry code
  /// [msg] message text you want on whatsapp
  Future<String?> shareWhatsAppPersonalMessage(
      {required String message, required String phoneNumber}) async {
    final Map<String, dynamic> arguments = <String, dynamic>{};
    arguments.putIfAbsent('msg', () => message);
    arguments.putIfAbsent('phoneNumber', () => phoneNumber);

    String? result;
    try {
      result = await _channel.invokeMethod<String>(
          _methodWhatsAppPersonal, arguments);
    } catch (e) {
      return e.toString();
    }

    return result;
  }

  ///share to snapchat
  /// [file] path of the file
  /// [appSignature] package name of the app
  Future<String?> shareToSnapchat(
      {required String file, required String appSignature}) async {
    final Map<String, dynamic> arguments = <String, dynamic>{};
    arguments.putIfAbsent('file', () => file);
    arguments.putIfAbsent('appSignature', () => appSignature);

    String? result;
    try {
      result =
          await _channel.invokeMethod<String>(_methodSnapchatShare, arguments);
    } catch (e) {
      return e.toString();
    }

    return result;
  }

  ///share to Telegram
  /// [msg] message text you want on telegram
  Future<String?> shareToTelegram({required String msg}) async {
    final Map<String, dynamic> arguments = <String, dynamic>{};
    arguments.putIfAbsent('msg', () => msg);
    String? result;
    try {
      result =
          await _channel.invokeMethod<String>(_methodTelegramShare, arguments);
    } catch (e) {
      return e.toString();
    }
    return result;
  }

  ///share to WhatsApp4Biz
  ///[imagePath] is local image
  /// For ios
  /// If include image then text params will be ingored as there is no current way in IOS share both at the same.
  Future<String?> shareToWhatsApp4Biz(
      {String msg = '', String? imagePath = ''}) async {
    final Map<String, dynamic> arguments = <String, dynamic>{};

    arguments.putIfAbsent('msg', () => msg);
    arguments.putIfAbsent('url', () => imagePath);
    String? result;
    try {
      result = await _channel.invokeMethod<String>(
          _methodWhatsAppBusiness, arguments);
    } catch (e) {
      return 'false';
    }

    return result;
  }

  ///share to facebook
  Future<String?> shareToFacebook(
      {required String msg,
      required String clientToken,
      String url = ''}) async {
    final Map<String, dynamic> arguments = <String, dynamic>{};
    arguments.putIfAbsent('msg', () => msg);
    arguments.putIfAbsent('url', () => url);
    arguments.putIfAbsent('clientToken', () => clientToken);
    String? result;
    try {
      result = await _channel.invokeMethod<String?>(_methodFaceBook, arguments);
    } catch (e) {
      return e.toString();
    }
    return result;
  }

  ///share to messenger
  Future<String?> shareToMessenger(
      {required String msg, String url = ''}) async {
    final Map<String, dynamic> arguments = <String, dynamic>{};
    arguments.putIfAbsent('msg', () => msg);
    arguments.putIfAbsent('url', () => url);
    String? result;
    try {
      result =
          await _channel.invokeMethod<String?>(_methodMessenger, arguments);
    } catch (e) {
      return e.toString();
    }
    return result;
  }

  ///share to twitter
  ///[msg] string that you want share.
  Future<void> shareToTwitter({required String msg}) async {
    String urlString = '';
    if (Platform.isAndroid) {
      urlString =
          Uri.encodeFull('http://www.twitter.com/intent/tweet?text=$msg');
    } else {
      urlString = Uri.encodeFull('twitter://post?message=$msg');
    }
    if (await canLaunchUrlString(urlString)) {
      await launchUrlString(
        urlString,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  ///use system share ui
  Future<String?> shareToSystem({required String msg}) async {
    String? result;
    try {
      result =
          await _channel.invokeMethod<String>(_methodSystemShare, {'msg': msg});
    } catch (e) {
      return 'false';
    }
    return result;
  }

  ///share file to instagram
  Future<String?> shareToInstagram(
      {required String filePath, FileType fileType = FileType.image}) async {
    final Map<String, dynamic> arguments = <String, dynamic>{};
    arguments.putIfAbsent('url', () => filePath);
    if (fileType == FileType.image) {
      arguments.putIfAbsent('fileType', () => 'image');
    } else {
      arguments.putIfAbsent('fileType', () => 'video');
    }
    String? result;

    try {
      result =
          await _channel.invokeMethod<String>(_methodInstagramShare, arguments);
    } catch (e) {
      return e.toString();
    }
    return result;
  }
}
