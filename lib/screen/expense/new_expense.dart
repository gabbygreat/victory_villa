import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:victory_villa/model/enum.dart' as enums;
import 'package:victory_villa/model/model.dart';
import 'package:victory_villa/networking/networking.dart';
import 'package:victory_villa/utils/assets.dart';
import 'package:victory_villa/utils/colors.dart';
import 'package:victory_villa/utils/constants.dart';
import 'package:victory_villa/utils/show_toast.dart';
import 'package:victory_villa/utils/widget/app_bar.dart';
import 'package:victory_villa/utils/widget/custom_button.dart';
import 'package:victory_villa/utils/widget/expense_radio.dart';
import 'package:victory_villa/utils/widget/image_radio.dart';
import 'package:victory_villa/utils/widget/loader.dart';
import 'package:victory_villa/utils/widget/text_field.dart';

class NewExpenseScreen extends StatefulWidget {
  const NewExpenseScreen({Key? key}) : super(key: key);

  @override
  State<NewExpenseScreen> createState() => _NewExpenseScreenState();
}

class _NewExpenseScreenState extends State<NewExpenseScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  enums.UploadType _upload = enums.UploadType.camera;
  enums.ExpenseType _expense = enums.ExpenseType.utility;
  File? imageFile;
  bool canExit = true;
  TextEditingController detailsController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  uploadPath(String path) {
    setState(() {
      imageFile = File(path);
    });
  }

  collectInfo(
    context, {
    required String detailOfPayment,
    required enums.ExpenseType expenseType,
    required String amount,
    required File? imageFile,
  }) async {
    canExit = false;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: onWillPop,
        child: SimpleDialog(
          children: [
            Center(
              child: Text(
                'Processing...',
                style: TextStyle(
                  color: VictoryColor.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: VictoryConstants.kSpacing * 3,
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: SvgPicture.asset(
                VictoryAssets.icon,
                color: VictoryColor.primaryColor,
              ),
            ),
            const VictoryLoader(),
          ],
        ),
      ),
    );

    final expense = ExpenseModel(
        detailOfPayment: detailOfPayment,
        // file: imageFile,
        expenseType: expenseType.name,
        amount: int.parse(amount),
        date: DateTime.now());

    final addExpense = await PostCalls.addExpense(expense);
    if (addExpense != null) {
      if (addExpense) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Successful'),
          backgroundColor: VictoryColor.green,
        ));
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Failed'),
          backgroundColor: VictoryColor.red,
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Something went wrong'),
        backgroundColor: VictoryColor.red,
      ));
    }

    canExit = true;

    Navigator.of(context).pop();
  }

  Future<bool> onWillPop() async {
    if (canExit) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'New Expenses'),
      body: Padding(
        padding: EdgeInsets.all(
          VictoryConstants.kPadding,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: VictoryConstants.kSpacing * 0.5,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                controller: amountController,
                decoration: customInputDecoration(
                  hint: 'Amount paid',
                  prefixIcon: const Icon(Icons.money),
                ),
                maxLength: 11,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter valid amount';
                  } else if (int.tryParse(value) == null) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: VictoryConstants.kSpacing * 0.5,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                maxLines: 6,
                controller: detailsController,
                decoration: customInputDecoration(
                  hint: 'Describe the reason for expense',
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a reason';
                  }

                  return null;
                },
                // onSaved: (val) => setState(() => _user.firstName = val),
              ),
              SizedBox(
                height: VictoryConstants.kSpacing * 0.5,
              ),
              ExpenseRadio(
                radioValue: _expense,
                valueChanged: (value) {
                  _expense = value;
                },
              ),
              ImageRadio(
                uploadPath: uploadPath,
                radioValue: _upload,
                valueChanged: (value) {
                  _upload = value;
                },
              ),
              Expanded(
                child: ListView(
                  children: [
                    if (imageFile != null)
                      Stack(
                        children: [
                          Image.file(imageFile!),
                          Positioned(
                            right: 1,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  imageFile = null;
                                });
                              },
                              icon: Icon(
                                Icons.close,
                                size: 40,
                                color: VictoryColor.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    CustomButton(
                      'Upload Expense Detail',
                      onTap: () {
                        final form = _formKey.currentState;
                        if (form != null && form.validate()) {
                          if (imageFile == null) {
                            showToast('Please select an image');
                          } else {
                            collectInfo(
                              context,
                              detailOfPayment: detailsController.text,
                              expenseType: _expense,
                              amount: amountController.text,
                              imageFile: imageFile,
                            );
                          }
                          // if (RoomSuite.roomSuite.contains('•') ||
                          //     RoomSuite.roomSuite.isEmpty) {
                          //   showToast('Choose a correct room number');
                          // } else {
                          //   form.save();
                          //   collectInfo(
                          //     occupantName: RoomSuite.occupantNameController.text,
                          //     occupantPhone: RoomSuite.occupantPhoneController.text,
                          //     stateOfOrigin: RoomSuite.stateOfOriginController.text,
                          //     gender:
                          //         _gender == enums.Gender.male ? 'male' : 'female',
                          //     guarantorName: RoomSuite.guarantorNameController.text,
                          //     guarantorPhone: RoomSuite.guarantorPhoneController.text,
                          //   );
                          // }
                        } else {
                          showToast('Incomplete submission data');
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: VictoryConstants.kSpacing * 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
