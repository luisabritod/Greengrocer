import 'package:greengrocer/scr/models/models.dart';

ItemModels apple = ItemModels(
  itemName: 'Apple',
  imgUrl: 'assets/images/fruits/apple.png',
  unit: 'kg',
  price: 2.99,
  description: 'Fresh and juicy apple',
);

ItemModels grape = ItemModels(
  imgUrl: 'assets/images/fruits/grape.png',
  itemName: 'Grape',
  price: 7.4,
  unit: 'kg',
  description:
      'The best grape in the region, offering the best price among any marketplace. This item contains essential vitamins for body strengthening, resulting in a healthy life.',
);

ItemModels guava = ItemModels(
  imgUrl: 'assets/images/fruits/guava.png',
  itemName: 'Guava',
  price: 11.5,
  unit: 'kg',
  description:
      'The best guava in the region, offering the best price among any marketplace. This item contains essential vitamins for body strengthening, resulting in a healthy life.',
);

ItemModels kiwi = ItemModels(
  imgUrl: 'assets/images/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'The best kiwi in the region, offering the best price among any marketplace. This item contains essential vitamins for body strengthening, resulting in a healthy life.',
);

ItemModels mango = ItemModels(
  imgUrl: 'assets/images/fruits/mango.png',
  itemName: 'Mango',
  price: 2.5,
  unit: 'un',
  description:
      'The best mango in the region, offering the best price among any marketplace. This item contains essential vitamins for body strengthening, resulting in a healthy life.',
);

ItemModels papaya = ItemModels(
  imgUrl: 'assets/images/fruits/papaya.png',
  itemName: 'Papaya',
  price: 8,
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

List<OrdersModel> orders = [
  // Order 01
  OrdersModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2025-06-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2025-06-08 11:00:10.458',
    ),
    id: 'asd6a54da6s2d1',
    status: 'pending_payment',
    total: 11.0,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: mango,
        quantity: 2,
      ),
    ],
  ),

  // Order 02
  OrdersModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2025-06-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2025-06-08 11:00:10.458',
    ),
    id: 'a65s4d6a2s1d6a5s',
    status: 'delivered',
    total: 11.5,
    items: [
      CartItemModel(
        item: guava,
        quantity: 1,
      ),
    ],
  ),

  // Order 03
  OrdersModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2025-06-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2025-06-08 11:00:10.458',
    ),
    id: 'a6s5d4a6s2d1a6s5d',
    status: 'refunded',
    total: 11.5,
    items: [
      CartItemModel(
        item: kiwi,
        quantity: 1,
      ),
      CartItemModel(
        item: grape,
        quantity: 5,
      )
    ],
  ),
];
