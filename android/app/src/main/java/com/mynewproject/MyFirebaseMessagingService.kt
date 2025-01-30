import android.app.NotificationManager
import android.content.Context
import androidx.core.app.NotificationCompat
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage
import com.mynewproject.R

class MyFirebaseMessagingService : FirebaseMessagingService() {

    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        super.onMessageReceived(remoteMessage)

        // Extract badge count from the notification payload
        val badgeCount = remoteMessage.data["badge"]?.toInt() ?: 0

        // Update the badge count
        updateBadgeCount(applicationContext, badgeCount)

        // Handle notification (show notification, etc.)
        sendNotification(remoteMessage.notification?.body)
    }

    private fun sendNotification(messageBody: String?) {
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val notification = NotificationCompat.Builder(this, "default")
            .setContentTitle("New Notification")
            .setContentText(messageBody)
            .setSmallIcon(R.drawable.rn_edit_text_material)  // Your notification icon
            .build()

        notificationManager.notify(0, notification)
    }

    private fun updateBadgeCount(context: Context, count: Int) {
        // Update the badge with the new count
        val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        val notification = NotificationCompat.Builder(context, "default")
            .setContentTitle("New Notifications")
            .setContentText("You have $count unread notifications.")
            .setSmallIcon(R.drawable.rn_edit_text_material)  // Replace with your notification icon
            .setNumber(count)
            .build()

        notificationManager.notify(0, notification)
    }
}