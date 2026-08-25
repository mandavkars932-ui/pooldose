#!/bin/bash
echo "=========================================================="
echo " Building PoolDose NOVA-M ORP Controller Android APK      "
echo "=========================================================="

# Check if Flutter is installed
if ! command -v flutter &> /dev/null
then
    echo "❌ Flutter SDK could not be found. Please install Flutter from https://flutter.dev"
    exit 1
fi

echo "📦 Fetching packages..."
flutter pub get

echo "🔨 Building Release APK..."
flutter build apk --release

if [ $? -eq 0 ]; then
    echo "✅ SUCCESS! Your APK is ready at:"
    echo "👉 build/app/outputs/flutter-apk/app-release.apk"
    echo ""
    echo "To install directly to a connected Android phone:"
    echo "   flutter install"
else
    echo "❌ Build failed. Please check the logs above."
fi
