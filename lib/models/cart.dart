class Cart {
  static List items = [];

  static num totalcost() {
    num total = 0;
    for (int i = 0; i < items.length; i++) {
      total = total + items[i]["price"];
    }
    return total;
  }
}
