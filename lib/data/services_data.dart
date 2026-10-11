import '../app/constants/asset_constants.dart';
import '../models/service_model.dart';

final List<ServiceModel> servicesData = [
  const ServiceModel(
    id: 'wedding-catering',
    number: '01',
    title: 'WEDDING CATERING',
    subtitle: 'Unforgettable Wedding Feasts & Receptions',
    description:
        'Traditional Kerala wedding feasts, elegant reception menus, live culinary counters, and bespoke dining tailored for your royal day.',
    image: AppImages.wedding,
    features: [
      'Customized Multicuisine Menus',
      'Authentic Kerala Sadya Experience',
      'Live Grill & Mocktail Counters',
      'Royal Presentation & Plating',
      'Dedicated Dining Stewards',
    ],
  ),
  const ServiceModel(
    id: 'corporate-catering',
    number: '02',
    title: 'CORPORATE CATERING',
    subtitle: 'Professional Hospitality for Business Events',
    description:
        'Executive lunches, corporate galas, international conferences, and team celebrations with seamless timing and premium hospitality.',
    image: AppImages.corporate,
    features: [
      'Executive Buffet & Plated Dining',
      'High-Tea & Coffee Breaks',
      'Strict Hygiene Protocols',
      'Dietary & Vegan Customizations',
      'On-Time Precision Delivery',
    ],
  ),
  const ServiceModel(
    id: 'kerala-sadya',
    number: '03',
    title: 'KERALA SADYA',
    subtitle: 'Traditional Grand Feast on Plantain Leaf',
    description:
        'Authentic 26+ item Kerala Sadya prepared by master chefs following time-honored recipes and traditional rituals for sacred celebrations.',
    image: AppImages.sadya,
    features: [
      'Pure Vegetarian Traditional Sadya',
      'Fresh Banana Leaf Service',
      'Palada & Parippu Payasam Specialties',
      'Master Sadya Chefs from Central Travancore',
      'Seamless Flow for Thousands of Guests',
    ],
  ),
  const ServiceModel(
    id: 'malabar-cuisine',
    number: '04',
    title: 'MALABAR CUISINE',
    subtitle: 'Rich Culinary Heritage of the Malabar Coast',
    description:
        'Aromatic Thalassery Biriyani, traditional Malabar Pathiri, rich meats, coastal seafood delicacies, and authentic heritage snacks.',
    image: AppImages.biriyani,
    features: [
      'Authentic Malabar Dum Biriyani',
      'Fresh Coastal Seafood Specialties',
      'Handcrafted Pathiri & Parotta Stations',
      'Rich Heritage Desserts & Suleimani',
      'Live Hot Counter Experience',
    ],
  ),
  const ServiceModel(
    id: 'private-celebrations',
    number: '05',
    title: 'PRIVATE CELEBRATIONS',
    subtitle: 'Intimate Dining for Special Moments',
    description:
        'Birthdays, engagements, housewarmings, and anniversary dinners designed with personalized menus, attentive service, and cozy elegance.',
    image: AppImages.privateEvents,
    features: [
      'Custom Bounded Menus',
      'Compact Live Stations',
      'Elegant Table Setups',
      'Full Cleanup & Service Staff',
      'Specialized Kids & Dessert Bars',
    ],
  ),
  const ServiceModel(
    id: 'large-scale-catering',
    number: '06',
    title: 'LARGE-SCALE CATERING',
    subtitle: 'High-Volume Production with Flawless Quality',
    description:
        'Infrastructure and expertise to comfortably cater gatherings of 2,000 to 10,000+ guests without losing taste consistency or warmth.',
    image: AppImages.largeScale,
    features: [
      'Industrial Kitchen Capacity',
      'Trained Multi-Tier Staff',
      'Temperature Controlled Food Logistics',
      'Multiple Concurrent Buffet Runs',
      'Complete Waste Management',
    ],
  ),
];
