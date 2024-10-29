import 'dart:ui';

import 'package:animated_bakery/ui/common/app_colors.dart';
import 'package:animated_bakery/ui/common/app_strings.dart';
import 'package:animated_bakery/ui/common/images.dart';
import 'package:animated_bakery/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'product_viewmodel.dart';

class ProductView extends StackedView<ProductViewModel> {
  const ProductView({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget builder(
    BuildContext context,
    ProductViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: backgroundColors[index],
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 8, end: 0),
              curve: Curves.bounceIn,
              builder: (context, value, child) => Transform.rotate(
                  angle: value,
                  child: Image.asset(
               "assets/images/"+ Images.donutsImages[index])),
              duration: Duration(milliseconds: 600),
            ),
            Text(
              donutsNames[index],
              style: TextStyle(
                  fontSize: 40, fontFamily: GoogleFonts.lobster().fontFamily),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlassIconButton(icon: Icons.add, onPressed: () {}),
              SizedBox(width: 12,),
                Text(
                  "1",
                  style: TextStyle(fontSize: 26),
                ),
              SizedBox(width: 12,),

                GlassIconButton(icon: Icons.remove, onPressed: () {})
              ],
            ),
            verticalSpaceLarge,
            verticalSpaceLarge,
            verticalSpaceLarge,
            verticalSpaceLarge,
            verticalSpaceLarge,


            FilledButton( onPressed: (){}, child: Text("Procced"))
          ],
        ),
      ),
    );
  }

  @override
  ProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductViewModel();
}

class GlassIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const GlassIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), // Rounded corners
      child: Stack(
        children: [
          // The frosted glass effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4), // Glass-like effect
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1.5,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              child: IconButton(
                icon: Icon(icon, color: Colors.black, size: 24),
                onPressed: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
