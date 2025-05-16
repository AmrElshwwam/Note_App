import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_notes/bindings/add_note_binding.dart';
import 'package:my_notes/bindings/category_screen_binding.dart';
import 'package:my_notes/bindings/details_screen_binding.dart';
import 'package:my_notes/bindings/drawer_binding.dart';
import 'package:my_notes/bindings/search_screen_binding.dart';
import 'package:my_notes/bindings/select_category_binding.dart';
import 'package:my_notes/bindings/signin_binding.dart';
import 'package:my_notes/bindings/signup_binding.dart';
import 'package:my_notes/core/constant/strings_routes.dart';
import 'package:my_notes/view/screens/add_note_screen.dart';
import 'package:my_notes/view/screens/category_screen.dart';
import 'package:my_notes/view/screens/details_screen.dart';
import 'package:my_notes/view/screens/home_screen.dart';
import 'package:my_notes/view/screens/master_screen.dart';
import 'package:my_notes/view/screens/search_screen.dart';
import 'package:my_notes/view/screens/show_all_notes_screen.dart';
import 'package:my_notes/view/screens/signin_screen.dart';
import 'package:my_notes/view/screens/signup_screen.dart';
import 'package:my_notes/view/screens/welcome_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoutes.welcomeScreen, page: () => const WelcomeScreen()),

  GetPage(
    name: AppRoutes.signupScreen,
    page: () => const SignupScreen(),
    binding: SignupBinding(),
  ),

  GetPage(
    name: AppRoutes.signinScreen,
    page: () => const SigninScreen(),
    binding: SigninBinding(),
  ),

  GetPage(
    name: AppRoutes.masterScreen,
    page: () => const MasterScreen(),
    bindings: [DrawerBinding()],
  ),

  GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),

  GetPage(
    name: AppRoutes.addNoteScreen,
    page: () => const AddNoteScreen(),
    bindings: [AddNoteBinding(), SelectCategoryBinding()],
  ),

  GetPage(
    name: AppRoutes.categoryScreen,
    page: () => const CategoryScreen(),
    binding: CategoryScreenBinding(),
  ),

  GetPage(
    name: AppRoutes.detailsNote,
    page: () => const DetailsScreen(),
    binding: DetailsScreenBinding(),
  ),

  GetPage(name: AppRoutes.showAll, page: () => const ShowAllNotesScreen()),

  GetPage(
    name: AppRoutes.searchScreen,
    page: () => const SearchScreen(),
    binding: SearchBinding(),
  ),
];
