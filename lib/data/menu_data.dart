import '../app/constants/asset_constants.dart';
import '../models/menu_model.dart';

final List<MenuItemModel> menuData = [
  // ARABIC CUISINE
  const MenuItemModel(
    id: 'arabic-1',
    name: 'Special Full Mutton Mandi & Arabic Salads',
    category: 'ARABIC',
    description: 'Authentic Yemeni-style slow-roasted whole mutton served on aromatic long-grain Mandi rice with spicy Tomato Dakkous, Hummus, and Fresh Khubz.',
    image: AppImages.biriyani,
    tags: ['Masterpiece', 'Arabic Specialty', 'Non-Veg'],
    isSpecialty: true,
  ),
  const MenuItemModel(
    id: 'arabic-2',
    name: 'Charcoal Al Faham & Shish Tawook Grill',
    category: 'ARABIC',
    description: 'Smoky garlic marinated chicken grilled over coconut charcoal, served with creamy Garlic Toum, Pickles, and Mint Dip.',
    image: AppImages.starters,
    tags: ['Live Counter', 'Popular Grill'],
    isSpecialty: true,
  ),
  const MenuItemModel(
    id: 'arabic-3',
    name: 'Mezze Platter (Hummus, Mutabbal & Falafel)',
    category: 'ARABIC',
    description: 'Creamy chickpea hummus, smoked eggplant dip, crispy gold falafels served with warm pita bread.',
    image: AppImages.starters,
    tags: ['Vegetarian', 'Arabic Classic'],
  ),

  // INDIAN CUISINE
  const MenuItemModel(
    id: 'indian-1',
    name: 'Thalassery Mutton Dum Biriyani',
    category: 'INDIAN',
    description: 'Short-grain Kaima rice layered with tender Malabar mutton, caramelized onion, pure ghee, cashew, and aromatic spices cooked on traditional dum.',
    image: AppImages.biriyani,
    tags: ['Signature', 'Malabar Classic', 'Non-Veg'],
    isSpecialty: true,
  ),
  const MenuItemModel(
    id: 'indian-2',
    name: 'Grand Kerala Sadya (28 Items Feast)',
    category: 'INDIAN',
    description: 'Authentic 28-course traditional Kerala Sadya served on fresh plantain leaf including Palada Pradhaman, Parippu, Avial, Olan, and Sambar.',
    image: AppImages.sadya,
    tags: ['Pure Veg', 'Traditional Heritage'],
    isSpecialty: true,
  ),
  const MenuItemModel(
    id: 'indian-3',
    name: 'Butter Chicken & Tandoori Naan Counter',
    category: 'INDIAN',
    description: 'Rich tomato cashew gravy chicken paired with live tandoori naan, garlic butter roti, and mint chutney.',
    image: AppImages.wedding,
    tags: ['North Indian', 'Live Station'],
  ),

  // CHINESE CUISINE
  const MenuItemModel(
    id: 'chinese-1',
    name: 'Dragon Chicken & Chili Garlic Hakka Noodles',
    category: 'CHINESE',
    description: 'Crispy tossed sweet & spicy red sauce chicken accompanied by wok-tossed chili garlic noodles and spring onion.',
    image: AppImages.starters,
    tags: ['Pan-Asian', 'Live Wok'],
  ),
  const MenuItemModel(
    id: 'chinese-2',
    name: 'Schezwan Fried Rice & Veg Manchurian',
    category: 'CHINESE',
    description: 'Fiery wok-fried rice with tossed vegetables paired with savory soy-ginger vegetable Manchurian gravy balls.',
    image: AppImages.buffet,
    tags: ['Vegetarian', 'Pan-Asian'],
  ),

  // CONTINENTAL FOOD
  const MenuItemModel(
    id: 'continental-1',
    name: 'Live Pasta & Creamy Risotto Station',
    category: 'CONTINENTAL FOOD',
    description: 'Made-to-order Penne, Fusilli, and Mushroom Risotto with Alfredo white sauce, Arrabbiata red sauce, and fresh parmesan.',
    image: AppImages.buffet,
    tags: ['Live Counter', 'Continental'],
    isSpecialty: true,
  ),
  const MenuItemModel(
    id: 'continental-2',
    name: 'Herb Roasted Chicken & Carving Station',
    category: 'CONTINENTAL FOOD',
    description: 'Rosemary-infused roasted chicken and spice-rubbed beef roast carved live by chefs, served with brown garlic jus and mashed potatoes.',
    image: AppImages.buffet,
    tags: ['Carving Counter', 'Continental'],
  ),

  // DESSERTS & BEVERAGES
  const MenuItemModel(
    id: 'dessert-1',
    name: 'Palada Pradhaman & Tender Coconut Payasam',
    category: 'DESSERTS',
    description: 'Slow-cooked milk payasam with ghee-roasted cashews paired with refreshing fresh tender coconut payasam.',
    image: AppImages.desserts,
    tags: ['Kerala Specialty', 'Sweet Counter'],
    isSpecialty: true,
  ),
  const MenuItemModel(
    id: 'dessert-2',
    name: 'Live Mocktail & Gourmet Ice Cream Bar',
    category: 'DESSERTS',
    description: 'Freshly mixed Passion Fruit Mojito, Blue Lagoon, Kozhikodan Halwa, Gulab Jamun, and artisanal ice cream sundaes.',
    image: AppImages.desserts,
    tags: ['Live Lounge Bar', 'Popular'],
  ),
];
