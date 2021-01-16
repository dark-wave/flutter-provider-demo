import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/services/counter_service.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    final counterService = Provider.of<CounterService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Has pulsado el boton:',
              ),
              Text(
                '${counterService.counter} veces',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _botonDecrementar(context),
          _botonIncrementar(context)
        ],
      ),
    );
  }

  Container _botonIncrementar(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: (){
          final counterService = Provider.of<CounterService>(context, listen: false);
          counterService.increase();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Container _botonDecrementar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: (){
          final counterService = Provider.of<CounterService>(context, listen: false);
          counterService.decrease();
        },
        tooltip: 'Decrease',
        child: Icon(Icons.remove),
      ),
    );
  }
}