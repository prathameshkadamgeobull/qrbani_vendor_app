import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/order_report_model.dart';
import '../../../models/recent_order_model.dart';
import 'order_report_event.dart';
import 'order_report_state.dart';

class OrderReportBloc extends Bloc<OrderReportEvent, OrderReportState> {
  OrderReportBloc() : super(OrderReportInitial()) {
    on<LoadOrderReport>(_loadReport);
    on<RefreshOrderReport>(_refreshReport);
  }

  Future<void> _loadReport(
      LoadOrderReport event,
      Emitter<OrderReportState> emit,
      ) async {

    emit(OrderReportLoading());


    await Future.delayed(
      const Duration(milliseconds: 600),
    );


    List<RecentOrderModel> allOrders = [];


    DateTime start =
        event.startDate ?? DateTime(2024,5,14);

    DateTime end =
        event.endDate ?? DateTime(2024,5,20);



    DateTime current = start;


    int counter = 1;


    while(
    current.isBefore(end) ||
        current.isAtSameMomentAs(end)
    ){


      allOrders.add(

        RecentOrderModel(

          orderId:
          "QB-2024-000$counter",

          customerName:
          "Customer $counter",

          date:
          "${current.day}/${current.month}/${current.year}",

          status:
          counter % 2 == 0
              ? "Completed"
              : "Pending",

          amount:
          500 + counter * 100,

        ),

      );


      counter++;


      current =
          current.add(
            const Duration(days:1),
          );

    }



    final report = OrderReportModel(

      dateRange:
      "${start.day}/${start.month}/${start.year} - "
          "${end.day}/${end.month}/${end.year}",


      totalOrders:
      allOrders.length,


      completed:
      allOrders.where(
              (e)=>e.status=="Completed"
      ).length,


      inProgress:0,


      pending:
      allOrders.where(
              (e)=>e.status=="Pending"
      ).length,


      cancelled:0,


      totalRevenue:
      allOrders.fold(
          0,
              (sum,item)=>sum+item.amount
      ),


      // first 3 only
      recentOrders:
      allOrders.take(3).toList(),


      // all orders
      allOrders:
      allOrders,


    );


    emit(
      OrderReportLoaded(report),
    );

  }

  Future<void> _refreshReport(
      RefreshOrderReport event,
      Emitter<OrderReportState> emit,
      ) async {

    if(state is OrderReportLoaded){

      final currentState = state as OrderReportLoaded;


      add(
        LoadOrderReport(
          startDate: currentState.report.dateRange != null
              ? DateTime(2024,5,14)
              : null,

          endDate: DateTime(2024,5,20),
        ),
      );

    }else{

      add(
        LoadOrderReport(),
      );

    }

  }
}