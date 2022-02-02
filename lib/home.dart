import 'package:flutter/material.dart';
import 'package:youtube_clone/screens/Em_alta.dart';
import 'package:youtube_clone/screens/biblioteca.dart';
import 'package:youtube_clone/screens/inicio.dart';
import 'package:youtube_clone/screens/inscricao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const Inicio(),
      const EmAlta(),
      const Inscricao(),
      const Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print("video");
            },
            icon: const Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {
              print("pesquisa");
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("conta");
            },
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Center(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // Fixe 3 itens, shifting para mais itens
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // backgroundColor: Colors.orange,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.red,
            icon: Icon(Icons.whatshot),
            label: 'Em Alta',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.blue,
            icon: Icon(Icons.subscriptions),
            label: 'Inscrições',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.deepPurple,
            icon: Icon(Icons.folder),
            label: 'Biblioteca',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
