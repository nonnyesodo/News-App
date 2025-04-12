import 'package:news_app/features/home/data/local/home_static_repo.dart';
import 'package:news_app/features/home/presentation/pages/home_page.dart';
import 'package:news_app/global_widget/export.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final screens = [
    HomePage(),
    HomePage(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // final watchHome = context.watch<HomeCubit>();
    return Scaffold(
      body: screens[0],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppshadowContainer(
            radius: 0,
            color: AppColors.white,
            padding: EdgeInsets.all(size.width * 0.04),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    HomeStaticRepo.bottomNav.length,
                    (ind) => GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Icon(
                                ind == 0
                                    ? HomeStaticRepo.bottomNav[ind].iconActivate
                                    : HomeStaticRepo
                                        .bottomNav[ind].iconInactive,
                              ),
                              5.verticalSpace,
                              AppText(
                                  text: HomeStaticRepo.bottomNav[ind].label,
                                  fontWeight: ind == 0
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  fontSize: 12,
                                  color: ind == 0
                                      ? AppColors.primaryColor
                                      : AppColors.textGray1)
                            ],
                          ),
                        ))),
          )
        ],
      ),
    );
  }
}
