import 'package:exemplo_modular/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InternalPage extends StatefulWidget {
  final String title;
  final Color color;

  const InternalPage({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  State<InternalPage> createState() => _InternalPageState();
}

class _InternalPageState extends State<InternalPage> {
  final Repo repo = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.color,
      child: Center(child: Text(repo.titulo(widget.title))),
    );
  }
}
