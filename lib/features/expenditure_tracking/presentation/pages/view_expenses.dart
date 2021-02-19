import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infras_flutter_developer_challenge/features/expenditure_tracking/presentation/bloc/get_expenses_bloc.dart';
import 'package:infras_flutter_developer_challenge/features/movies/presentation/bloc/get_movies_bloc.dart';
import 'package:infras_flutter_developer_challenge/values/colors.dart';
import 'package:intl/intl.dart';

class ViewExpenses extends StatefulWidget {
  @override
  _ViewExpensesState createState() => _ViewExpensesState();
}

class _ViewExpensesState extends State<ViewExpenses> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetExpensesBloc>(context).add(ShowAllExpensesEvent());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text(
            'All Expenses',
            style: TextStyle(color: secondaryColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<GetExpensesBloc, GetExpensesState>(
              builder: (context, state) {
            if (state is GetExpensesLoading) {
              return Center(
                child: Container(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is GetExpensesError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: secondaryColor),
                ),
              );
            } else if (state is GetExpensesLoaded) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    var f = NumberFormat("#,##0.00", 'en_US');
                    var date =
                        DateTime.parse(state.expenses[index].transactionDate);
                    return ListTile(
                      title: Text(state.expenses[index].item),
                      subtitle: Text(DateFormat("MMM, d, yyyy").format(date)),
                      trailing:
                          Text('₦${f.format(state.expenses[index].amount)}'),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        color: secondaryColor,
                      ),
                  itemCount: state.expenses.length);
            } else {
              return Container();
            }
          }),
        ));
  }
}
