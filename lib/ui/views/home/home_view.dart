import 'package:animated_bakery/ui/common/images.dart';
import 'package:animated_bakery/ui/views/product/product_view.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:stacked/stacked.dart';
import 'package:animated_bakery/ui/common/app_colors.dart';
import 'package:animated_bakery/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Center(
        child: LiquidSwipe.builder(
          enableSideReveal: true, 
          slideIconWidget: Icon(Icons.arrow_back_ios),
            enableLoop: true,
            
        
            waveType: WaveType.liquidReveal,
            itemBuilder: (c, index) => ProductView(index: index),
            itemCount: Images.donutsImages.length),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
