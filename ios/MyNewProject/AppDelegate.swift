import UIKit
import React
import React_RCTAppDelegate
import ReactAppDependencyProvider
import Firebase
import UserNotifications

@main
class AppDelegate: RCTAppDelegate {
  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    self.moduleName = "MyNewProject"
    self.dependencyProvider = RCTAppDependencyProvider()

    // You can add your custom initial props in the dictionary below.
    // They will be passed down to the ViewController used by React Native.
    self.initialProps = [:]
    
    FirebaseApp.configure()
    
    UNUserNotificationCenter.current().delegate = self
    application.registerForRemoteNotifications()
    
    // Request Notification permission
    UNUserNotificationCenter.current().requestAuthorization(
      options: [.alert, .badge, .sound]) { granted, error in
        if granted {
          print("Notification permission granted")
        } else {
          print("Notification permission denied")
        }
      }
    application.registerForRemoteNotifications()
    
    

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  // This function will be called when a notification is received
  func userNotificationCenter(
      _ center: UNUserNotificationCenter,
      didReceive response: UNNotificationResponse,
      withCompletionHandler completionHandler: @escaping () -> Void
  ) {
      // Handle the push notification
      print("Received a notification: \(response.notification.request.content.userInfo)")
      completionHandler()
  }

  // This function will be called when the app is in the foreground and a notification is received
  func userNotificationCenter(
      _ center: UNUserNotificationCenter,
      willPresent notification: UNNotification,
      withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
      completionHandler([.alert, .badge, .sound]) // Show the notification while in the foreground
  }

  override func sourceURL(for bridge: RCTBridge) -> URL? {
    self.bundleURL()
  }

  override func bundleURL() -> URL? {
#if DEBUG
    RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index")
#else
    Bundle.main.url(forResource: "main", withExtension: "jsbundle")
#endif
  }
}
