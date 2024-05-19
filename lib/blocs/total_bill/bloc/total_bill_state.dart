part of 'total_bill_bloc.dart';

sealed class TotalBillState {
  final dynamic serviceName;
  final dynamic vehicleNumber;
  final dynamic extraFitting;
  final dynamic extraService;
  final dynamic totalAmount;
  final dynamic bookingId;
  TotalBillState({
    required this.serviceName,
    required this.vehicleNumber,
    required this.extraFitting,
    required this.extraService,
    required this.totalAmount,
    required this.bookingId,
  });
}

final class TotalBillInitial extends TotalBillState {
  TotalBillInitial({
    required super.serviceName,
    required super.vehicleNumber,
    required super.extraFitting,
    required super.extraService,
    required super.totalAmount,
    required super.bookingId,
  });
}
