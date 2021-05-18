import 'package:flutter/material.dart';
import 'package:robles/route_generator.dart';

void main() => runApp(MyRoblesApp());

class MyRoblesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruteo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: "/",
      // home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }//Fin de widget
}//Fin de clase myroblesapp

class PageOne extends StatelessWidget {
  String _params = "hola desde p1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();
 
  PageOne({
    Key key,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Primer pantalla Alan Robles'),
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text(
              "Siguiente pagina",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.blueGrey,
            onPressed: () {
              _openSecondPage(context);
            },
          ),
        ),
      ),
    );
  }//Fin de widget
 
  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );
 
    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Nombre ingresado: $_datoRetornadoDeSecondPage",
        ),
      ),
    );
  }//Fin de opensecondpage
}//Fin clase pageone