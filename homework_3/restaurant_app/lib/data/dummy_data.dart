import '../models/dish.dart';

final List<Dish> allDishes = [
  // Starters
  Dish(
    id: 1,
    name: 'Bruschetta',
    category: 'Starters',
    price: 5.99,
    description: 'Crispy bread topped with tomatoes, garlic, and basil',
    imageUrl: '🍞',
  ),
  Dish(
    id: 2,
    name: 'Calamari Fritti',
    category: 'Starters',
    price: 7.99,
    description: 'Tender fried squid served with marinara sauce',
    imageUrl: '🦑',
  ),
  Dish(
    id: 3,
    name: 'Caprese Salad',
    category: 'Starters',
    price: 6.99,
    description: 'Fresh mozzarella, tomato, and basil',
    imageUrl: '🥗',
  ),
  // Main Courses
  Dish(
    id: 4,
    name: 'Spaghetti Carbonara',
    category: 'Main Courses',
    price: 12.99,
    description: 'Creamy pasta with bacon, egg, and parmesan',
    imageUrl: '🍝',
  ),
  Dish(
    id: 5,
    name: 'Grilled Salmon',
    category: 'Main Courses',
    price: 15.99,
    description: 'Fresh salmon fillet with lemon butter sauce',
    imageUrl: '🐟',
  ),
  Dish(
    id: 6,
    name: 'Beef Steak',
    category: 'Main Courses',
    price: 18.99,
    description: 'Juicy ribeye steak with garlic mashed potatoes',
    imageUrl: '🥩',
  ),
  // Desserts
  Dish(
    id: 7,
    name: 'Tiramisu',
    category: 'Desserts',
    price: 5.99,
    description: 'Italian cream dessert with coffee and cocoa',
    imageUrl: '🍰',
  ),
  Dish(
    id: 8,
    name: 'Chocolate Cake',
    category: 'Desserts',
    price: 4.99,
    description: 'Rich chocolate cake with frosting',
    imageUrl: '🍫',
  ),
  Dish(
    id: 9,
    name: 'Panna Cotta',
    category: 'Desserts',
    price: 5.99,
    description: 'Smooth Italian vanilla custard with berries',
    imageUrl: '🍮',
  ),
  // Drinks
  Dish(
    id: 10,
    name: 'Iced Tea',
    category: 'Drinks',
    price: 2.99,
    description: 'Refreshing cold tea with lemon',
    imageUrl: '🧋',
  ),
  Dish(
    id: 11,
    name: 'Espresso',
    category: 'Drinks',
    price: 3.99,
    description: 'Strong Italian coffee',
    imageUrl: '☕',
  ),
  Dish(
    id: 12,
    name: 'Fresh Orange Juice',
    category: 'Drinks',
    price: 3.49,
    description: 'Freshly squeezed orange juice',
    imageUrl: '🍊',
  ),
];
