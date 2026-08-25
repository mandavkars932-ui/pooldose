# PoolDose - NOVA-M ORP Pro Controller Flutter Application

This is the complete, ready-to-run Flutter codebase for the **PoolDose / NOVA-M ORP Pro Controller** water chemistry application.

---

## 📱 Quick APK Build Guide

You have two simple ways to build the Android **.APK** file:

### Option A: Local Build (1 Command)
1. Unzip this project folder.
2. Open terminal/command prompt in this folder.
3. Run:
```bash
# On Mac/Linux:
chmod +x build_apk.sh && ./build_apk.sh

# Or directly with Flutter CLI:
flutter pub get
flutter build apk --release
```
4. Your standalone installer APK will be generated at:
```
build/app/outputs/flutter-apk/app-release.apk
```

---

### Option B: Automatic Free Cloud APK Build (GitHub Actions)
1. Create a new GitHub repository (public or private).
2. Push this unzipped folder to GitHub.
3. Go to the **Actions** tab on your GitHub repository.
4. Click on **Build PoolDose Android APK** -> **Run workflow**.
5. Once finished (~2 mins), download the compiled **pooldose-release-apk.zip** containing `app-release.apk` directly from the Artifacts section!

---

## 📦 Features Included
- **Live ORP & pH Telemetry**: Real-time monitor for pool chemistry (ORP mV and pH levels).
- **Interactive QR Barcode Scanner**: Pair new pool controllers instantly by scanning QR codes.
- **Historical Trends & Charts**: Line charts powered by `fl_chart` for hourly, daily, and weekly ORP/pH analysis.
- **Firebase Firestore Integration**: Synchronized pool documents and telemetry log records.
- **Multiple Pool Controller Management**: Switch between different pools (Main Olympic Pool, Lagoon Pool, Water Park).
- **Android Manifest & Gradle Config**: Pre-configured camera & network permissions.

---

## 🚀 Running on Emulators or Devices

```bash
flutter run
```
