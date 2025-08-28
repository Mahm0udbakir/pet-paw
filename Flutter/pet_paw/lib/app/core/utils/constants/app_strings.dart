import '../../../localization/generated/l10n.dart';

class AppStrings {
  // -------------------- Get Started Screen --------------------
  static String get getStartedTitle => S.current.getStartedTitle;
  static String get getStartedSubtitle => S.current.getStartedSubtitle;
  static String get signUp => S.current.signUp;
  static String get signIn => S.current.signIn;
  static String get continueAsGuest => S.current.continueAsGuest;
  static String get changeLanguage => S.current.changeLanguage;
  static String get selectYourLanguage => S.current.selectYourLanguage;

  // -------------------- Get Started Screen --------------------
  static String get onboardingTitle1 => S.current.onboardingTitle1;
  static String get onboardingTitle2 => S.current.onboardingTitle2;
  static String get onboardingTitle3 => S.current.onboardingTitle3;
  static String get onboardingSubTitle1 => S.current.onboardingSubTitle1;
  static String get onboardingSubTitle2 => S.current.onboardingSubTitle2;
  static String get skipButton => S.current.skipButton;

  // -------------------- Terms & Agreements --------------------
  static String get agreementPrefix => S.current.agreementPrefix;
  static String get termsIntro => S.current.termsIntro;
  static String get terms => S.current.terms;
  static String get termsAndConditions => S.current.termsAndConditions;
  static String get and => S.current.and;
  static String get privacyPolicy => S.current.privacyPolicy;

  // -------------------- Login Screen --------------------
  static String get loginSuccessTitle => S.current.loginSuccessTitle;
  static String get loginSuccessMessage => S.current.loginSuccessMessage;
  static String get loginFailedTitle => S.current.loginFailedTitle;
  static String get orSignInWith => S.current.orSignInWith;
  static String get noAccountYet => S.current.noAccountYet;
  static String get createOne => S.current.createOne;
  static String get loginNoResponseMessage => S.current.loginNoResponseMessage;
  static String get loginFailedMessage => S.current.loginFailedMessage;
  static String get loginErrorMessagePrefix =>
      S.current.loginErrorMessagePrefix;
  static String get facebook => S.current.facebook;
  static String get google => S.current.google;

  // -------------------- Login Form --------------------
  static String get emailTitle => S.current.emailTitle;
  static String get emailHint => S.current.emailHint;
  static String get passwordTitle => S.current.passwordTitle;
  static String get passwordHint => S.current.passwordHint;
  static String get forgotPassword => S.current.forgotPassword;
  static String get loginButton => S.current.loginButton;
  static String get loginLoadingButton => S.current.loginLoadingButton;

  // -------------------- Login Header --------------------
  static String get loginWelcomeBack => S.current.loginWelcomeBack;
  static String get loginTitle => S.current.loginTitle;

  // -------------------- Signup --------------------
  static String get signupFailed => S.current.signupFailed;

  // -------------------- Signup Form --------------------
  static String get nameFieldTitle => S.current.nameFieldTitle;
  static String get nameFieldHint => S.current.nameFieldHint;
  static String get emailFieldTitle => S.current.emailFieldTitle;
  static String get emailFieldHint => S.current.emailFieldHint;
  static String get phoneFieldTitle => S.current.phoneFieldTitle;
  static String get phoneFieldHint => S.current.phoneFieldHint;
  static String get confirmPasswordTitle => S.current.confirmPasswordTitle;
  static String get confirmPasswordHint => S.current.confirmPasswordHint;
  static String get confirmPasswordEmptyError =>
      S.current.confirmPasswordEmptyError;
  static String get passwordsNotMatch => S.current.passwordsNotMatch;

  // -------------------- Signup Validation --------------------
  static String get passwordMismatch => S.current.passwordMismatch;
  static String get passwordWeak => S.current.passwordWeak;
  static String get termsNotAccepted => S.current.termsNotAccepted;
  static String get noServerResponse => S.current.noServerResponse;
  static String get unexpectedResponse => S.current.unexpectedResponse;
  static String get validationFailed => S.current.validationFailed;
  static String get networkError => S.current.networkError;

  // -------------------- Password Validation --------------------
  static String get passwordMinLength => S.current.passwordMinLength;
  static String get passwordHasNumber => S.current.passwordHasNumber;
  static String get passwordHasUpper => S.current.passwordHasUpper;
  static String get passwordHasLower => S.current.passwordHasLower;
  static String get passwordHasSpecial => S.current.passwordHasSpecial;

  // -------------------- Password Strength Labels --------------------
  static String get weakPassword => S.current.weakPassword;
  static String get normalPassword => S.current.normalPassword;
  static String get strongPassword => S.current.strongPassword;

  // -------------------- Auth Screens --------------------
  static String get createAccountTitle => S.current.createAccountTitle;
  static String get alreadyHaveAccount => S.current.alreadyHaveAccount;
  static String get next => S.current.next;
  static String get back => S.current.back;
  static String get letsStart => S.current.letsStart;
  static String get finish => S.current.finish;

  // -------------------- Pet Profile --------------------
  static String get createPetProfileTitle => S.current.createPetProfileTitle;
  static String get addAnotherPetTitle => S.current.addAnotherPetTitle;
  static String get addAnotherPet => S.current.addAnotherPet;
  static String get createProfile => S.current.createProfile;
  static String get creatingProfileShimmer => S.current.creatingProfileShimmer;
  static String get welcomeMessage => S.current.welcomeMessage;
  static String get welcomeDescription => S.current.welcomeDescription;
  static String get loginButtonText => S.current.loginButtonText;

  // -------------------- Pet Breed & Type --------------------
  static String get petBreedLabel => S.current.petBreedLabel;
  static String get choosePetBreed => S.current.choosePetBreed;
  static String get enterBreedHint => S.current.enterBreedHint;
  static String get petTypeHint => S.current.petTypeHint;
  static String get petTypeTitle => S.current.petTypeTitle;
  static String get petCharacteristicTitle => S.current.petCharacteristicTitle;
  static String get petCharacteristicHint => S.current.petCharacteristicHint;

  // -------------------- Image Upload Section --------------------
  static String get editImageTooltip => S.current.editImageTooltip;
  static String get changePetImageText => S.current.changePetImageText;
  static String get deleteImageTooltip => S.current.deleteImageTooltip;
  static String get deleteText => S.current.deleteText;

  // -------------------- Pet Details Form --------------------
  static String get petNameLabel => S.current.petNameLabel;
  static String get petNameHint => S.current.petNameHint;
  static String get intactOption => S.current.intactOption;
  static String get neuteredOption => S.current.neuteredOption;
  static String get maleOption => S.current.maleOption;
  static String get femaleOption => S.current.femaleOption;
  static String get genderLabel => S.current.genderLabel;
  static String get petGenderHint => S.current.petGenderHint;
  static String get neuterStatusHint => S.current.neuterStatusHint;
  static String get medicalConditionQuestion =>
      S.current.medicalConditionQuestion;
  static String get birthdayLabel => S.current.birthdayLabel;
  static String get birthdayHintText => S.current.birthdayHintText;
  static String get colorLabel => S.current.colorLabel;
  static String get weightLabel => S.current.weightLabel;
  static String get heightLabel => S.current.heightLabel;
  static String get enterPetHeightHint => S.current.enterPetHeightHint;
  static String get enterPetWeightHint => S.current.enterPetWeightHint;

  // -------------------- Medical Info --------------------
  static String get medicalConditionLabel => S.current.medicalConditionLabel;
  static String get medicalConditionHint => S.current.medicalConditionHint;

  // -------------------- Image & Profile States --------------------
  static String get imageSelectionFailedTitle =>
      S.current.imageSelectionFailedTitle;
  static String get imageUploadFailedTitle => S.current.imageUploadFailedTitle;
  static String get profileCreationFailedTitle =>
      S.current.profileCreationFailedTitle;
  static String get validationErrorTitle => S.current.validationErrorTitle;
  static String get imageUploadedTitle => S.current.imageUploadedTitle;
  static String get imageUploadedSuccessMsg =>
      S.current.imageUploadedSuccessMsg;
  static String get profileCreatedTitle => S.current.profileCreatedTitle;
  static String get profileCreatedMsg => S.current.profileCreatedMsg;

  // -------------------- Image Picker Options --------------------
  static String get selectImageTitle => S.current.selectImageTitle;
  static String get takePhotoTitle => S.current.takePhotoTitle;
  static String get takePhotoSubtitle => S.current.takePhotoSubtitle;
  static String get chooseFromGalleryTitle => S.current.chooseFromGalleryTitle;
  static String get chooseFromGallerySubtitle =>
      S.current.chooseFromGallerySubtitle;
  static String get uploadYourPetImage => S.current.uploadYourPetImage;

  // -------------------- Forgot Password --------------------
  static String get forgotPasswordTitle => S.current.forgotPasswordTitle;
  static String get enterEmailToReset => S.current.enterEmailToReset;
  static String get resetUsingMobile => S.current.resetUsingMobile;
  static String get forgotPasswordPhoneSubtitle =>
      S.current.forgotPasswordPhoneSubtitle;
  static String get continueButton => S.current.continueButton;

  // -------------------- OTP Verification --------------------
  static String get otpVerificationTitle => S.current.otpVerificationTitle;
  static String get didNotReceiveOtp => S.current.didNotReceiveOtp;
  static String get otpHintMessage => S.current.otpHintMessage;
  static String get timeExpiredMessage => S.current.timeExpiredMessage;
  static String get otpSubmitButton => S.current.otpSubmitButton;
  static String get incompleteOtpMessage => S.current.incompleteOtpMessage;

  // -------------------- Reset Password --------------------
  static String get resetUsingEmail => S.current.resetUsingEmail;
  static String get enterNewPassword => S.current.enterNewPassword;
  static String get passwordUpdated => S.current.passwordUpdated;
  static String get passwordUpdatedDesc => S.current.passwordUpdatedDesc;
  static String get resetPassword => S.current.resetPassword;
  static String get retypePassword => S.current.retypePassword;
  static String get login => S.current.login;

  // -------------------- Common Messages --------------------
  static String get networkErrorPrefix => S.current.networkErrorPrefix;
  static String get allFieldsRequired => S.current.allFieldsRequired;
  static String get search => S.current.search;

  // -------------------- OTP & Email Validation --------------------
  static String get emailRequired => S.current.emailRequired;
  static String get otpSent => S.current.otpSent;
  static String get otpSendFailed => S.current.otpSendFailed;
  static String get emailAndOtpRequired => S.current.emailAndOtpRequired;
  static String get otpRequired => S.current.otpRequired;
  static String get otpVerified => S.current.otpVerified;
  static String get otpFailed => S.current.otpFailed;
  static String get passwordResetSuccess => S.current.passwordResetSuccess;
  static String get passwordResetFailed => S.current.passwordResetFailed;

  // -------------------- Create Pet Profile Cubit Messages --------------------
  static String get cameraPermission => S.current.cameraPermission;
  static String get weightTooHigh => S.current.weightTooHigh;
  static String get weightTooLow => S.current.weightTooLow;
  static String get heightTooHigh => S.current.HeightTooHigh;
  static String get heightTooLow => S.current.HeightTooLow;
  static String get selectGender => S.current.selectGender;
  static String get selectNeuterStatus => S.current.selectNeuterStatus;
  static String get fillAllFields => S.current.fillAllFields;
  static String get authErrorTitle => S.current.authErrorTitle;
  static String get authErrorMessage => S.current.authErrorMessage;
  static String get authTokenErrorMessage => S.current.authTokenErrorMessage;
  static String get successTitle => S.current.successTitle;
  static String get successMessage => S.current.successMessage;
  static String get networkErrorTitle => S.current.networkErrorTitle;
  static String get networkErrorMessage => S.current.networkErrorMessage;
  static String get unknownError => S.current.unknownError;

  // -------------------- Pet Colors --------------------
  static String get black => S.current.black;
  static String get brown => S.current.brown;
  static String get white => S.current.white;
  static String get gray => S.current.gray;
  static String get golden => S.current.golden;

  // -------------------- Pet Types --------------------
  static String get cat => S.current.cat;
  static String get dog => S.current.dog;
}
