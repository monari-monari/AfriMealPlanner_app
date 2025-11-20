import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Singleton NotificationService for handling local notifications and timezone setup.
class NotificationService {
  // --- 1. Singleton Setup ---
  // Private constructor
  NotificationService._internal();

  // Static final instance
  static final NotificationService _instance = NotificationService._internal();

  // Factory constructor to return the instance
  factory NotificationService() => _instance;

  // --- 2. Class Fields ---
  // The plugin instance. Made 'final' since it's only initialized once.
  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  
  // Define a constant for the Android icon
  static const String _androidIcon = '@mipmap/ic_launcher';

  // --- 3. Initialization ---

  /// Initialize notifications and timezone configuration.
  /// Call this once on app start (e.g., in main() before runApp or in app init).
  Future<void> init() async {
    if (_initialized) return;

    // Initialize timezone package and set local location
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));

    // Android initialization
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings(_androidIcon); 

    // iOS/macOS initialization
    // Setting request permissions to true here makes the call to 
    // .resolvePlatformSpecificImplementation() redundant, cleaning up the code.
    const DarwinInitializationSettings darwinInitSettings =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    final InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: darwinInitSettings,
      macOS: darwinInitSettings,
    );

    // Initialization call
    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );

    // Removed the manual platform permission check block for iOS/macOS 
    // as it's handled by setting the flags in DarwinInitializationSettings.
    if (Platform.isAndroid) {
      // Note: Android 13+ requires POST_NOTIFICATIONS permission at runtime. 
      // This part remains as a comment/reminder, as the package doesn't handle it.
    }

    _initialized = true;
  }

  // --- 4. Handlers (Required by the plugin) ---

  // Fallback handler for older iOS versions (iOS < 10)
  static void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    // Implement logic for older iOS versions (e.g., show a dialog)
  }

  // Handler for notification taps (iOS >= 10, Android, macOS)
  static void _onDidReceiveNotificationResponse(NotificationResponse response) {
    // Implement logic for notification taps here. 
    // Use response.payload or response.notificationResponseType (Tapped or Dismissed)
    // Example: navigate to a screen based on payload
  }
  
  // --- 5. Example Public Methods (To make the class functional) ---

  /// Example: Show a simple notification immediately
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'default_channel_id', // Must match one defined in AndroidManifest.xml
      'General Notifications',
      channelDescription: 'General app alerts',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      // Default Darwin details are fine for immediate show
      iOS: DarwinNotificationDetails(), 
      macOS: DarwinNotificationDetails(),
    );

    await _plugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}