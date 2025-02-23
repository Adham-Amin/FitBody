import 'package:fitbody/core/utils/app_router.dart';
import 'package:fitbody/core/widgets/custom_button.dart';
import 'package:fitbody/features/onbording/presentation/views/widgets/text_onbording.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingViewBody extends StatefulWidget {
  const OnbordingViewBody({super.key});

  @override
  State<OnbordingViewBody> createState() => _OnbordingViewBodyState();
}

class _OnbordingViewBodyState extends State<OnbordingViewBody> {
  final PageController _pageController = PageController();
  int index = 0;

  final List<String> texts = [
    'Welcome To Fitness Life',
    'Workout Categories',
    'Eat Healthy, Live Better',
  ];

  final List<String> desc = [
    'The first fitness App Improve your fitness, practice mindfulness, or prepare for new adventures with a series of specially designed workouts and meditations.',
    'Workout categories will help you gain strength, get in better shape and embrace a healthy life style.',
    'Healthy eating is the key to a happy and balanced life. Choose the best for your body, because your health is your treasure.',
  ];

  final List<String> imagesOnbording = [
    'assets/images/Onboarding-1.png',
    'assets/images/Onboarding-2.png',
    'assets/images/Onboarding-3.png',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width / 375;
    final screenHeight = MediaQuery.of(context).size.height / 812;

    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Image.asset(
              imagesOnbording[index],
              key: ValueKey(index),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 24),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (newIndex) {
                    setState(() {
                      index = newIndex;
                    });
                  },
                  itemCount: texts.length,
                  itemBuilder: (context, pageIndex) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextOnbording(
                          title: texts[pageIndex],
                          desc: desc[pageIndex],
                        ),
                        SizedBox(height: screenHeight * 32),
                      ],
                    );
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: texts.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
              SizedBox(height: screenHeight * 24),
              CustomButton(
                onTap: () {
                  if (index == texts.length - 1) {
                    GoRouter.of(context).push(AppRouter.loginView);
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                title: index == texts.length - 1 ? 'Start Training' : 'Next',
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              SizedBox(height: screenHeight * 32),
            ],
          ),
        ),
      ],
    );
  }
}
