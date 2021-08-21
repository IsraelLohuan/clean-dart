import 'package:flutter/material.dart' hide Router;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:github_search_dart_clean/app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(),));
}


