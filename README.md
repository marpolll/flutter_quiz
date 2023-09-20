## flutter quiz

- flutter 을 활용한 퀴즈
- android

## 세팅
- dart pub global activate flutterfire_cli
- firebase login
- flutterfire configure --project=flutter-quiz-3e78b
- flutter pub add firebase_core
- flutter pub add firebase_auth

## 파이어 베이스 배포
- firebase init
- Use an exising project 선택

## 파이어베이스에 만들어둔 프로젝트 선택
- What do you want to use as your public directory? public
- Configure as a single-page app (rewrite all urls to /  index.html)? Yes
- Set up automatic builds and deploys with GitHub? No
- flutter build web
- firebase.json 에서 "public": "public" 을 "public": "build/web" 으로 수정
- firebase deploy

## apk 파일 생성
- flutter build apk --release --target-platform=android-arm64
- build/app/outputs/apk/relase/app-relase.apk

## 빌드시에 Dex 오류 발생하는 경우
- project / android / app / build.gradle 파일을 찾는다
- 파일에서 defaultConfig 항목을 찾는다. multiDexEnabled true 추가
- defaultConfig {
  versionName flutterVersionName
  multiDexEnabled true
} 