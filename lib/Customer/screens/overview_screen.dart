import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Shared/components.dart';
import 'copoun_page.dart';

class OverViewScreen extends StatelessWidget {
  const OverViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leadingWidth: 50.sp,
        leading: IconButton(
          onPressed:(){} ,

          icon:Icon(Icons.arrow_back,color: Colors.white,) ,
        ),
        title: Text('Over View',style:
          TextStyle(color: Colors.yellow,fontSize: 22.sp),),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body:Column(
        children: [
          Image.asset('assets/images/bmw.jpg',),
SizedBox(height: 5.sp,),
          Text('Spectifications',style: TextStyle(color: Colors.white,
          fontSize: 15.sp),),
          Stack(
            children: [



              Container(

                margin: EdgeInsets.only(top:10.sp ),
                height: 319.sp,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(


                  children: [

                    Padding(
                      padding:  EdgeInsets.only(top: 20.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Stack(

                            children: [
                              Container(

                                width: 50.sp,
                                height: 60.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white
                                ),
                                child: Icon(
                                  Icons.local_fire_department,size: 30.sp,
                                ),

                              ),

                            ],
                          ),
                          SizedBox(width: 8.sp,),
                          Stack(

                            children: [
                              Container(

                                width: 50.sp,
                                height: 60.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white
                                ),
                                child: Icon(
                                  Icons.speed,size: 30.sp,
                                ),
                              ),

                            ],
                          ),
                          SizedBox(width: 8.sp,),
                          Stack(

                            children: [
                              Container(

                                width: 50.sp,
                                height: 60.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white
                                ),
                                child: Icon(
                                  Icons.car_rental_outlined,size: 30.sp,
                                ),
                              ),

                            ],
                          ),
                          SizedBox(width: 8.sp,),
                          Stack(

                            children: [
                              Container(

                                width: 50.sp,
                                height: 60.sp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white
                                ),
                               child: Icon(
                                 Icons.event_seat,size: 30.sp,
                               ),

                              ),


                            ],
                          ),

                        ],
                      ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('25km/h',style: TextStyle(color: Colors.black),),
                        SizedBox(width: 20.sp,),
                        Text('Gas',style: TextStyle(color: Colors.black),),
                        SizedBox(width: 15.sp,),
                        Text('Automiatic',style: TextStyle(color: Colors.black),),
                        SizedBox(width: 15.sp,),
                        Text('4Seats',style: TextStyle(color: Colors.black),),
                      ],
                    ),

SizedBox(height: 20.sp,),
Padding(
  padding:  EdgeInsets.only(left: 10.sp),
  child:   Row(

    children: [

      Text('MG',style: TextStyle(color: Colors.black,fontSize: 25.sp),)

    ],

  ),
),
                    SizedBox(height: 10.sp,),
Padding(
  padding:  EdgeInsets.only(left: 10.sp),
  child:   Row(

    children: [

      Text('Flamingo Print Pillow Case',style: TextStyle(color: Colors.black,fontSize: 12.sp),)

    ],

  ),
),
                    SizedBox(height: 2.sp,),
                    Padding(
                      padding:  EdgeInsets.only(left: 10.sp),
                      child:   Row(

                        children: [

                          Text('Gold Foil Pillow Case',style: TextStyle(color: Colors.black,fontSize: 12.sp),)

                        ],

                      ),
                    ),
                    SizedBox(height: 2.sp,),
                    Padding(
                      padding:  EdgeInsets.only(left: 10.sp),
                      child:   Row(

                        children: [

                          Text('Polka Dots Fitted Sheet',style: TextStyle(color: Colors.black,fontSize: 12.sp),)

                        ],

                      ),
                    ),
                    SizedBox(height: 10.sp,),
Padding(
  padding:  EdgeInsets.only(left: 10.sp),
  child:   Row(

    children: [

      Text('850 EGP',style: TextStyle(color: Colors.black,fontSize: 25.sp),)

    ],

  ),
),

                    SizedBox(height: 15.sp,),
                    AppButtons.customElevatedButton(
                      text: 'Rent Now',
                      elevation: 5,
                      textColor: Colors.yellow,
                      width: 150.sp,
                      height: 45,
                      fontSize: 15,
                      borderRadius: 50,
                      color: Colors.black,
                      onPressed: () => navigateTo(context,  CopounScreen()),
                    ),


                  ],
                ),
              ),
            ],
          ),

        ],

      ) ,

    );
  }
}
