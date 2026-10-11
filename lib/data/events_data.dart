import '../app/constants/asset_constants.dart';
import '../models/event_model.dart';

final List<EventModel> eventsData = [
  const EventModel(
    id: 'wedding-1',
    title: 'The Royal Heritage Wedding',
    category: 'WEDDING',
    description:
        'A grand 2,000+ guest royal wedding featuring traditional Kerala Sadya by afternoon and a luxury Arabic & Continental buffet by evening with live counters.',
    location: 'Kottakkal & Calicut Venues',
    image: AppImages.weddingHero,
    guestCount: '2,000+ Guests',
    highlights: [
      '28-Item Traditional Plantain Leaf Sadya',
      'Live Arabic Al Faham & Shawarma Counters',
      'Continental Pasta & Mocktail Bar',
      'Full Banquet Staff & Floral Decor',
    ],
  ),
  const EventModel(
    id: 'anniversaries-1',
    title: 'Silver & Golden Anniversary Galas',
    category: 'ANNIVERSARIES',
    description:
        'Elegant milestone anniversary celebrations with personalized dining setups, live grilled kebabs, and custom dessert counters.',
    location: 'Malappuram & Thrissur',
    image: AppImages.privateEvents,
    guestCount: '350+ Guests',
    highlights: [
      'Live BBQ & Tandoori Kebabs',
      'Custom Anniversary Cake & Dessert Bar',
      'Personalized Steward Service',
    ],
  ),
  const EventModel(
    id: 'party-orders-1',
    title: 'Private Home & Family Party Orders',
    category: 'PARTY ORDERS',
    description:
        'Bespoke catering for intimate gatherings, housewarmings, and private parties with hygienic insulated delivery and live setup.',
    location: 'Serving Across Kottakkal & Malappuram',
    image: AppImages.biriyani,
    guestCount: '50 to 300 Guests',
    highlights: [
      'Thalassery Biriyani Special Packs',
      'Customized Menu Selection',
      'Hygienic On-Time Hot Delivery',
    ],
  ),
  const EventModel(
    id: 'buffet-1',
    title: 'Luxury Live Counter Buffet Experience',
    category: 'BUFFETS',
    description:
        'High-end multi-cuisine buffet counters featuring live pasta, live carving stations, interactive chaat counters, and dessert fountains.',
    location: 'Major Kerala Convention Centers',
    image: AppImages.buffet,
    guestCount: '500+ Guests',
    highlights: [
      'Multi-Lane Parallel Buffet Setup',
      'Live Italian & Continental Stations',
      'Zero Waiting Time Hospitality',
    ],
  ),
  const EventModel(
    id: 'events-1',
    title: 'Corporate Conventions & Festival Events',
    category: 'EVENTS',
    description:
        'Large-scale hospitality for corporate conferences, summits, and mega cultural events with seamless crowd management.',
    location: 'Malappuram (Dt.) & Neighboring Districts',
    image: AppImages.largeScale,
    guestCount: '3,000+ Attendees',
    highlights: [
      'Synchronized Multi-Counter Service',
      'Executive Boxed & Plated Meals',
      'VIP Lounge Catering & Beverage Bars',
    ],
  ),
];
