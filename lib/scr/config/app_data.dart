import 'package:greengrocer/scr/models/models.dart';

ItemModels apple = ItemModels(
  itemName: 'Apple',
  imgUrl: 'assets/images/fruits/apple.png',
  unit: '1 kg',
  price: '2.99',
  description: 'Fresh and juicy apple',
);

ItemModels grape = ItemModels(
  imgUrl: 'assets/images/fruits/grape.png',
  itemName: 'Grape',
  price: '7.4',
  unit: 'kg',
  description:
      'The best grape in the region, offering the best price among any marketplace. This item contains essential vitamins for body strengthening, resulting in a healthy life.',
);

ItemModels guava = ItemModels(
  imgUrl: 'assets/images/fruits/guava.png',
  itemName: 'Guava',
  price: '11.5',
  unit: 'kg',
  description:
      'The best guava in the region, offering the best price among any marketplace. This item contains essential vitamins for body strengthening, resulting in a healthy life.',
);

ItemModels kiwi = ItemModels(
  imgUrl: 'assets/images/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: '2.5',
  unit: 'unit',
  description:
      'The best kiwi in the region, offering the best price among any marketplace. This item contains essential vitamins for body strengthening, resulting in a healthy life.',
);

ItemModels mango = ItemModels(
  imgUrl: 'assets/images/fruits/mango.png',
  itemName: 'Mango',
  price: '2.5',
  unit: 'unit',
  description:
      'The best mango in the region, offering the best price among any marketplace. This item contains essential vitamins for body strengthening, resulting in a healthy life.',
);

ItemModels papaya = ItemModels(
  imgUrl: 'assets/images/fruits/papaya.png',
  itemName: 'Papaya',
  price: '8',
  unit: 'kg',
  description:
      'The best papaya in the region, offering the best price among any marketplace. This item contains essential vitamins for body strengthening, resulting in a healthy life.',
);

// Product list
List<ItemModels> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Fruits',
  'Vegetables',
  'Meat',
  'Dairy',
  'Cereal',
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 2),
  CartItemModel(item: grape, quantity: 1),
  CartItemModel(item: guava, quantity: 3),
  CartItemModel(item: kiwi, quantity: 2),
  CartItemModel(item: mango, quantity: 1),
  CartItemModel(item: papaya, quantity: 2),
];
