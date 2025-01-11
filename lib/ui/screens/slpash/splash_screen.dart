import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotesfire/data/local/storage_repository.dart';
import 'package:mynotesfire/data/routes/app_routes.dart';
import 'package:mynotesfire/data/service/navigation_service.dart';
import 'package:mynotesfire/ui/core/constant/fixed_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        String userEmail =
            StorageRepository.getString(key: FixedNames.userEmail);
        if (userEmail.isEmpty) {
          NavigationService.instance
              .navigateMyScreenReplacement(routeName: AppRoutesNames.signup);
        }
        else {
          NavigationService.instance
              .navigateMyScreenReplacement(routeName: AppRoutesNames.home);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Loading....",
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
