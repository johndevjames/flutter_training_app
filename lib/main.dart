import 'package:flutter/material.dart';
import 'package:flutter_training_app/screens/TrainerScreen.dart';
import 'package:provider/provider.dart';
import 'models/TrainerFilterModel.dart';
import 'models/TrainersModel.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(MyTrainingApp());
}

class MyTrainingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => TrainerFilter()),
        ChangeNotifierProxyProvider<TrainerFilter, TrainersModel>(
          create: (context) => TrainersModel(),
          update: (context, catalog, trainersList) {
            if (trainersList == null) throw ArgumentError.notNull('trainersList');
            trainersList.trainers = catalog;
            return trainersList;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        // home: TrainingsHomeScreen(title: 'Trainings'),
        initialRoute: '/',
        routes: {
          '/': (context) => TrainingsHomeScreen(title: 'Trainings'),
          '/trainerDetailsScreen': (context) => const TrainerDetailsScreen(),
        },
      ),
    );
  }
}


