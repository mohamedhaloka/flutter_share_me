# flutter_share_me

Flutter Plugin for sharing contents to social media.

You can use it share to Facebook , Messenger , Instagram , WhatsApp(WhatsAppBusiness) , Twitter, telegram ,snapchat And System Share UI.
Support Url and Text.

support:
 - Android Only :  Messenger, Snapchat

 - Android & iOS :  Facebook,WhatsApp(WhatsAppBusiness),Twitter,Instagram,System Share

**Note: This plugin is still under development, and some APIs might not be available yet.  
Feedback and Pull Requests are most welcome!**

## Getting Started

Download this repo and use it as local dependencies
in pubspec.yaml in your project
```
flutter_share_me:
    path: path of this package
```

## Setup 

#### Android

Add "facebook app id" to the application tag of AndroidManifest.xml
```
<manifest xmlns:android="http://sche...

    <queries>
            <provider android:authorities="com.facebook.katana.provider.PlatformProvider" />
    </queries>

    <application>
       ...
       //add this 
        <meta-data
            android:name="com.facebook.sdk.ApplicationId"
            android:value="@string/facebook_app_id" />
    </application>
</manifest>
```

string.xml:
```
<?xml version="1.0" encoding="utf-8"?>
<resources>
<!-- Replace "343254889799245" with your Facebook App ID here. -->
    <string name="facebook_app_id">343254889799245</string>
</resources>
```


#### IOS
    
##### setup facebook

make sure you add below details in your plist file.

```
<key>FacebookAppID</key>
<string>fbid</string>
<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>fb-your-fb-id</string>
			</array>
		</dict>
	</array>

```
Note-: Make sure you add fb in  at start of your fb Id in CFBundleURLSchemes.

Add below value in url scheme(Refer to example).


```<key>LSApplicationQueriesSchemes</key>
	<array>
		<string>fbauth2</string>
		<string>fbapi</string>
		<string>fbapi20130214</string>
		<string>fbapi20130410</string>
		<string>fbapi20130702</string>
		<string>fbapi20131010</string>
		<string>fbapi20131219</string>
		<string>fbapi20140410</string>
		<string>fbapi20140116</string>
		<string>fbapi20150313</string>
		<string>fbapi20150629</string>
		<string>fbapi20160328</string>
		<string>fbauth</string>
		<string>fb-messenger-share-api</string>
		<string>fbauth2</string>
		<string>fbshareextension</string>
		<string>tg</string>
	</array>
```

### Setup Whatsapp

Make sure you add whatsapp in plist.

````<key>LSApplicationQueriesSchemes</key>
        <array>
            <string>whatsapp</string>
        </array>
````

#### Setup Twitter

````<key>LSApplicationQueriesSchemes</key>
        <array>
            <string>twitter</string>
        </array>
````

## Usage

#### Add the following imports to your Dart code:

```
import 'package:flutter_share_me/flutter_share_me.dart';
```

## Methods

### facebook
#### shareToFacebook({String msg, String url,String clientToken})

- How i can get Client Token? ..
go to Meta for Developer and create app > Setting > Advanced > Security Section > Copy Client Token

### messenger
#### shareToMessenger({String msg, String url})

### twitter
#### shareToTwitter({String msg, String url})   

### whatsapp
#### shareToWhatsApp({String msg,String imagePath})
#### shareToWhatsApp4Biz({String msg,String imagePath})  (only android)
#### shareWhatsAppPersonalMessage(String message ,String phoneNumber)

### instagram
#### shareToInstagram({String filePath, FileType fileType})

### telegram
#### shareToTelegram({String msg})

### snapchat
#### shareToSnapchat({String file,String appSignature})

- What is app signature? ..
app signature is a package name in android or bundle id iOS .. put your package name of your app

### system
#### shareToSystem({String msg})   use system share ui

These methods will return "success" if they successfully jump to the corresponding app.

| Parameter  | Description  |
| :------------ | :------------ |
| String msg  | Text message  |
| String url  | Url url  |
| String imagePath  |The local path of the image   |
| String file  |The local path of the file   |

## Example
```
 Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => onButtonTap(Share.facebook),
                child: Text('share to FaceBook'),
              ),
              ElevatedButton(
                onPressed: () => onButtonTap(Share.messenger),
                child: Text('share to Messenger'),
              ),
              ElevatedButton(
                onPressed: () => onButtonTap(Share.twitter),
                child: Text('share to Twitter')),
              ElevatedButton(
                onPressed: () => onButtonTap(Share.whatsapp),
                child: Text('share to WhatsApp'),
              ),
              ElevatedButton(
                onPressed: () => onButtonTap(Share.whatsapp_business),
                child: Text('share to WhatsApp  Business'),
              ),
              ElevatedButton(
                onPressed: () => onButtonTap(Share.whatsapp_personal),
                child: Text('share to WhatsApp  Personal'),
              ),
              ElevatedButton(
                onPressed: () => onButtonTap(Share.share_snapchat),
                child: Text('share to Snapchat'),
              ),
              ElevatedButton(
                onPressed: () => onButtonTap(Share.share_system),
                child: Text('share to System'),
              ),
            ],
          ),
        )
```

