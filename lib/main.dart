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
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF101A14),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF5F9B6B),
            surface: const Color(0xFF1A281F),
            brightness: Brightness.dark,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF101A14),
            foregroundColor: Color(0xFFE7F0E9),
            elevation: 0,
          ),
          textTheme: ThemeData.dark().textTheme.apply(
            bodyColor: const Color(0xFFE7F0E9),
            displayColor: const Color(0xFFE7F0E9),
            fontFamily: 'DM Sans',
          ),
        ),
        home: const NotesPage(),
      ),
    );
  }
}
