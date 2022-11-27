import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../Shared/components.dart';
import '../../Shared/constants.dart';
import '../bussniess_logic/customer_cubit.dart';
import '../bussniess_logic/customer_state.dart';
import '../data/model/customer_model.dart';


class CustomerEditProfile extends StatelessWidget {
  CustomerEditProfile({Key? key, required this.customerModel})
      : super(key: key);

  final CustomerModel customerModel;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = CustomerCubit.get(context);
    firstNameController.text = customerModel.firstName!;
    lastNameController.text = customerModel.lastName!;
    phoneController.text = customerModel.phone!;

    return BlocConsumer<CustomerCubit, CustomerStates>(
      listener: (context, state) {
        if (state is UpdateCustomerSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: AppItems.customText('Successfully', fontSize: 12.sp)),
          );
          Navigator.pop(context);
          cubit.changeCloseImage();
          cubit.getCustomerData(id: ConstText.customerId);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 0,
            title: const Text('Edit Profile',style: TextStyle(color: Colors.yellow),),
            leading: AppButtons.customButtonBack(context),
            actions: [
              AppButtons.customTextButton(
                text: 'Update',
                fontSize: 14.sp,
                color: Colors.yellow,
                onPressed: () async {
                  await cubit.updateCustomer(
                    id: customerModel.docId!,
                    phone: phoneController.text,
                    lastName: lastNameController.text,

                    firstName: firstNameController.text,

                  );
                },
              ),
              SizedBox(width: 5.sp),
            ],
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 57.sp,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 55.sp,
                      backgroundColor: Colors.white,
                      backgroundImage: cubit.profileImage == null
                          ? NetworkImage(customerModel.image!)
                          : FileImage(cubit.profileImage!) as ImageProvider,
                    ),
                  ),
                  Positioned(
                    bottom: 10.sp,
                    right: 80.sp,
                    child: CircleAvatar(
                      radius: 16.sp,
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(Icons.camera_alt,
                            size: 18.sp, color: Colors.white),
                        onPressed: () {
                          cubit.pickedImage(ImageSource.gallery);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.sp),
              AppItems.customTextField(
                hintText: 'First Name',
                hintFontSize: 13.sp,
                hintColor: Colors.yellow,
                controller: firstNameController,
              ),
              SizedBox(height: 10.sp),
              AppItems.customTextField(
                hintText: 'Last Name',
                hintFontSize: 13.sp,
                hintColor: Colors.yellow,
                controller: lastNameController,
              ),
              SizedBox(height: 10.sp),
              AppItems.customTextField(
                hintText: 'Phone',
                hintFontSize: 13.sp,
                hintColor: Colors.yellow,
                controller: phoneController,
              ),
              SizedBox(height: 20.sp),
            ],
          ),
        );
      },
    );
  }
}
