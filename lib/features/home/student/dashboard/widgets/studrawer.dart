
// class Studrawer extends ConsumerWidget {
//   const Studrawer({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Drawer(
//         child: SingleChildScrollView(
//           child: Container(
//             margin: EdgeInsets.only(right: 0.h),
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: fs.Svg(
//                   ImageConstant.imgGroup3496,
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   decoration: AppDecoration.fillPrimary,
//                   child: Column(
//                     children: [
//                       SizedBox(height: 25.v),
//                       _buildLockColumn(context),
//                       SizedBox(height: 21.v),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           navigatorKey.currentState?.push(
//                             MaterialPageRoute(
//                                 builder: (context) => FarmeroneScreen()),
//                           );
//                         },
//                         child: RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: "Try",
//                                 style: CustomTextStyles.titleMediumBold18_1,
//                               ),
//                               TextSpan(
//                                 text: " ",
//                               ),
//                               TextSpan(
//                                 text: "FarmerOne",
//                                 style: CustomTextStyles.titleLargeGreenA700,
//                               ),
//                               TextSpan(
//                                 text: " ",
//                               ),
//                               TextSpan(
//                                 text: "Subscription",
//                                 style: CustomTextStyles.titleMediumBold18_1,
//                               ),
//                             ],
//                           ),
//                           textAlign: TextAlign.left,
//                         ),
//                       ),
//                       CustomImageView(
//                         imagePath: ImageConstant.imgArrowRightGray9000214x14,
//                         height: 14.adaptSize,
//                         width: 14.adaptSize,
//                         margin: EdgeInsets.only(
//                           left: 4.h,
//                           top: 4.v,
//                           bottom: 5.v,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 6.v),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                     width: 231.h,
//                     margin: EdgeInsets.only(left: 30.h),
//                     child: Text(
//                       "Get extra discount on 500+ products & unlimited free delivery",
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: CustomTextStyles.labelLargeGray700.copyWith(
//                         height: 1.62,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16.v),
//                 Divider(
//                   color: appTheme.gray10006,
//                 ),
//                 SizedBox(height: 20.v),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CustomImageView(
//                         imagePath: ImageConstant.imgFavoriteBlack90003,
//                         height: 24.adaptSize,
//                         width: 24.adaptSize,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           left: 21.h,
//                           top: 2.v,
//                           bottom: 3.v,
//                         ),
//                         child: Text(
//                           "Wishlist",
//                           style: CustomTextStyles.titleSmallBlack90003,
//                         ),
//                       ),
//                       Spacer(),
//                       Padding(
//                         padding: EdgeInsets.only(
//                           top: 3.v,
//                           bottom: 2.v,
//                         ),
//                         child: Text(
//                           "10",
//                           style: CustomTextStyles.bodyMediumOutfitGray500,
//                         ),
//                       ),
//                       CustomImageView(
//                         imagePath: ImageConstant.imgArrowRightGray9000214x14,
//                         height: 14.adaptSize,
//                         width: 14.adaptSize,
//                         margin: EdgeInsets.only(
//                           left: 4.h,
//                           top: 5.v,
//                           bottom: 5.v,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 39.v),
//                 GestureDetector(
//                   onTap: () {
//                     navigatorKey.currentState?.push(
//                       MaterialPageRoute(
//                           builder: (context) => AddressesOneScreen()),
//                     );
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.h),
//                     child: _buildCalendarRow(
//                       context,
//                       calendarImage: ImageConstant.imgLinkedinBlack90003,
//                       paymentsText: "Addresses",
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 39.v),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.h),
//                   child: GestureDetector(
//                     onTap: () {
//                       navigatorKey.currentState?.push(
//                         MaterialPageRoute(
//                             builder: (context) => NotificationScreen()),
//                       );
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgIconlySharpOuBlack90003,
//                           height: 24.adaptSize,
//                           width: 24.adaptSize,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 21.h,
//                             top: 2.v,
//                             bottom: 3.v,
//                           ),
//                           child: Text(
//                             "Notification",
//                             style: CustomTextStyles.titleSmallBlack90003,
//                           ),
//                         ),
//                         Container(
//                           width: 20.adaptSize,
//                           margin: EdgeInsets.only(left: 10.h),
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 6.h,
//                             vertical: 2.v,
//                           ),
//                           decoration: AppDecoration.fillPrimary.copyWith(
//                             borderRadius: BorderRadiusStyle.roundedBorder10,
//                           ),
//                           child: Text(
//                             "2",
//                             style:
//                                 CustomTextStyles.labelLargeWhiteA700SemiBold12,
//                           ),
//                         ),
//                         Spacer(),
//                         CustomImageView(
//                           imagePath: ImageConstant.imgArrowRightGray9000214x14,
//                           height: 14.adaptSize,
//                           width: 14.adaptSize,
//                           margin: EdgeInsets.symmetric(vertical: 5.v),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 40.v),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.h),
//                   child: _buildCalendarRow(
//                     context,
//                     calendarImage: ImageConstant.imgCalendar,
//                     paymentsText: "Payments",
//                   ),
//                 ),
//                 SizedBox(height: 40.v),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.h),
//                   child: _buildCalendarRow(
//                     context,
//                     calendarImage: ImageConstant.imgSignalBlack90003,
//                     paymentsText: "Rate us on Play Store",
//                   ),
//                 ),
//                 SizedBox(height: 40.v),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.h),
//                   child: _buildCalendarRow(
//                     context,
//                     calendarImage: ImageConstant.imgSearchBlack90003,
//                     paymentsText: "Share the app",
//                   ),
//                 ),
//                 SizedBox(height: 40.v),
//                 GestureDetector(
//                   onTap: () {
//                     navigatorKey.currentState?.push(
//                       MaterialPageRoute(
//                           builder: (context) => NotificationScreen()),
//                     );
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgSearch,
//                           height: 25.adaptSize,
//                           width: 25.adaptSize,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 20.h,
//                             top: 5.v,
//                           ),
//                           child: Text(
//                             "Settings",
//                             style: CustomTextStyles.titleSmallBlack90003,
//                           ),
//                         ),
//                         Spacer(),
//                         CustomImageView(
//                           imagePath: ImageConstant.imgArrowRightGray9000214x14,
//                           height: 14.adaptSize,
//                           width: 14.adaptSize,
//                           margin: EdgeInsets.only(
//                             top: 5.v,
//                             bottom: 6.v,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 40.v),
//                 GestureDetector(
//                   onTap: () {
//                     navigatorKey.currentState?.push(
//                       MaterialPageRoute(
//                           builder: (context) => TermsAndPoliciesScreen()),
//                     );
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CustomImageView(
//                           imagePath: ImageConstant.imgFolder,
//                           height: 24.adaptSize,
//                           width: 24.adaptSize,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(
//                             left: 19.h,
//                             top: 2.v,
//                             bottom: 3.v,
//                           ),
//                           child: Text(
//                             "Terms & Policies",
//                             style: CustomTextStyles.titleSmallBlack9000315,
//                           ),
//                         ),
//                         Spacer(),
//                         CustomImageView(
//                           imagePath: ImageConstant.imgArrowRightGray9000214x14,
//                           height: 14.adaptSize,
//                           width: 14.adaptSize,
//                           margin: EdgeInsets.symmetric(vertical: 5.v),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 40.v),
//                 GestureDetector(
//                   onTap: () {
//                     navigatorKey.currentState?.push(
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               HelpCenterContactUsTabContainerScreen()),
//                     );
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20.h),
//                     child: _buildCalendarRow(
//                       context,
//                       calendarImage: ImageConstant.imgUserBlack90003,
//                       paymentsText: "Help & Support",
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 40.v),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 20.h),
//                     child: GestureDetector(
//                       onTap: () {
//                         navigatorKey.currentState?.push(
//                           MaterialPageRoute(
//                               builder: (context) => LoginScreen()),
//                         );
//                       },
//                       child: Row(
//                         children: [
//                           CustomImageView(
//                             imagePath: ImageConstant.imgFi2529508,
//                             height: 24.adaptSize,
//                             width: 24.adaptSize,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                               left: 20.h,
//                               top: 4.v,
//                             ),
//                             child: Text(
//                               "Logout",
//                               style: CustomTextStyles.titleSmallRedA400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 46.v),
//               ],
//             ),
//           ),
//         ),
//       );
//   }
// }
