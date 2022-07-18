import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart2/providers/Api%20Provider.dart';
import 'package:smart2/providers/Auth%20Provider.dart';
import 'package:smart2/providers/bg%20service%20provider.dart';
import 'package:smart2/providers/logs%20provider.dart';
import 'package:smart2/providers/notification%20provider.dart';
import 'package:smart2/providers/sound%20provider.dart';
import 'package:smart2/screens/Login%20Screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SoundProvider(),),
        ChangeNotifierProvider(create: (context) => ApiProvider(),),
        ChangeNotifierProvider(create: (context) => NotificationProvider(),),
        ChangeNotifierProvider(create: (context) => BgServices(),),
        ChangeNotifierProvider(create: (context) => AuthProvider(),),
        ChangeNotifierProvider(create: (context) => LogsProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
