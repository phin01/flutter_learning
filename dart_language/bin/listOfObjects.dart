// Create classes for salesperson and sales
// Add elements to lists
// Sort salesperson from sales amounts
// return most sold item as qty
// return most sold item as amount sold
// Generate a commission % bonus based on being the top salesperson
// report total commission paid by salesperson
//

class Sale {
  String product;
  int quantity;
  double price;

  Sale({required this.product, required this.quantity, required this.price});
}

class Salesperson {
  String name;
  String account;
  late double _defaultCommission;
  late double additionalCommission;
  late double paidCommission;
  late List<Sale> sales;

  Salesperson({required this.name, required this.account}){
    _defaultCommission = 0.1;
    additionalCommission = 0;
    paidCommission = 0;
    sales = [];
  }

  double get defaultCommission => _defaultCommission;
  
  void addSale(Sale newSale) {
    sales.add(Sale(product: newSale.product, quantity: newSale.quantity, price: newSale.price));
  }

}


void salesReport(List<Salesperson> staff) {

  staff.sort(((salesB, salesA) {
    return salesA.sales.fold<double>(0, (previousValue, element) => previousValue + (element.price * element.quantity)).compareTo(salesB.sales.fold<double>(0, (previousValue, element) => previousValue + (element.price * element.quantity)));
  })
  );

  for (Salesperson s in staff) {
    print('Salesperson ${s.name} has sold ${s.sales.fold<double>(0, (previousValue, element) => previousValue + (element.price * element.quantity))}');
  }
}

void productReport(List<Salesperson> staff) {

  Map products = {};

  for(Salesperson salesperson in staff) {
    for (Sale sale in salesperson.sales) {
      products.containsKey(sale.product) ? products[sale.product] += sale.price * sale.quantity : products[sale.product] = sale.price * sale.quantity;
    }
  }

  print(products);

}

void calculateCommission(List<Salesperson> staff) {

  staff.map((e) => null);

  staff.map((s) {
    s.paidCommission = s._defaultCommission * s.sales.fold<double>(0, (previousValue, element) => previousValue + (element.price * element.quantity));
    return s;
  }).toList();

  for (Salesperson s in staff) {
    print('Salesperson ${s.name} has sold ${s.sales.fold<double>(0, (previousValue, element) => previousValue + (element.price * element.quantity))} and got ${s.paidCommission} as commission');
  }
  
}



void main() {
  Salesperson jack = Salesperson(name: 'Jack', account: 'IBM');
  Salesperson bill = Salesperson(name: 'Jill', account: 'IBM');
  Salesperson peter = Salesperson(name: 'Peter', account: 'Microsoft');
  Salesperson andy = Salesperson(name: 'Andy', account: 'Google');

  List<Salesperson> staff = [andy, peter, jack, bill];

  Sale cloudStorage = Sale(product: 'Cloud Storage', quantity: 5, price: 50);
  Sale supportTicket = Sale(product: 'Support', quantity: 1, price: 100);
  Sale hardware = Sale(product: 'Hardware', quantity: 1, price: 1000);
  Sale upgrades = Sale(product: 'Upgrades', quantity: 2, price: 200);

  jack.addSale(cloudStorage);
  jack.addSale(cloudStorage);

  bill.addSale(cloudStorage);
  bill.addSale(cloudStorage);
  bill.addSale(cloudStorage);

  peter.addSale(cloudStorage);
  peter.addSale(hardware);

  andy.addSale(hardware);
  andy.addSale(upgrades);
  andy.addSale(supportTicket);
  andy.addSale(supportTicket);
  andy.addSale(supportTicket);
  andy.addSale(supportTicket);
  andy.addSale(supportTicket);
  andy.addSale(supportTicket);
  andy.addSale(supportTicket);

  salesReport(staff);  

  productReport(staff);

  calculateCommission(staff);

}
