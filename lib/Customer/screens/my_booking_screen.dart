import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Shared/components.dart';
import '../../Shared/constants.dart';
import 'copoun_page.dart';


class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Booking',
        style: TextStyle(color: Colors.yellow,
        fontSize: 20.sp
        ),
        ),
        leadingWidth: 50.sp,
        leading: IconButton(
          onPressed:(){} ,
          icon:Icon(Icons.arrow_back) ,
        ),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        scrollDirection:Axis.vertical,
        child: Expanded(
          child: Column(
            
children: [
  Padding(
    padding:  EdgeInsets.only(
            left:25.sp,top: 25.sp ),
    child: Row(
          children: [
            Text('Today', style:
            TextStyle(color: Colors.white,fontSize: 12.sp),),

          ],
    ),
  ),
  SizedBox(height: 10.sp,),
  Padding(
    padding:  EdgeInsets.symmetric(horizontal: kDefaultPaddin),
    child: Container(
          width:250.sp ,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
            boxShadow: [
              BoxShadow(color: Colors.yellow, spreadRadius: 3),
            ],
          ),
          child: Row(
            children: [
              Image.asset('assets/images/adver.jpg',width: 200,height: 100,),
              SizedBox(width: 1),
              Column(
                children: [
                  Row(
                    children: [
                      Text('MG',style: TextStyle(fontSize: 15,color: Colors.white),),
                  SizedBox(width: 25.sp,),
                      TextButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.heart_broken_outlined,color: Colors.yellow,),
                      label: Text('like',style: TextStyle(color: Colors.yellow),))
                    ],
                  ),

                  Text('Mitisbushi eclipse',style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text('Mitisbushi eclipse',style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text('850 EG',style: TextStyle(fontSize: 15,color: Colors.yellow,
                      fontWeight: FontWeight.bold),),

                  AppButtons.customElevatedButton(
                    text: 'Rent Now',
                    elevation: 5,
                    textColor: Colors.black,
                    width: 120,
                    height: 30,
                    fontSize: 12,
                    borderRadius: 30,
                    color: Colors.yellow,
                    onPressed: () => navigateTo(context,  CopounScreen()),
                  ),
                  SizedBox(height: 7,),
                ],
              ),
            ],
          ),

    ),
  ),
  Padding(
    padding:  EdgeInsets.only(
            left:25.sp,top: 25.sp ),
    child: Row(
          children: [
            Text('Yesterday', style:
            TextStyle(color: Colors.white,fontSize: 12.sp),),

          ],
    ),
  ),
  SizedBox(height: 10.sp,),
  Padding(
    padding:  EdgeInsets.symmetric(horizontal: kDefaultPaddin),
    child: Container(
          width:250.sp ,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
            boxShadow: [
              BoxShadow(color: Colors.yellow, spreadRadius: 3),
            ],
          ),
          child: Row(
            children: [
              Image.asset('assets/images/adver.jpg',width: 200,height: 100,),
              SizedBox(width: 1),
              Column(
                children: [
                  Row(
                    children: [
                      Text('MG',style: TextStyle(fontSize: 15,color: Colors.white),),
                      SizedBox(width: 25.sp,),
                      TextButton.icon(
                          onPressed: (){},
                          icon: Icon(Icons.heart_broken_outlined,color: Colors.yellow,),
                          label: Text('like',style: TextStyle(color: Colors.yellow),))

                    ],
                  ),

                  Text('Mitisbushi eclipse',style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text('Mitisbushi eclipse',style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text('850 EG',style: TextStyle(fontSize: 15,color: Colors.yellow,
                      fontWeight: FontWeight.bold),),

                  AppButtons.customElevatedButton(
                    text: 'Rent Now',
                    elevation: 5,
                    textColor: Colors.black,
                    width: 120,
                    height: 30,
                    fontSize: 12,
                    borderRadius: 30,
                    color: Colors.yellow,
                    onPressed: () => navigateTo(context,  CopounScreen()),
                  ),
                  SizedBox(height: 7,),
                ],
              ),
            ],
          ),

    ),
  ),
  SizedBox(height: 15.sp,),
  Padding(
    padding:  EdgeInsets.symmetric(horizontal: kDefaultPaddin),
    child: Container(
          width:250.sp ,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
            boxShadow: [
              BoxShadow(color: Colors.yellow, spreadRadius: 3),
            ],
          ),
          child: Row(
            children: [
              Image.asset('assets/images/adver.jpg',width: 200,height: 100,),
              SizedBox(width: 1),
              Column(
                children: [
                  Row(
                    children: [
                      Text('MG',style: TextStyle(fontSize: 15,color: Colors.white),),
                      SizedBox(width: 25.sp,),
                      TextButton.icon(
                          onPressed: (){},
                          icon: Icon(Icons.heart_broken_outlined,color: Colors.yellow,),
                          label: Text('like',style: TextStyle(color: Colors.yellow),))

                    ],
                  ),

                  Text('Mitisbushi eclipse',style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text('Mitisbushi eclipse',style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text('850 EG',style: TextStyle(fontSize: 15,color: Colors.yellow,
                      fontWeight: FontWeight.bold),),

                  AppButtons.customElevatedButton(
                    text: 'Rent Now',
                    elevation: 5,
                    textColor: Colors.black,
                    width: 120,
                    height: 30,
                    fontSize: 12,
                    borderRadius: 30,
                    color: Colors.yellow,
                    onPressed: () => navigateTo(context,  CopounScreen()),
                  ),
                  SizedBox(height: 7,),
                ],
              ),
            ],
          ),

    ),
  ),
  Padding(
    padding:  EdgeInsets.only(
            left:25.sp,top: 25.sp ),
    child: Row(
          children: [
            Text('11/9/2022', style:
            TextStyle(color: Colors.white,fontSize: 12.sp),),

          ],
    ),
  ),
  SizedBox(height: 10.sp,),
  Padding(
    padding:  EdgeInsets.symmetric(horizontal: kDefaultPaddin),
    child: Container(
          width:250.sp ,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
            boxShadow: [
              BoxShadow(color: Colors.yellow, spreadRadius: 3),
            ],
          ),
          child: Row(
            children: [
              Image.asset('assets/images/adver.jpg',width: 200,height: 100,),
              SizedBox(width: 1),
              Column(
                children: [
                  Row(
                    children: [
                      Text('MG',style: TextStyle(fontSize: 15,color: Colors.white),),
                      SizedBox(width: 25.sp,),
                      TextButton.icon(
                          onPressed: (){},
                          icon: Icon(Icons.heart_broken_outlined,color: Colors.yellow,),
                          label: Text('like',style: TextStyle(color: Colors.yellow),))

                    ],
                  ),

                  Text('Mitisbushi eclipse',style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text('Mitisbushi eclipse',style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text('850 EG',style: TextStyle(fontSize: 15,color: Colors.yellow,
                      fontWeight: FontWeight.bold),),

                  AppButtons.customElevatedButton(
                    text: 'Rent Now',
                    elevation: 5,
                    textColor: Colors.black,
                    width: 120,
                    height: 30,
                    fontSize: 12,
                    borderRadius: 30,
                    color: Colors.yellow,
                    onPressed: () => navigateTo(context,  CopounScreen()),
                  ),
                  SizedBox(height: 7,),
                ],
              ),
            ],
          ),

    ),
  ),
  SizedBox(height: 15.sp,),
  Padding(
    padding:  EdgeInsets.symmetric(horizontal: kDefaultPaddin),
    child: Container(
          width:250.sp ,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
            boxShadow: [
              BoxShadow(color: Colors.yellow, spreadRadius: 3),
            ],
          ),
          child: Row(
            children: [
              Image.asset('assets/images/adver.jpg',width: 200,height: 100,),
              SizedBox(width: 1),
              Column(
                children: [
                  Row(
                    children: [
                      Text('MG',style: TextStyle(fontSize: 15,color: Colors.white),),
                      SizedBox(width: 25.sp,),
                      TextButton.icon(
                          onPressed: (){},
                          icon: Icon(Icons.heart_broken_outlined,color: Colors.yellow,),
                          label: Text('like',style: TextStyle(color: Colors.yellow),))

                    ],
                  ),

                  Text('Mitisbushi eclipse',style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text('Mitisbushi eclipse',style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text('850 EG',style: TextStyle(fontSize: 15,color: Colors.yellow,
                      fontWeight: FontWeight.bold),),

                  AppButtons.customElevatedButton(
                    text: 'Rent Now',
                    elevation: 5,
                    textColor: Colors.black,
                    width: 120,
                    height: 30,
                    fontSize: 12,
                    borderRadius: 30,
                    color: Colors.yellow,
                    onPressed: () => navigateTo(context,  CopounScreen()),
                  ),
                  SizedBox(height: 7,),
                ],
              ),

            ],

          ),


    ),
  ),
  SizedBox(height: 15.sp,),

],
          ),

        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Colors.black, // <-- This works for fixed
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.yellow,),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard,color: Colors.yellow,),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.yellow,),
            label: 'Profile',
          ),
        ],

      ),
      backgroundColor: Colors.black,
    );
  }
}
