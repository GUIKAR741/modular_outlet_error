import 'package:exemplo_modular/InternalPage.dart';
import 'package:exemplo_modular/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Modulo3 extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(Repo.new);
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => const InternalPage(title: 'page 3', color: Colors.green));
  }
}
