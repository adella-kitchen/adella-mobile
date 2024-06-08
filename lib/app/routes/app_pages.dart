import 'package:adella_kitchen/app/modules/profile/views/cek_riwayat_pesanan_view.dart';
import 'package:adella_kitchen/app/modules/profile/views/pengaturan_akun_view.dart';
import 'package:adella_kitchen/app/modules/profile/views/pengaturan_alamat_view.dart';
import 'package:adella_kitchen/app/modules/profile/views/ubah_kata_sandi_view.dart';
import 'package:get/get.dart';

import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detail_produk/bindings/detail_produk_binding.dart';
import '../modules/detail_produk/views/detail_produk_view.dart';
import '../modules/explore/bindings/explore_binding.dart';
import '../modules/explore/views/explore_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/input_pass/bindings/input_pass_binding.dart';
import '../modules/input_pass/views/input_pass_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/otp_email/bindings/otp_email_binding.dart';
import '../modules/otp_email/views/otp_email_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/starter/bindings/starter_binding.dart';
import '../modules/starter/views/starter_view.dart';
import '../modules/step_page/bindings/step_page_binding.dart';
import '../modules/step_page/views/step_page_view.dart';
import '../modules/verif_email/bindings/verif_email_binding.dart';
import '../modules/verif_email/views/verif_email_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.CEK_RIWAYAT_PESANAN,
      page: () => const CekRiwayatPesananView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.UBAH_KATA_SANDI,
      page: () => UbahKataSandiView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PENGATURAN_AKUN,
      page: () => PengaturanAkunView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PENGATURAN_ALAMAT,
      page: () => const PengaturanAlamatView(),
      binding: ProfileBinding(),
    ),
     GetPage(
      name: _Paths.VERIF_EMAIL,
      page: () => const VerifEmailView(),
      binding: VerifEmailBinding(),
    ),
    GetPage(
      name: _Paths.STARTER,
      page: () => const StarterView(),
      binding: StarterBinding(),
    ),
    GetPage(
      name: _Paths.STEP_PAGE,
      page: () => const StepPageView(),
      binding: StepPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUK,
      page: () => DetailProdukView(),
      binding: DetailProdukBinding(),
    ),
    GetPage(
      name: _Paths.INPUT_PASS,
      page: () => const InputPassView(),
      binding: InputPassBinding(),
    ),
    GetPage(
      name: _Paths.OTP_EMAIL,
      page: () => const OtpEmailView(),
      binding: OtpEmailBinding(),
    ),
  ];
}
