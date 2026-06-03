import 'package:elite_academy/ext_package/hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:flutter/material.dart';

class MyProvider extends InheritedWidget {
  final SimpleHiddenDrawerController controller;

  const MyProvider({
    super.key,
    required this.controller,
    required super.child,
  });

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
