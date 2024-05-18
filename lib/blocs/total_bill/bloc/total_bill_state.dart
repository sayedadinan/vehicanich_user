part of 'total_bill_bloc.dart';

sealed class TotalBillState {
  final String serviceName;
  final String vehicleNumber;
  final String extraFitting;
  final String extraService;
  final String totalAmount;

  TotalBillState(
      {required this.serviceName,
      required this.vehicleNumber,
      required this.extraFitting,
      required this.extraService,
      required this.totalAmount});
}

final class TotalBillInitial extends TotalBillState {
  TotalBillInitial(
      {required super.serviceName,
      required super.vehicleNumber,
      required super.extraFitting,
      required super.extraService,
      required super.totalAmount});
}
