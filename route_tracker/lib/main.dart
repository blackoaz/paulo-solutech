import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:route_tracker/blocs/activitiesBloc.dart';
import 'package:route_tracker/blocs/createVisitsBloc.dart';
import 'package:route_tracker/screens/Homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider<ActivitiesBloc>(
          create: (_) => ActivitiesBloc(),
        ),
        ChangeNotifierProvider<CreateVisitsBloc>(create: (_) => CreateVisitsBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF3A7BB6)),
        ),
        home: const Homepage(),
        routes: <String, WidgetBuilder>{
          '/homepage': (BuildContext context) => Homepage(),
        }

      ),

    );
  }
}

