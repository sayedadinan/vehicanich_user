part of 'total_bill_bloc.dart';

sealed class TotalBillEvent {}

class FetchTotalBill extends TotalBillEvent {
  final String shopId;
  final String vehicleNumber;
  final String serviceName;

  FetchTotalBill({
    required this.shopId,
    required this.vehicleNumber,
    required this.serviceName,
  });
}
