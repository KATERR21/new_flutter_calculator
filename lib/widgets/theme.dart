import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_flutter_calculator/utils/global_theme.dart';
import 'package:new_flutter_calculator/utils/strings.dart';

class ThemeApp extends StatelessWidget {
  const ThemeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: const ThemeScreen(),
    );
  }
}

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/catalog': (context) => const SecondScreen(),
        '/basket': (context) => const ThirdScreen(),
        '/setting': (context) => const FourthScreen(),
      },
    );
  }
}

Widget navDrawer(context) =>
    Drawer(
      child: ListView(
          padding: EdgeInsets.zero, children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.lightBlue,
          ),
          child: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                  ),
                  child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/330px-Google-flutter-logo.svg.png'),
                ),
                const Text('Навигация во Flutter')
              ],
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Главная'),
          onTap: () {
            //Navigator.pop(context);
            Navigator.pushNamed(context, '/');
          },
        ),
        ListTile(
          leading: const Icon(Icons.widgets),
          title: const Text('Каталог'),
          onTap: () {
            Navigator.pushNamed(context, '/catalog');
          },
        ),
        ListTile(
          leading: const Icon(Icons.shopping_bag_outlined),
          title: const Text('Корзина'),
          onTap: () {
            Navigator.pushNamed(context, '/basket');
          },
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Профиль'),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Настройки'),
          onTap: () {
            Navigator.pushNamed(context, '/setting');
          },
        ),
      ]),
    );

//Главная
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _currentSliderValue = 20;
  bool _isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return MaterialApp(
      theme: globalTheme(),
      home: Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              TextButton(onPressed: (){Navigator.pushNamed(context, '/catalog');},
                child: const Text('Каталог'),
                style: buttonStyle,),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/basket');},
                  icon: const Icon(Icons.shopping_bag_outlined)),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/setting');},
                  icon: const Icon(Icons.settings)),
            ],
            title: const Text('Главная')),
        drawer: navDrawer(context),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('Заголовок', style: Theme.of(context).textTheme.headline5),
                Container(
                  height: 100,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                ElevatedButton(onPressed: () {}, child: Text('Войти')),
                Text(Strings.longBodyText, textAlign: TextAlign.center,),
                Slider(
                  value: _currentSliderValue,
                  max: 100,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {_currentSliderValue = value;});
                  },
                ),
                SwitchListTile(
                    title: const Text('Тёмная тема'),
                    value: _isDarkTheme, onChanged: (val) {
                  setState(() {
                    _isDarkTheme = !_isDarkTheme;});
                }
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: 'Профиль'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), label: 'Баланс'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Настройки'),
          ],
        ),
      ),
    );
  }
}

//Каталог
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              TextButton(onPressed: (){Navigator.pushNamed(context, '/');},
                child: const Text('На главную'),
                style: buttonStyle,),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/basket');},
                  icon: const Icon(Icons.shopping_bag_outlined)),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/setting');},
                  icon: const Icon(Icons.settings)),
            ],
            title: const Text('Каталог')),
        drawer: navDrawer(context),
        body: const Center(
          child: Text('Каталог'),
        )
    );
  }
}

//Корзина
class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              TextButton(onPressed: (){Navigator.pushNamed(context, '/');},
                child: const Text('На главную'),
                style: buttonStyle,),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/catalog');},
                  icon: const Icon(Icons.widgets)),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/setting');},
                  icon: const Icon(Icons.settings)),
            ],
            title: const Text('Корзина')),
        drawer: navDrawer(context),
        body: const Center(
          child: Text('Корзина'),
        )
    );
  }
}

//Настройки
class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
        appBar: AppBar(
            actions: <Widget>[
              TextButton(onPressed: (){Navigator.pushNamed(context, '/');},
                child: const Text('На главную'),
                style: buttonStyle,),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/catalog');},
                  icon: const Icon(Icons.widgets)),
              IconButton(onPressed: (){Navigator.pushNamed(context, '/basket');},
                  icon: const Icon(Icons.shopping_bag_outlined)),
            ],
            title: const Text('Настройки')),
        drawer: navDrawer(context),
        body: const Center(
          child: Text('Настройки'),
        )
    );
  }
}