class Activity {
  String type;
  String trxDate;
  String coin;
  double amount;
  double percentage;

  Activity({
    this.type = "",
    this.trxDate = "",
    this.coin = "",
    this.amount = 0.0,
    this.percentage = 0.0,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'trxDate': trxDate,
      'amount': amount,
      'percentage': percentage,
    };
  }

}