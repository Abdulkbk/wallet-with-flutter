class Card {
  String cardNo;
  double balance;
  double random;

  Card({
    this.cardNo = "",
    this.balance = 0.0,
    this.random = 0.0
  });

  Map<String, dynamic> toJson() {
    return {
      'cardNo': cardNo,
      'balance': balance,
      'random': random,
    };
  }

}