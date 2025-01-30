package com.mynewproject

import android.app.NotificationManager
import android.content.Context
import androidx.core.app.NotificationCompat
import com.facebook.react.ReactActivity
import com.facebook.react.ReactActivityDelegate
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.fabricEnabled
import com.facebook.react.defaults.DefaultReactActivityDelegate

class MainActivity : ReactActivity() {

  /**
   * Returns the name of the main component registered from JavaScript. This is used to schedule
   * rendering of the component.
   */
  override fun getMainComponentName(): String = "MyNewProject"

  /**
   * Returns the instance of the [ReactActivityDelegate]. We use [DefaultReactActivityDelegate]
   * which allows you to enable New Architecture with a single boolean flags [fabricEnabled]
   */
  override fun createReactActivityDelegate(): ReactActivityDelegate =
      DefaultReactActivityDelegate(this, mainComponentName, fabricEnabled)


      fun setBadge(context: Context, count: Int) {
    val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
    val notification = NotificationCompat.Builder(context, "default")
        .setContentTitle("New Notifications")
        .setContentText("You have $count unread notifications.")
        .setSmallIcon(R.drawable.rn_edit_text_material)  // Replace with your app's notification icon
        .setNumber(count)  // Set the badge count
        .build()

    notificationManager.notify(0, notification)
}
}
