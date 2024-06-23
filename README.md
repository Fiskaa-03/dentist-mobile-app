# dentist_app

## Get Start! Follow this step

1. Install Git pada device anda
   
2. Lakukan git clone pada repo ini
   https://github.com/Fiskaa-03/dentist-mobile-app.git
   
3. Setelah itu, jalankan command “flutter pub get” pada terminal (pastikan anda melakukan nya pada tempat / folder project app ini)
  
4. Pada file “android/app/build.gradle”
    Ubah compileSdkVersion flutter.compileSdkVersion menjadi compileSdkVersion 34
   
    dan
    
    Ubah minSdkVersion flutter.minSdkVersion
     menjadi minSdkVersion 21

5. Pada file android/build.gradle
    Ubah menjadi
    ext.kotlin_version = '2.0.0'

6. Pada file android/app/src/main/AndroidManifest.xml Tambahkan
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>

    Setelah tag  <manifest … package="location">

    Dan
   
    <action android:name="android.media.action.IMAGE_CAPTURE" />
    Di dalam tag  <intent-filter>

7. (Opt) Tambahkan 
      camera: ^0.10.5+9
      path_provider: ^2.1.3
      path: ^1.8.3
      location: ^5.0.0
      geolocator: ^11.1.0
    
    		Pada pubspec.yaml pada bagian dependencies (jika belum ada)

8. Jalakan android virtual anda
9. And you are good to go

# dentist-mobile-app
