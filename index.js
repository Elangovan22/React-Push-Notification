import { AppRegistry } from 'react-native';
import App from './App';
import { name as appName } from './app.json';
import firebase from '@react-native-firebase/app';

  const firebaseConfig = {
    apiKey: "",
    authDomain: "",
    projectId: "",
    storageBucket: "",
    messagingSenderId: "",
    appId: "",
    measurementId: "",
    databaseURL: ""
  };
  
  if (!firebase.apps.length) {
    firebase.initializeApp(firebaseConfig)
      .then(() => console.log('🔥 Firebase initialized successfully'))
      .catch(error => console.error('🚨 Firebase init error:', error));
  } else {
    console.log('🔥 Firebase already initialized');
  }



AppRegistry.registerComponent(appName, () => App);
