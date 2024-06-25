import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseAnalytics _firebaseAnalytics = FirebaseAnalytics.instance;

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleMessage(message);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessage(message);
    });

    String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');
  }

  void _handleMessage(RemoteMessage message) {
    print('Получено сообщение!');
    print('Данные сообщения: ${message.data}');

    if (message.notification != null) {
      print('Сообщение также содержит уведомление: ${message.notification}');
    }

    _logAnalyticsEvent(message);
  }

  void _logAnalyticsEvent(RemoteMessage message) {
    _firebaseAnalytics.logEvent(
      name: 'notification_received',
      parameters: {
        'message_id': message.messageId,
        'sender_id': message.senderId,
        'message_data': message.data,
      },
    );
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print('Обработка фонового сообщения: ${message.messageId}');
  }
}
