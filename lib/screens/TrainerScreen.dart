import 'package:flutter/material.dart';
import 'package:flutter_training_app/Constants.dart';
import 'package:flutter_training_app/models/TrainerFilterModel.dart';

class TrainerDetailsScreen extends StatelessWidget {
  const TrainerDetailsScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as TrainersDetailsModel;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/bannerImage.jpg'),
                      fit: BoxFit.cover
                  )
              ),
              child: Container(
                width: double.infinity,
                height: 200,
                child: Container(
                  alignment: Alignment(0.0,2.1),
                  child: CircleAvatar(

                    backgroundImage: AssetImage('images/roundImage.jpg'),
                    radius: 50.0,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 60,
            ),
            Text(
              args.trainerName
              ,style: TextStyle(
                fontSize: 25.0,
                color:Colors.blueGrey,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w400
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              args.trainerLocation
              ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Oct 11-13 -2019'
              ,style: TextStyle(
                fontSize: 15.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),

                elevation: 2.0,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                    child: Text("Skill Sets",style: TextStyle(
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300
                    ),))
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              args.trainerTitle
              ,style: TextStyle(
                fontSize: 18.0,
                color:Colors.black45,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300
            ),
            ),

            SizedBox(
              height: 50,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppConstants.scrumMasterDetails,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16.0,
                  color:Colors.black45,
                  fontWeight: FontWeight.w400
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
