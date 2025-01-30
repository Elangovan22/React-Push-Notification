


// Attempt 4
import React, { useEffect } from 'react';
import { Alert, Platform } from 'react-native';
import { SafeAreaView, Text } from 'react-native';
import messaging from '@react-native-firebase/messaging';



    async function requestUserPermission() {
      const authStatus = await messaging().requestPermission();
      console.log('Notification permission status:', authStatus);

      if (authStatus === messaging.AuthorizationStatus.AUTHORIZED || authStatus === messaging.AuthorizationStatus.PROVISIONAL) {
        // Get the FCM token
        messaging()
          .getToken()
          .then(token => {
            console.log('FCM Token:', token);
          })
          .catch(error => {
            console.error('Error fetching FCM token:', error);
          });
      }
    }

function App(): React.JSX.Element {
  useEffect(() => {
    // Request permission for push notifications
    requestUserPermission();

    // Foreground notification listener
    // const unsubscribeOnMessage = messaging().onMessage(async remoteMessage => {
    //   console.log('📩 Foreground Notification:', remoteMessage);
    //   Alert.alert('New Notification', remoteMessage.notification?.body || '');
    // });

    // Background & Quit state notification listener
    messaging().setBackgroundMessageHandler(async remoteMessage => {
      console.log('📩 Background Notification:', remoteMessage);
    });



    messaging().onMessage(async remoteMessage => {
      try {
        console.log('Foreground notification received:', remoteMessage);
        showAlert("Title", ""+remoteMessage.notification?.body);


        // Handle the notification here, for example, show an alert or update UI
      } catch (error) {
        // crashlytics().log('Log before the crash');
        // crashlytics().recordError(new Error('Test error'));
        console.error('Error handling foreground notification:', error);
      }
    });
  
    messaging().onNotificationOpenedApp(remoteMessage => {
      console.log('Notification caused app to open from background state:', remoteMessage.notification);
      // Handle navigation or actions here
    });
  


// Helper function to show alert
const showAlert = (title: string, message: string) => {
  Alert.alert(title, message, [{ text: 'OK' }]);
};


  }, []);

  





    return (
    <SafeAreaView>
      <Text>🔥 Firebase Initialized</Text>
    </SafeAreaView>
  );
}

export default App;