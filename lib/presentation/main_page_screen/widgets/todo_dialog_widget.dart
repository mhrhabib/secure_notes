// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../widgets/app_elavated_button.dart';

// class TodoDialogWidget extends StatelessWidget {
//   TodoDialogWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//         side: const BorderSide(
//           color: Color(0xFFFFC107),
//         ),
//       ),
//       insetPadding: const EdgeInsets.all(8),
//       elevation: 10,
//       titlePadding: const EdgeInsets.all(0.0),
//       title: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(right: 50),
//             child: Text(
//               'YOUR ORDER',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w700,
//                 color: Color(0xFF6D6767),
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(
//               Icons.cancel,
//               color: Color(0xFF6D6767),
//             ),
//           ),
//         ],
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
          
//               SizedBox(
//                   width: 200,
//                   child: AppElevatedButton(
//                     bgColor: const Color(0xFFFFC107),
//                     onTap: () {
                     
//                     },
//                     child: const Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.edit,
//                           color: Colors.white,
//                           size: 30,
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Text(
//                           'EDIT',
//                           style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
              
//           const SizedBox(
//             height: 10,
//           ),
//           SizedBox(
//             width: 200,
//             child: AppElevatedButton(
//               bgColor: const Color(0xFF219653),
//               onTap: () {
               
//               },
//               child: const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.remove_red_eye,
//                     color: Colors.white,
//                     size: 30,
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Text(
//                     'VIEW',
//                     style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           SizedBox(
//                   width: 200,
//                   child: AppElevatedButton(
//                     bgColor: const Color(0xFFEB5757),
//                     onTap: () async {
                     
//                     },
//                     child: Obx(
//                       () => orderController.isLoading.value
//                           ? SizedBox(height: twentyPixelheight(context) * 4, width: twentyPixelWidth(context) * 4, child: const Loader())
//                           : const Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.delete,
//                                   color: Colors.white,
//                                   size: 30,
//                                 ),
//                                 SizedBox(
//                                   width: 15,
//                                 ),
//                                 Text(
//                                   'DELETE',
//                                   style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
//                                 )
//                               ],
//                             ),
//                     ),
//                   ),
//                 )
//               : const SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }
