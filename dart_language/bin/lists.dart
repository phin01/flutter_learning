import 'dart:math';

///
/// forEach receives an anonymous function as parameter.
/// This function will be run for each element in the array.
/// It is usually better to just use a for loop instead.
/// 
void listForEach() {
  List<int> list = List.generate(5, (index) => Random().nextInt(10));
  list.forEach(print);

  list.forEach((element) {
    print(element * 2);
  });
}

///
/// expand can be used to flatten lists
/// 
void listExpand() {

  List listOfLists = List.generate(5, (index) => List.generate(2, (index) => Random().nextInt(10)));
  print(listOfLists);
  List flatList = listOfLists.expand((element) => element).toList();
  print(flatList);
  print('');
}

/// 
/// Spread operator can open the elements of a list
/// 
void spreadList() {
  List<int> list1 = List.generate(5, (index) => Random().nextInt(10));
  List<int> list2 = List.generate(5, (index) => Random().nextInt(10));
  print(list1);
  print(list2);
  print('');

  // Concatenate both lists
  List fullList = list1 + list2;
  print(fullList);

  // Add elements to new or existing list
  fullList = [0, ...list1, ...list2, 99];
  print(fullList);
}

/// 
/// Maps will apply a function to each element of a collection. 
/// It can be an anonymous function or named functions, closures, etc
/// 
void listMaps() {

  // map with anonymous function
  List<int> inteiros = [1, 6, 4, 3, 8, 10];
  List<int> inteirosDobrados = inteiros.map((int e) => e * 2,).toList();
  print(inteirosDobrados);

  // using functions and closures
  List<double> precosOriginais = [2.5, 3.0, 6.5, 9.99];
  double qtd(double e) => e * Random().nextInt(10);
  aplicaDesconto(desconto) => (valorProduto) => valorProduto - (valorProduto * desconto);
  String formataPreco(preco) => "R\$ ${preco.toStringAsFixed(2)}";

  List precosDescontados = precosOriginais.map(qtd).map(aplicaDesconto(0.1)).map(formataPreco).toList(); 
  print(precosDescontados);

}

/// 
/// Where can be used as a filter for collections
/// 
void listWhere() {
  List<int> age = [11, 27, 17, 19, 36, 66, 95];
  List<int> underage = age.where((element) => element < 18).toList();
  List<int> adult = age.where((element) => element >= 18).toList();
  print(underage);
  print(adult);
  
}

/// 
/// Reduce compares the elements using a function and returns the single remaining element
/// 
void listReduce() {
  List<int> numbers = [11, 7, 3, 86, 97, 17, 23, 65];

  int addUp = numbers.reduce((currentElement, nextElement) {
    print('Current: $currentElement, Next: $nextElement');
    return currentElement + nextElement;
  });
  print(addUp);

  int highestNumber = numbers.reduce((value, element) => value > element ? value : element);
  print('Highest: $highestNumber');

  int lowestNumber = numbers.reduce((value, element) => value < element ? value : element);
  print('Highest: $lowestNumber');

}


/// 
/// Fold works the same as Reduce, but you can set a starting value for the collection
/// 
void listFold() {
  List<int> numbers = [11, 7, 3, 86, 97, 17, 23, 65];

  int addUp = numbers.fold(999, (currentElement, nextElement) {
    print('Current: $currentElement, Next: $nextElement');
    return currentElement + nextElement;
  });
  print(addUp);

  int highestNumber = numbers.fold(999, (value, element) => value > element ? value : element);
  print('Highest: $highestNumber');

  int lowestNumber = numbers.fold(999, (value, element) => value < element ? value : element);
  print('Highest: $lowestNumber');

}

void main() {
  //listForEach();
  //listExpand();
  //spreadList();
  //listMaps();
  //listReduce();
  //listFold();
}