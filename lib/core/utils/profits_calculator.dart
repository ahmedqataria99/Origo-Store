class ProfitCalculator {

  static double calculateSaleProfit({
    required double sellPrice,
    required double costPrice,
    required int quantity,
  }) {
    return (sellPrice - costPrice) * quantity;
  }

  static double calculateNetProfit({
    required double totalSalesProfit,
    required double totalExpenses,
  }) {
    return totalSalesProfit - totalExpenses;
  }

  static double calculateInventoryValue(
    List<ProductEntity> products, //الي ماسك البرودكت يعمله import
  ) {
    double total = 0;
    for (var product in products) {
      total += product.costPrice * product.quantity;
    }
    return total;
  }
}