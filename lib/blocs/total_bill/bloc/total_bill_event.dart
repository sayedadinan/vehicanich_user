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

class AddMoneyToWallet extends TotalBillEvent {
  final String shopId;
  final String amount;

  AddMoneyToWallet({
    required this.amount,
    required this.shopId,
  });
}

class MoneyAddeddSuccess extends TotalBillEvent {
  final String shopId;
  final String vehicleNumber;
  final String serviceName;
  MoneyAddeddSuccess({
    required this.shopId,
    required this.vehicleNumber,
    required this.serviceName,
  });
}
