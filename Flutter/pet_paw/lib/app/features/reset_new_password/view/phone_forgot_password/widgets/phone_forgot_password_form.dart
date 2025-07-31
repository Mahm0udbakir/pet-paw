// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../common/custom_text_field.dart';
// import '../../../../../core/utils/constants/app_strings.dart';
// import '../../../../../core/utils/validators/validation.dart';
// import '../../../controller/reset_password_cubit.dart';

// class PhoneForgotPasswordForm extends StatelessWidget {
//   const PhoneForgotPasswordForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<ResetPasswordCubit>();
//     final GlobalKey<FormState> formKeyForgot = GlobalKey<FormState>();

//     return Form(
//       key: formKeyForgot,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           CustomTextField(
//             title: AppStrings.phoneFieldTitle,
//             hintText: AppStrings.phoneFieldHint,
//             icon: const Icon(Icons.phone),
//             keyboardType: TextInputType.phone,
//             controller: cubit.phoneController,
//             validator: Validator.validatePhone,
//             currentFocusNode: cubit.phoneFocus,
//           ),
//         ],
//       ),
//     );
//   }
// }
