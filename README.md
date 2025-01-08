# mynotesfire

Proektni yaratib firebasega ulab bo'lgandan keyin kerakli kutubxonalar(Dependency)ni proektga qo'shib olamiz [firebase_core^] [lib/] ichidagi [firebase_options.dart] faylni [service/] ichiga olamiz, [google-services.json] yo'q bo'lsa [ios/Runner/] ichiga majburiy qo'shamiz. [main.dart] o'zgartirish kiritamiz. 
dasturni ishga tushiramiz [Error: Gradle task assembleDebug failed with exit code 1} xatolik chiqsa [android/settings.gradle] ga o'zgartirish kiritamiz [id 'com.android.application' version '8.1.0'} keyin [flutter clean, flutter pub get, flutter run]

firestore bilan ishlash uchun kerakli kutubxonalar(Dependency)ni proektga qo'shib olamiz [cloud_firestore^]

[user_reository.dart] va [user_cubit.dart] [user_state.dart] yozib bo'lganimizda keyin [main.dart] ga kerakli o'zgartirishlarni kiritamiz, yani [MultiRepositoryProvider va MultiBlocProvider} so'ngra [user_cubit.dart] ichiga <fetchUser> nomli Future yozamiz  

