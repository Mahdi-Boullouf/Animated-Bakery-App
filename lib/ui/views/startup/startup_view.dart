import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:animated_bakery/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 1, end: 0),
          duration: const Duration(milliseconds: 600),
          builder: (_, progress, widget) => Opacity(
            opacity: (progress - 1).abs(),
            child: Container(
              margin: EdgeInsets.only(bottom: progress * 45),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Bakery',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        fontFamily: GoogleFonts.lobster().fontFamily),
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Loading ...', style: TextStyle(fontSize: 12)),
                      horizontalSpaceSmall,
                      SizedBox(
                        width: 10,
                        height: 10,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 6,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
