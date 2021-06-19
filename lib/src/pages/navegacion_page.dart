import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
            title: Text('Notifications Page'), backgroundColor: Colors.pink),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.bone),
          label: 'Bones',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0.0,
                right: 0.0,
                /* child:
                    Icon(Icons.brightness_1, size: 8, color: Colors.redAccent), */
                child: BounceInDown(
                  from: 10,
                  animate: (numero > 0) ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (controller) =>
                        Provider.of<_NotificationModel>(context)
                            .bounceController = controller,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          color: Colors.redAccent, shape: BoxShape.circle),
                      child: Text(
                        '$numero',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              )
            ],
          ),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.dog),
          label: 'My Dog',
        ),
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        final notificationModel =
            Provider.of<_NotificationModel>(context, listen: false);
        int numero = notificationModel.numero;
        numero++;
        notificationModel.numero = numero;
        if (numero >= 2) {
          final controller = notificationModel.bounceController;
          controller.forward(from: 0.0);
        }
      },
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.pink,
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController _bounceController;

  int get numero => this._numero;

  set numero(int valor) {
    this._numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController controller) {
    this._bounceController = controller;
  }
}
