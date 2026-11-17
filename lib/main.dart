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
          colorSchemeSeed: Colors.blue,
          brightness: Brightness.light,
        ),
        home: const NotesPage(),
      ),
    );
  }
}
