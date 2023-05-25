import 'package:flutter/material.dart';
import 'package:flutter_booking_app/future/splash/splash_provider.dart';
import 'package:flutter_booking_app/product/constants/color_constants.dart';
import 'package:flutter_booking_app/product/constants/string_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/base/state/network/connectivity_plus.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  final splashProvider =
      StateNotifierProvider<SplashNotifier, SplashState>((ref) {
    return SplashNotifier();
  });
  final internetProvider =
      StateNotifierProvider<InternetCheckNotifier, InternetCheckState>((ref) {
    return InternetCheckNotifier();
  });

  

  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => ref.read(internetProvider.notifier).checkInternetConnectivity(),
    );
  }

  void showNoInternetDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No Internet Connection'),
          content: const Text('Please check your internet connectivity.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool hasInternet = ref.read(internetProvider).hasInternet ?? false;
    if (!hasInternet) showNoInternetDialog();
    return const Scaffold(
      backgroundColor: ColorConstants.primary,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            StringConstants.appName,
            style: TextStyle(
                color: ColorConstants.white,
                fontSize: 33,
                fontWeight: FontWeight.bold),
          ),
        )
      ]),
    );
  }
}
