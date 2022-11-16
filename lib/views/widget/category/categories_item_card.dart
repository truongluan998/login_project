import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:login_project/views/widget/shimmer/shimmer_layout.dart';

import '../../../config/size_config.dart';
import '../../../config/theme_config.dart';
import '../../../constants/constants.dart';
import '../../../theme/login_app_color.dart';
import '../custom_action_button.dart';
import '../custom_title.dart';
import 'custom_rating_star.dart';

class CategoriesItemCard extends StatelessWidget {
  final String categoryName;
  final String categoryPrice;
  final String rating;
  final String imageUrl;
  final VoidCallback press;
  const CategoriesItemCard({
    Key? key,
    required this.categoryName,
    required this.categoryPrice,
    required this.rating,
    required this.imageUrl,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: LoginAppColor.dividerColor.withOpacity(Dimens.opa0Dot3),
          width: Dimens.size1,
        ),
        borderRadius: BorderRadius.circular(Dimens.size16),
      ),
      shadowColor: LoginAppColor.shadowBackButtonColor.withOpacity(Dimens.opa0Dot2),
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Dimens.size16),
                  topRight: Radius.circular(Dimens.size16),
                  bottomLeft: Radius.circular(Dimens.size10),
                  bottomRight: Radius.circular(Dimens.size10),
                ),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => ShimmerLayout(
                    height: SizeConfig.screenHeight! * Dimens.heightPlaceholderProductImage,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimens.size16),
                        topRight: Radius.circular(Dimens.size16),
                        bottomLeft: Radius.circular(Dimens.size10),
                        bottomRight: Radius.circular(Dimens.size10),
                      ),
                      color: LoginAppColor.shadowBackButtonColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    ImagesAsset.errorAsset,
                    fit: BoxFit.cover,
                    height: SizeConfig.screenHeight! * Dimens.heightPlaceholderProductImage,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: Dimens.size16,
                  left: Dimens.size8,
                  bottom: Dimens.size8,
                  right: Dimens.size8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTitle(
                            title: categoryName,
                            textTheme: ThemeConfig.textTheme.bodyText1,
                          ),
                          CustomTitle(
                            title: categoryPrice,
                            textTheme: ThemeConfig.textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ),
                    CustomActionButton(
                      title: tr('category_screen.category_buy'),
                      width: Dimens.size70,
                      height: Dimens.size27,
                      press: press,
                      textTheme: ThemeConfig.textTheme.subtitle2!.copyWith(
                        color: LoginAppColor.whiteColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          CustomRatingStar(rating: rating)
        ],
      ),
    );
  }
}
