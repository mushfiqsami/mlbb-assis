import 'package:flutter/material.dart';

import 'presentation/logic/draft_logic.dart';
import 'presentation/state/draft_state.dart';
import 'presentation/screens/draft_screen.dart';
import 'domain/services/draft_service.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late final DraftService service;
  late final DraftState state;
  late final DraftLogic logic;

  @override
  void initState() {
    super.initState();
    service = DraftService();
    state = DraftState();
    logic = DraftLogic(service, state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DraftScreen(
        logic: logic,
        state: state,
      ),
    );
  }
}
