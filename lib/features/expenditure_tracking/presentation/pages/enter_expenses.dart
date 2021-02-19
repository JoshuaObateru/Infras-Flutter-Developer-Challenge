import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/data/models/expense_model.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/presentation/bloc/add_expense_bloc.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/presentation/widgets/customInput.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/presentation/widgets/custom_button.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/presentation/widgets/custom_button_2.dart';
import 'package:infras_flutter_developer_challenge/values/colors.dart';

class EnterExpenses extends StatefulWidget {
  @override
  _EnterExpensesState createState() => _EnterExpensesState();
}

class _EnterExpensesState extends State<EnterExpenses> {
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  DateTime _transactionDate;
  TextEditingController _amountCtrl = TextEditingController();
  TextEditingController _itemCtrl = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _amountCtrl.dispose();
    _itemCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Hey Eren!',
          style: TextStyle(color: secondaryColor),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Form(
        key: _formState,
        child: SingleChildScrollView(
          child: Container(
            width: width,
            height: height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Enter Details of Purchase',
                    style: TextStyle(
                        color: secondaryColor,
                        fontSize: width * 0.05,
                        letterSpacing: 2),
                  ),
                ),
                CustomInput(
                  hint: "Amount Spent",
                  controller: _amountCtrl,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "field can not be empty";
                    }
                    return null;
                  },
                ),
                CustomInput(
                  hint: "Name of Item",
                  controller: _itemCtrl,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "field can not be empty";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DateTimeField(
                    mode: DateFieldPickerMode.date,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: secondaryColor, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: secondaryColor, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0)),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                      isDense: true,
                    ),
                    label: "Transaction date",
                    selectedDate: _transactionDate,
                    onDateSelected: (DateTime date) {
                      setState(() {
                        _transactionDate = date;
                      });
                    },
                    lastDate: DateTime.now(),
                  ),
                ),
                BlocListener<AddExpenseBloc, AddExpenseState>(
                  listener: (context, state) {
                    if (state is AddExpenseError) {
                      Fluttertoast.showToast(
                          msg: state.message,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black87,
                          textColor: Colors.white,
                          fontSize: 12.0);
                    } else if (state is AddExpenseLoaded) {
                      Fluttertoast.showToast(
                          msg: 'Added Successfully',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black87,
                          textColor: Colors.white,
                          fontSize: 12.0);
                    }
                  },
                  child: BlocBuilder<AddExpenseBloc, AddExpenseState>(
                    builder: (context, state) {
                      if (state is AddExpenseLoading) {
                        return CustomButton(
                          label: 'SAVE DETAILS',
                          isLoading: true,
                        );
                      } else {
                        return CustomButton(
                          label: 'SAVE DETAILS',
                          isLoading: false,
                          onPressed: () {
                            _submit(context);
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _submit(BuildContext context) {
    final FormState form = _formState.currentState;
    if (form.validate()) {
      form.save();
      BlocProvider.of<AddExpenseBloc>(context).add(GetAddExpenseEvent(
        expense: ExpenseModel(
            amount: int.parse(_amountCtrl.text),
            item: _itemCtrl.text,
            transactionDate: _transactionDate.toIso8601String()),
      ));
    }
  }
}
