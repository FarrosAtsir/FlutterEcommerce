import 'package:ecommerce/routes.dart';
import 'package:ecommerce/screen/home/home_screen.dart';
import 'package:ecommerce/screen/loading/loading_screen.dart';
import 'package:ecommerce/state_managements/auth_provider.dart';
import 'package:ecommerce/state_managements/cart_provider.dart';
import 'package:ecommerce/state_managements/favourite_provider.dart';
import 'package:ecommerce/state_managements/product_provider.dart';
import 'package:ecommerce/state_managements/theme_provider.dart';
import 'package:ecommerce/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>ThemeProvider()),
            ChangeNotifierProvider(create: (context)=>AuthProvider()),
            ChangeNotifierProvider(create: (context)=>CartProvider()),
            ChangeNotifierProvider(create: (context)=>FavouriteProvider()),
            ChangeNotifierProvider(create: (context) => ProductProvider()),
          ],
          child: MyApp(isLoggedIn: isLoggedIn)
        );
      }
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) {
        return MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          theme: themeData(theme.isDarkMode),
          darkTheme: ThemeData.dark(),
          initialRoute: isLoggedIn ? HomeScreen.routeName : LoadingScreen.routeName,
          routes: routes,
        );
      }
    );
  }
}
