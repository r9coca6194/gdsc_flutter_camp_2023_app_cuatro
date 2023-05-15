import 'dart:io';

import 'package:flutter/services.dart';
import 'package:gdsc_flutter_camp_2023_app_cuatro/config/Theme/theme.dart';
import 'package:gdsc_flutter_camp_2023_app_cuatro/presentation/providers/news_provider.dart';
import 'package:gdsc_flutter_camp_2023_app_cuatro/presentation/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/detail': (context) => const DetailPage(),
        },
        theme: ThemeApp().theme(),
      ),
    );
  }
}
