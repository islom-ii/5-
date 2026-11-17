import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/injection.dart';
import 'presentation/bloc/notes_bloc.dart';
import 'presentation/bloc/notes_event.dart';
import 'presentation/pages/notes_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotesBloc>()..add(const LoadNotesEvent()),
      child: MaterialApp(
        title: 'Заметки',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF5F4EF),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF536B55),
            surface: const Color(0xFFFFFEFA),
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFF5F4EF),
            foregroundColor: Color(0xFF242923),
            elevation: 0,
          ),
          textTheme: ThemeData.light().textTheme.apply(
            bodyColor: const Color(0xFF242923),
            displayColor: const Color(0xFF242923),
            fontFamily: 'DM Sans',
          ),
        ),
        home: const NotesPage(),
      ),
    );
  }
}
