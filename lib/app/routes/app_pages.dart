import 'package:get/get.dart';
import '../../views/about/about_view.dart';
import '../../views/catering/catering_view.dart';
import '../../views/contact/contact_view.dart';
import '../../views/events/events_view.dart';
import '../../views/gallery/gallery_view.dart';
import '../../views/home/home_view.dart';
import '../../views/menu/menu_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.home;

  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.catering,
      page: () => const CateringView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.events,
      page: () => const EventsView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.menu,
      page: () => const MenuView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.gallery,
      page: () => const GalleryView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.contact,
      page: () => const ContactView(),
      transition: Transition.fadeIn,
    ),
  ];
}
