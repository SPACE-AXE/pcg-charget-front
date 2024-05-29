import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChargeData extends ChangeNotifier {
  String? carNum;
  String? chargeOption;
  String? setTime;
  String? chargeTime;
  String? setPrice;
  String? chargePrice;
  String? setAmount;
  String? chargeAmount;

  ChargeData({
    this.carNum,
    this.chargeOption,
    this.setTime,
    this.chargeTime,
    this.setPrice,
    this.chargePrice,
    this.setAmount,
    this.chargeAmount,
  });

  factory ChargeData.makeData(String carNum) {
    return ChargeData(
      carNum: carNum,
      chargeOption: null,
      setTime: null,
      chargeTime: null,
      setPrice: null,
      chargePrice: null,
      setAmount: null,
      chargeAmount: null,
    );
  }

  void updateCarNum(String data) {
    carNum = data;
    notifyListeners();
  }

  void updateOption(String data) {
    chargeOption = data;
    notifyListeners();
  }

  void updateChargeData(ChargeData data) {
    carNum = data.carNum;
    setTime = data.setTime;
    chargeTime = data.chargeTime;
    setPrice = data.setPrice;
    chargePrice = data.chargePrice;
    setAmount = data.setAmount;
    chargeAmount = data.chargeAmount;
    chargeOption = data.chargeOption;
    notifyListeners();
    debugPrint(
        "$carNum, $setTime, $chargeTime, $setPrice, $chargePrice, $setAmount, $chargeAmount, $chargeOption");
  }

  Map<String, dynamic> toJson() {
    return {
      'carNum': carNum,
      'setTime': setTime,
      'chargeTime': chargeTime,
      'setPrice': setPrice,
      'chargePrice': chargePrice,
      'setAmount': setAmount,
      'chargeAmount': chargeAmount,
      'chargeOption': chargeOption,
    };
  }

  void updateCharge(String time, String price, String amount) {
    chargeTime = time;
    chargePrice = price;
    chargeAmount = amount;
    notifyListeners();
  }

  void setOption(String option, String data) {
    switch (option) {
      case "price":
        chargeOption = option;
        setPrice = data;
        break;
      case "time":
        chargeOption = option;
        setTime = data;
        break;
      case "amount":
        chargeOption = option;
        setAmount = data;
        break;
      case "full":
        chargeOption = option;
        setAmount = "200";
        break;
    }
    notifyListeners();
  }

  void deleteData() {
    carNum = null;
    chargeAmount = null;
    chargeOption = null;
    chargePrice = null;
    chargeTime = null;
    setTime = null;
    notifyListeners();
  }
}

final chargeDataProvider = ChangeNotifierProvider<ChargeData>((ref) {
  return ChargeData();
});
