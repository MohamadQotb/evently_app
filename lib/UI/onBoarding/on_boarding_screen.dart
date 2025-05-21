import 'package:evently_app/UI/auth/login_screen/login_screen.dart';
import 'package:evently_app/UI/onBoarding/models/on_boarding_model_class.dart';
import 'package:evently_app/UI/onBoarding/widgets/on_boarding_card.dart';
import 'package:evently_app/core/common/app_assets.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/onBoardingScreen';

  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;

  final PageController controller = PageController();

  void nextPage() {
    controller.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  void previousPage() {
    controller.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.appBarLogo,
                height: 50,
              ),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    currentPage = value;
                    setState(() {});
                  },
                  controller: controller,
                  itemCount: 3,
                  itemBuilder: (context, index) => OnBoardingCard(
                      onBoardingModelClass:
                          OnBoardingModelClass.onBoardingList[index]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: currentPage != 0,
                    replacement: const SizedBox(
                      width: 50,
                    ),
                    child: IconButton(
                        onPressed: () {
                          previousPage();
                        },
                        icon: Icon(Icons.arrow_back)),
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 6,
                      activeDotColor: AppColors.mainColor,
                      dotColor: Theme.of(context).textTheme.titleMedium!.color!,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (controller.page == 2) {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        } else {
                          nextPage();
                        }
                      },
                      icon: Icon(Icons.arrow_forward)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
