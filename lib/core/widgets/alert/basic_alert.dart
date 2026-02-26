// import 'package:flutter/material.dart';
// import 'package:portal1409/core/widgets/buttons/alert_button.dart';
// import 'package:portal1409/theme/custom/alert_custom_theme.dart';

// Future<void> showCustomAlert(
  
//   BuildContext context,
//   String titleText,
//   String buttonText,{
//   String? subtitileText,
//   String? textButtonText,
//   VoidCallback? buttonFunc,
//   VoidCallback? textButtonFunc,
//   VoidCallback? spaceFunc,}
// ) {
//   final theme = Theme.of(context);
//   final alertTheme = theme.extension<CustomAlertTheme>();
//   return showDialog(
//     useSafeArea: false,
//     context: context,
//     barrierDismissible: true,
//     builder: (context) {
//       return Stack(
//         children: [
//           Positioned.fill(
//             child: GestureDetector(
//               onTap: spaceFunc,
//               child: Container(color: Colors.black.withAlpha(51)),
//             ),
//           ),
//           Center(
//             child: GestureDetector(
//               onTap: () {},
//               child: Dialog(
//                 backgroundColor: alertTheme?.color,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         titleText,
//                         style: theme.textTheme.bodyMedium?.copyWith(
//                           color: alertTheme?.titleTextColor,
//                           fontSize: 18,
//                         ),
//                       ),

//                       const SizedBox(height: 8),

//                       subtitileText == null
//                           ? const SizedBox()
//                           : Text(
//                               subtitileText,
//                               softWrap: true,
//                               style: theme.textTheme.bodySmall?.copyWith(
//                                 fontSize: 14,
//                                 color: alertTheme?.destiptionTextColor,
//                               ),
//                             ), // Subtitle

//                       const SizedBox(height: 25),

//                       AlertButton(
//                         buttonText: buttonText,
//                         buttonFunction: buttonFunc,
//                       ),

                      

//                       textButtonText == null
//                           ? const SizedBox()
//                           : Column(
//                             mainAxisSize: .min,
//                             crossAxisAlignment: .center,
//                             children: [
//                               const SizedBox(height: 10),
//                               TextButton(
//                                   onPressed: textButtonFunc,
//                                   child: Text(
//                                     textButtonText,
//                                     style: theme.textTheme.bodySmall?.copyWith(
//                                       fontSize: 14,
//                                       color: alertTheme?.textButtonColor,
//                                     ),
//                                   ),
//                                 ),
//                             ],
//                           ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }
