import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../Shared/constants.dart';


class Saved_PageScreen extends StatelessWidget {
  const Saved_PageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.black,
  centerTitle: true,
  title: Text('SC',style:
    TextStyle(
      color: Colors.yellow,
      fontSize: 25.sp
    ),),
  leading: IconButton(
    icon: Icon(Icons.arrow_back,color: Colors.white,),
    onPressed: (){},
  ),
),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 35.sp,top: 20.sp),
              child: Row(
                children: [
                  Text('SAVED',style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 25.sp
                  ),),
                  SizedBox(
                    width: 180.sp,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                      child: TextField(

                        decoration: InputDecoration(

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Colors.yellow),
                          ),
                          enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Colors.black),

                          ),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(Icons.saved_search),
                          hintText: 'Search',
                          contentPadding: EdgeInsets.only(left: 25.sp),
                        ),


                      ),
                    ),
                  ),

                ],
              ),

            ),
            SizedBox(height: 30.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(


                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(35),
    color: Colors.yellow,

    boxShadow: [
    BoxShadow(color: Colors.yellow, spreadRadius: 3),
    ],
    image: new DecorationImage(
    image: new AssetImage("assets/images/bmw.jpg"),
    fit: BoxFit.fill,

    ),

                  ),
child: Column(
  children: [
        Row(

      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.yellow,)),
      ],
    ),


  ],
),



                ),
                  onTap: (){},
                ),
                SizedBox(width: 10.sp,),
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
              ],
            ),
 SizedBox(height: 20.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
                SizedBox(width: 10.sp,),
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
              ],
            ),
            SizedBox(height: 20.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
                SizedBox(width: 10.sp,),
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
              ],
            ),
            SizedBox(height: 20.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
                SizedBox(width: 10.sp,),
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
              ],
            ),
            SizedBox(height: 20.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
                SizedBox(width: 10.sp,),
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
              ],
            ),
            SizedBox(height: 20.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
                SizedBox(width: 10.sp,),
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
              ],
            ),
            SizedBox(height: 20.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
                SizedBox(width: 10.sp,),
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
              ],
            ),
            SizedBox(height: 20.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
                SizedBox(width: 10.sp,),
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
              ],
            ),
            SizedBox(height: 20.sp,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
                SizedBox(width: 10.sp,),
                GestureDetector(
                  child: Container(
                    width: 130.sp,
                    height: 80.sp,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(color: Colors.yellow, spreadRadius: 3),
                      ],
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/bmw.jpg"),
                        fit: BoxFit.fill,

                      ),

                    ),
                    child: Row(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.white,)),
                      ],
                    ),


                  ),
                  onTap: (){},
                ),
              ],
            ),
          ],

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
            icon: Icon(Icons.category_rounded,color: Colors.yellow,),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,color: Colors.yellow,),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_crash_rounded,color: Colors.yellow,),
            label: 'My rent',
          ),
        ],

      ),

    );
  }
}
