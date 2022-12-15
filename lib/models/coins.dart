class Coins {
  String icon;
  String name;
  double balance;
  double market;
  double value;

  Coins({
   this.icon = "",
   this.name = "",
   this.balance = 0.0,
   this.market = 0.0,
   this.value = 0.0
});

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'name': name,
      'balance': balance,
      'market': market,
      'value': value,
    };
  }

}