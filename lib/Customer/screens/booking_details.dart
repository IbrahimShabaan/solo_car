import 'package:flutter/material.dart';

import '../../Shared/components.dart';
import '../../Shared/constants.dart';
import 'copoun_page.dart';

class Booking_Details extends StatelessWidget {
   Booking_Details({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: AppButtons.customButtonBack(context),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin*2),
            child: Row(
              children: [
                Text('BOOKING',style: TextStyle(fontSize: 35,color: Colors.white),),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin*2),
            child: Row(
              children: [
                Text('DETAILS',style: TextStyle(fontSize: 35,color: Colors.white),),

              ],
            ),
          ),

          Stack(
            children: [


              Container(

                margin: EdgeInsets.only(top:size.height*0.3 ),
                height: 388,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Ayman Bond',style: TextStyle(color: Colors.black,fontSize: 25,
                        fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 20,),
                        Text('01091010445',style: TextStyle(color: Colors.black,fontSize: 15,

                        ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Real Estate Broker',style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                        ),),
                        SizedBox(width: 35,),
                        Text('13 414-6286 loc 10',style: TextStyle(
                          color: Colors.black,
                          fontSize: 10
                        ),),
                      ],
                    ),
                    SizedBox(height: 35,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Total:',
                        style: TextStyle(color: Colors.black,
                        fontSize:35,
                        fontWeight: FontWeight.bold),),
                        SizedBox(width: 20,),
                        Text('7500 EGP',
                        style: TextStyle(color: Colors.black,
                        fontSize:20,
                        fontWeight: FontWeight.bold),),

                      ],
                    ),
                    SizedBox(height: 35,),
                    SizedBox(
                      width: 350,
                    child: Divider(color: Colors.black,
                      thickness: 1,

                    ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButtons.customElevatedButton(
                          text: 'Confirm',
                          elevation: 5,
                          textColor: Colors.yellow,
                          width: 250,
                          fontSize: 12,
                          borderRadius: 30,

                          color: Colors.black,
                          onPressed: () => navigateTo(context,  CopounScreen()),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ],
          ),

              ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
