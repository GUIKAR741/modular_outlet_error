import 'package:exemplo_modular/modulo1.dart';
import 'package:exemplo_modular/modulo2.dart';
import 'package:exemplo_modular/modulo3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  return runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Exemplo Modular',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: Modular.routerConfig,
    ); //added by extension
  }
}

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage(), children: [
      ModuleRoute('/page1', module: Modulo1()),
      ModuleRoute('/page2', module: Modulo2()),
      ModuleRoute('/page3', module: Modulo3()),
    ]);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0;

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
    Modular.to.navigate(_telas[_indiceAtual]);
  }

  @override
  void initState() {
    super.initState();
    Modular.to.navigate('/page1/');
  }

  final List<String> _telas = [
    "/page1/",
    "/page2/",
    "/page3/",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: const RouterOutlet(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Page1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: "Page2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Page3",
          ),
        ],
      ),
    );
  }
}
