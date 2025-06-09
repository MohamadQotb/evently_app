import 'package:evently_app/UI/auth/forget_password_screen.dart';
import 'package:evently_app/UI/auth/login_screen/login_screen.dart';
import 'package:evently_app/UI/auth/provider/user_auth_provider.dart';
import 'package:evently_app/UI/auth/regester_screen/regester_screen.dart';
import 'package:evently_app/UI/events/create_event/create_event_screen.dart';
import 'package:evently_app/UI/events/create_event/pick_event_location_screen.dart';
import 'package:evently_app/UI/events/create_event/providers/create_event_provider.dart';
import 'package:evently_app/UI/events/edit_event/edit_event_screen.dart';
import 'package:evently_app/UI/events/event_details/event_details_screen.dart';
import 'package:evently_app/UI/main_screen/main_screen.dart';
import 'package:evently_app/UI/main_screen/models/event_model.dart';
import 'package:evently_app/UI/main_screen/tabs/map_tab/provider/maps_tab_provider.dart';
import 'package:evently_app/UI/onBoarding/on_boarding_screen.dart';
import 'package:evently_app/UI/personalization_screen.dart';
import 'package:evently_app/core/common/app_theme.dart';
import 'package:evently_app/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppSettingsProvider()),
    ChangeNotifierProvider(
      create: (context) => UserAuthProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CreateEventProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => MapsTabProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(
        context.watch<AppSettingsProvider>().language,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        PersonalizationScreen.routeName: (context) =>
            const PersonalizationScreen(),
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegesterScreen.routeName: (context) => const RegesterScreen(),
        ForgetPasswordScreen.routeName: (context) =>
            const ForgetPasswordScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
        CreateEventScreen.routeName: (context) {
          CreateEventProvider provider = Provider.of<CreateEventProvider>(
            context,
          );
          return CreateEventScreen(provider: provider);
        },
        PickEventLocationScreen.routeName: (context) {
          var provider =
              ModalRoute.of(context)?.settings.arguments as CreateEventProvider;
          return PickEventLocationScreen(
            provider: provider,
          );
        },
        EventDetailsScreen.routeName: (context) {
          EventModel event =
              ModalRoute.of(context)?.settings.arguments as EventModel;
          return EventDetailsScreen(
            event: event,
          );
        },
        EditEventScreen.routeName: (context) {
          EventModel event =
              ModalRoute.of(context)?.settings.arguments as EventModel;
          CreateEventProvider provider = Provider.of<CreateEventProvider>(
            context,
          );
          return EditEventScreen(event: event, provider: provider);
        },
      },
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: context.watch<AppSettingsProvider>().themeMode,
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? MainScreen.routeName
          : PersonalizationScreen.routeName,
    );
  }
}
