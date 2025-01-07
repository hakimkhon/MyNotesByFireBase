import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotesfire/cubit/auth/auth_cubit.dart';
import 'package:mynotesfire/data/repositories/auth_repository.dart';
import 'package:mynotesfire/data/routes/app_routes.dart';
import 'package:mynotesfire/data/service/navigation_service.dart';
import 'data/service/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 886),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (_) => AuthRepository(),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AuthCubit(
                  context.read<AuthRepository>(),
                ),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'FireBase',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              navigatorKey: NavigationService.instance.navigatorKey,
              onGenerateRoute: AppRoutes.generateRoute,
              initialRoute: AppRoutesNames.signup,
            ),
          ),
        );
      }
    );
  }
}
