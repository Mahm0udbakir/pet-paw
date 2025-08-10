// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Ready, Set, Woof!`
  String get getStartedTitle {
    return Intl.message(
      'Ready, Set, Woof!',
      name: 'getStartedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Everything your pet needs, one tap away`
  String get getStartedSubtitle {
    return Intl.message(
      'Everything your pet needs, one tap away',
      name: 'getStartedSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Select your language`
  String get selectYourLanguage {
    return Intl.message(
      'Select your language',
      name: 'selectYourLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Continue as a guest`
  String get continueAsGuest {
    return Intl.message(
      'Continue as a guest',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Expert Care for Your Pet`
  String get onboardingTitle1 {
    return Intl.message(
      'Expert Care for Your Pet',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `All Essentials in One Place`
  String get onboardingTitle2 {
    return Intl.message(
      'All Essentials in One Place',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to PetPaw!`
  String get onboardingTitle3 {
    return Intl.message(
      'Welcome to PetPaw!',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Keep your furry friends healthy with access to trusted veterinarians anytime, anywhere.`
  String get onboardingSubTitle1 {
    return Intl.message(
      'Keep your furry friends healthy with access to trusted veterinarians anytime, anywhere.',
      name: 'onboardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `From toys to treats, find everything your pet needs delivered right to your door.`
  String get onboardingSubTitle2 {
    return Intl.message(
      'From toys to treats, find everything your pet needs delivered right to your door.',
      name: 'onboardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipButton {
    return Intl.message('Skip', name: 'skipButton', desc: '', args: []);
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Let's Start!`
  String get letsStart {
    return Intl.message('Let\'s Start!', name: 'letsStart', desc: '', args: []);
  }

  /// `By using our services you are agreeing to `
  String get agreementPrefix {
    return Intl.message(
      'By using our services you are agreeing to ',
      name: 'agreementPrefix',
      desc: '',
      args: [],
    );
  }

  /// `By creating your account you agree to our `
  String get termsIntro {
    return Intl.message(
      'By creating your account you agree to our ',
      name: 'termsIntro',
      desc: '',
      args: [],
    );
  }

  /// `Terms`
  String get terms {
    return Intl.message('Terms', name: 'terms', desc: '', args: []);
  }

  /// `Terms & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get and {
    return Intl.message(' and ', name: 'and', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Login Successful`
  String get loginSuccessTitle {
    return Intl.message(
      'Login Successful',
      name: 'loginSuccessTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get loginSuccessMessage {
    return Intl.message(
      'Welcome back',
      name: 'loginSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed`
  String get loginFailedTitle {
    return Intl.message(
      'Login Failed',
      name: 'loginFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Or Sign in with`
  String get orSignInWith {
    return Intl.message(
      'Or Sign in with',
      name: 'orSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `No account yet? `
  String get noAccountYet {
    return Intl.message(
      'No account yet? ',
      name: 'noAccountYet',
      desc: '',
      args: [],
    );
  }

  /// `Create one`
  String get createOne {
    return Intl.message('Create one', name: 'createOne', desc: '', args: []);
  }

  /// `No response from server.`
  String get loginNoResponseMessage {
    return Intl.message(
      'No response from server.',
      name: 'loginNoResponseMessage',
      desc: '',
      args: [],
    );
  }

  /// `Login failed`
  String get loginFailedMessage {
    return Intl.message(
      'Login failed',
      name: 'loginFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong: `
  String get loginErrorMessagePrefix {
    return Intl.message(
      'Something went wrong: ',
      name: 'loginErrorMessagePrefix',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailTitle {
    return Intl.message('Email', name: 'emailTitle', desc: '', args: []);
  }

  /// `Enter your email`
  String get emailHint {
    return Intl.message(
      'Enter your email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordTitle {
    return Intl.message('Password', name: 'passwordTitle', desc: '', args: []);
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get loginButton {
    return Intl.message('Sign in', name: 'loginButton', desc: '', args: []);
  }

  /// `Signing in...`
  String get loginLoadingButton {
    return Intl.message(
      'Signing in...',
      name: 'loginLoadingButton',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back to`
  String get loginWelcomeBack {
    return Intl.message(
      'Welcome Back to',
      name: 'loginWelcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `sign in to your account`
  String get loginTitle {
    return Intl.message(
      'sign in to your account',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Signup Failed`
  String get signupFailed {
    return Intl.message(
      'Signup Failed',
      name: 'signupFailed',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nameFieldTitle {
    return Intl.message('Name', name: 'nameFieldTitle', desc: '', args: []);
  }

  /// `Enter your name`
  String get nameFieldHint {
    return Intl.message(
      'Enter your name',
      name: 'nameFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailFieldTitle {
    return Intl.message('Email', name: 'emailFieldTitle', desc: '', args: []);
  }

  /// `Enter your email`
  String get emailFieldHint {
    return Intl.message(
      'Enter your email',
      name: 'emailFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneFieldTitle {
    return Intl.message(
      'Phone Number',
      name: 'phoneFieldTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get phoneFieldHint {
    return Intl.message(
      'Enter your phone number',
      name: 'phoneFieldHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your Password`
  String get confirmPasswordTitle {
    return Intl.message(
      'Confirm your Password',
      name: 'confirmPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Retype your password`
  String get confirmPasswordHint {
    return Intl.message(
      'Retype your password',
      name: 'confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get confirmPasswordEmptyError {
    return Intl.message(
      'Please confirm your password',
      name: 'confirmPasswordEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match.`
  String get passwordMismatch {
    return Intl.message(
      'Passwords do not match.',
      name: 'passwordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Password does not meet the strength requirements.`
  String get passwordWeak {
    return Intl.message(
      'Password does not meet the strength requirements.',
      name: 'passwordWeak',
      desc: '',
      args: [],
    );
  }

  /// `Please accept the terms and conditions.`
  String get termsNotAccepted {
    return Intl.message(
      'Please accept the terms and conditions.',
      name: 'termsNotAccepted',
      desc: '',
      args: [],
    );
  }

  /// `No response from server.`
  String get noServerResponse {
    return Intl.message(
      'No response from server.',
      name: 'noServerResponse',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected response structure.`
  String get unexpectedResponse {
    return Intl.message(
      'Unexpected response structure.',
      name: 'unexpectedResponse',
      desc: '',
      args: [],
    );
  }

  /// `Validation failed.`
  String get validationFailed {
    return Intl.message(
      'Validation failed.',
      name: 'validationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please check your internet connection.`
  String get networkError {
    return Intl.message(
      'Something went wrong. Please check your internet connection.',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Must be at 8-20 characters.`
  String get passwordMinLength {
    return Intl.message(
      'Must be at 8-20 characters.',
      name: 'passwordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Must include at least 1 number.`
  String get passwordHasNumber {
    return Intl.message(
      'Must include at least 1 number.',
      name: 'passwordHasNumber',
      desc: '',
      args: [],
    );
  }

  /// `Must contain at least 1 uppercase letter.`
  String get passwordHasUpper {
    return Intl.message(
      'Must contain at least 1 uppercase letter.',
      name: 'passwordHasUpper',
      desc: '',
      args: [],
    );
  }

  /// `Must contain at least 1 lowercase letter.`
  String get passwordHasLower {
    return Intl.message(
      'Must contain at least 1 lowercase letter.',
      name: 'passwordHasLower',
      desc: '',
      args: [],
    );
  }

  /// `Must include at least 1 special character (e.g.!,@,#).`
  String get passwordHasSpecial {
    return Intl.message(
      'Must include at least 1 special character (e.g.!,@,#).',
      name: 'passwordHasSpecial',
      desc: '',
      args: [],
    );
  }

  /// `Weak Password!`
  String get weakPassword {
    return Intl.message(
      'Weak Password!',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Normal Password!`
  String get normalPassword {
    return Intl.message(
      'Normal Password!',
      name: 'normalPassword',
      desc: '',
      args: [],
    );
  }

  /// `Strong Password!`
  String get strongPassword {
    return Intl.message(
      'Strong Password!',
      name: 'strongPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create new account`
  String get createAccountTitle {
    return Intl.message(
      'Create new account',
      name: 'createAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Create Pet Profile`
  String get createPetProfileTitle {
    return Intl.message(
      'Create Pet Profile',
      name: 'createPetProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add another pet`
  String get addAnotherPetTitle {
    return Intl.message(
      'Add another pet',
      name: 'addAnotherPetTitle',
      desc: '',
      args: [],
    );
  }

  /// `add another pet`
  String get addAnotherPet {
    return Intl.message(
      'add another pet',
      name: 'addAnotherPet',
      desc: '',
      args: [],
    );
  }

  /// `Create Profile`
  String get createProfile {
    return Intl.message(
      'Create Profile',
      name: 'createProfile',
      desc: '',
      args: [],
    );
  }

  /// `Creating Profile...`
  String get creatingProfileShimmer {
    return Intl.message(
      'Creating Profile...',
      name: 'creatingProfileShimmer',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to PetPaw`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to PetPaw',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `You are one of our family!`
  String get welcomeDescription {
    return Intl.message(
      'You are one of our family!',
      name: 'welcomeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButtonText {
    return Intl.message('Login', name: 'loginButtonText', desc: '', args: []);
  }

  /// `Pet Breed`
  String get petBreedLabel {
    return Intl.message('Pet Breed', name: 'petBreedLabel', desc: '', args: []);
  }

  /// `Choose your pet breed`
  String get choosePetBreed {
    return Intl.message(
      'Choose your pet breed',
      name: 'choosePetBreed',
      desc: '',
      args: [],
    );
  }

  /// `Enter breed`
  String get enterBreedHint {
    return Intl.message(
      'Enter breed',
      name: 'enterBreedHint',
      desc: '',
      args: [],
    );
  }

  /// `Choose your pet`
  String get petTypeHint {
    return Intl.message(
      'Choose your pet',
      name: 'petTypeHint',
      desc: '',
      args: [],
    );
  }

  /// `Pet Type`
  String get petTypeTitle {
    return Intl.message('Pet Type', name: 'petTypeTitle', desc: '', args: []);
  }

  /// `Edit image`
  String get editImageTooltip {
    return Intl.message(
      'Edit image',
      name: 'editImageTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Change the pet image`
  String get changePetImageText {
    return Intl.message(
      'Change the pet image',
      name: 'changePetImageText',
      desc: '',
      args: [],
    );
  }

  /// `Delete image`
  String get deleteImageTooltip {
    return Intl.message(
      'Delete image',
      name: 'deleteImageTooltip',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deleteText {
    return Intl.message('Delete', name: 'deleteText', desc: '', args: []);
  }

  /// `Pet's name`
  String get petNameLabel {
    return Intl.message(
      'Pet\'s name',
      name: 'petNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your pet's name`
  String get petNameHint {
    return Intl.message(
      'Enter your pet\'s name',
      name: 'petNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Intact`
  String get intactOption {
    return Intl.message('Intact', name: 'intactOption', desc: '', args: []);
  }

  /// `Neutered`
  String get neuteredOption {
    return Intl.message('Neutered', name: 'neuteredOption', desc: '', args: []);
  }

  /// `Male`
  String get maleOption {
    return Intl.message('Male', name: 'maleOption', desc: '', args: []);
  }

  /// `Female`
  String get femaleOption {
    return Intl.message('Female', name: 'femaleOption', desc: '', args: []);
  }

  /// `Gender`
  String get genderLabel {
    return Intl.message('Gender', name: 'genderLabel', desc: '', args: []);
  }

  /// `Does your pet have any medical conditions?`
  String get medicalConditionQuestion {
    return Intl.message(
      'Does your pet have any medical conditions?',
      name: 'medicalConditionQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get birthdayLabel {
    return Intl.message('Birthday', name: 'birthdayLabel', desc: '', args: []);
  }

  /// `yyyy-MM-dd`
  String get birthdayHintText {
    return Intl.message(
      'yyyy-MM-dd',
      name: 'birthdayHintText',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get colorLabel {
    return Intl.message('Color', name: 'colorLabel', desc: '', args: []);
  }

  /// `Weight (Kg.)`
  String get weightLabel {
    return Intl.message(
      'Weight (Kg.)',
      name: 'weightLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your pet's weight (kg.)`
  String get enterPetWeightHint {
    return Intl.message(
      'Enter your pet\'s weight (kg.)',
      name: 'enterPetWeightHint',
      desc: '',
      args: [],
    );
  }

  /// `Medical conditions/Special needs (optional)`
  String get medicalConditionLabel {
    return Intl.message(
      'Medical conditions/Special needs (optional)',
      name: 'medicalConditionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter any medical conditions or special needs`
  String get medicalConditionHint {
    return Intl.message(
      'Enter any medical conditions or special needs',
      name: 'medicalConditionHint',
      desc: '',
      args: [],
    );
  }

  /// `Image Selection Failed`
  String get imageSelectionFailedTitle {
    return Intl.message(
      'Image Selection Failed',
      name: 'imageSelectionFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Image Upload Failed`
  String get imageUploadFailedTitle {
    return Intl.message(
      'Image Upload Failed',
      name: 'imageUploadFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Profile Creation Failed`
  String get profileCreationFailedTitle {
    return Intl.message(
      'Profile Creation Failed',
      name: 'profileCreationFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Validation Error`
  String get validationErrorTitle {
    return Intl.message(
      'Validation Error',
      name: 'validationErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Image Uploaded`
  String get imageUploadedTitle {
    return Intl.message(
      'Image Uploaded',
      name: 'imageUploadedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your pet image was uploaded successfully.`
  String get imageUploadedSuccessMsg {
    return Intl.message(
      'Your pet image was uploaded successfully.',
      name: 'imageUploadedSuccessMsg',
      desc: '',
      args: [],
    );
  }

  /// `Profile Created`
  String get profileCreatedTitle {
    return Intl.message(
      'Profile Created',
      name: 'profileCreatedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your pet profile has been created.`
  String get profileCreatedMsg {
    return Intl.message(
      'Your pet profile has been created.',
      name: 'profileCreatedMsg',
      desc: '',
      args: [],
    );
  }

  /// `Select Image`
  String get selectImageTitle {
    return Intl.message(
      'Select Image',
      name: 'selectImageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get takePhotoTitle {
    return Intl.message(
      'Take Photo',
      name: 'takePhotoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Use your camera to take a new photo`
  String get takePhotoSubtitle {
    return Intl.message(
      'Use your camera to take a new photo',
      name: 'takePhotoSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose from Gallery`
  String get chooseFromGalleryTitle {
    return Intl.message(
      'Choose from Gallery',
      name: 'chooseFromGalleryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select an existing photo from your gallery`
  String get chooseFromGallerySubtitle {
    return Intl.message(
      'Select an existing photo from your gallery',
      name: 'chooseFromGallerySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload your pet image`
  String get uploadYourPetImage {
    return Intl.message(
      'Upload your pet image',
      name: 'uploadYourPetImage',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address and we will send you an OTP to reset password.`
  String get enterEmailToReset {
    return Intl.message(
      'Enter your email address and we will send you an OTP to reset password.',
      name: 'enterEmailToReset',
      desc: '',
      args: [],
    );
  }

  /// `Reset using mobile number`
  String get resetUsingMobile {
    return Intl.message(
      'Reset using mobile number',
      name: 'resetUsingMobile',
      desc: '',
      args: [],
    );
  }

  /// `Enter your mobile number and we will send you an OTP to reset password.`
  String get forgotPasswordPhoneSubtitle {
    return Intl.message(
      'Enter your mobile number and we will send you an OTP to reset password.',
      name: 'forgotPasswordPhoneSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `OTP verification`
  String get otpVerificationTitle {
    return Intl.message(
      'OTP verification',
      name: 'otpVerificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t receive the OTP?`
  String get didNotReceiveOtp {
    return Intl.message(
      'Didn’t receive the OTP?',
      name: 'didNotReceiveOtp',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code we sent to your mobile number/email address.`
  String get otpHintMessage {
    return Intl.message(
      'Enter the code we sent to your mobile number/email address.',
      name: 'otpHintMessage',
      desc: '',
      args: [],
    );
  }

  /// `Time expired. Please resend OTP.`
  String get timeExpiredMessage {
    return Intl.message(
      'Time expired. Please resend OTP.',
      name: 'timeExpiredMessage',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get otpSubmitButton {
    return Intl.message('Submit', name: 'otpSubmitButton', desc: '', args: []);
  }

  /// `Please enter all 6 digits`
  String get incompleteOtpMessage {
    return Intl.message(
      'Please enter all 6 digits',
      name: 'incompleteOtpMessage',
      desc: '',
      args: [],
    );
  }

  /// `Reset using email`
  String get resetUsingEmail {
    return Intl.message(
      'Reset using email',
      name: 'resetUsingEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password.`
  String get enterNewPassword {
    return Intl.message(
      'Enter your new password.',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password Updated`
  String get passwordUpdated {
    return Intl.message(
      'Password Updated',
      name: 'passwordUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been updated`
  String get passwordUpdatedDesc {
    return Intl.message(
      'Your password has been updated',
      name: 'passwordUpdatedDesc',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Retype your password`
  String get retypePassword {
    return Intl.message(
      'Retype your password',
      name: 'retypePassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Error: `
  String get networkErrorPrefix {
    return Intl.message(
      'Error: ',
      name: 'networkErrorPrefix',
      desc: '',
      args: [],
    );
  }

  /// `All fields are required.`
  String get allFieldsRequired {
    return Intl.message(
      'All fields are required.',
      name: 'allFieldsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email is required.`
  String get emailRequired {
    return Intl.message(
      'Email is required.',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `OTP sent to your email.`
  String get otpSent {
    return Intl.message(
      'OTP sent to your email.',
      name: 'otpSent',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send OTP.`
  String get otpSendFailed {
    return Intl.message(
      'Failed to send OTP.',
      name: 'otpSendFailed',
      desc: '',
      args: [],
    );
  }

  /// `Email and OTP are required.`
  String get emailAndOtpRequired {
    return Intl.message(
      'Email and OTP are required.',
      name: 'emailAndOtpRequired',
      desc: '',
      args: [],
    );
  }

  /// `OTP is required.`
  String get otpRequired {
    return Intl.message(
      'OTP is required.',
      name: 'otpRequired',
      desc: '',
      args: [],
    );
  }

  /// `OTP verified successfully.`
  String get otpVerified {
    return Intl.message(
      'OTP verified successfully.',
      name: 'otpVerified',
      desc: '',
      args: [],
    );
  }

  /// `OTP verification failed.`
  String get otpFailed {
    return Intl.message(
      'OTP verification failed.',
      name: 'otpFailed',
      desc: '',
      args: [],
    );
  }

  /// `Password reset successfully.`
  String get passwordResetSuccess {
    return Intl.message(
      'Password reset successfully.',
      name: 'passwordResetSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Password reset failed.`
  String get passwordResetFailed {
    return Intl.message(
      'Password reset failed.',
      name: 'passwordResetFailed',
      desc: '',
      args: [],
    );
  }

  /// `Camera permission is required.`
  String get cameraPermission {
    return Intl.message(
      'Camera permission is required.',
      name: 'cameraPermission',
      desc: '',
      args: [],
    );
  }

  /// `the weight cannot be more than`
  String get weightTooHigh {
    return Intl.message(
      'the weight cannot be more than',
      name: 'weightTooHigh',
      desc: '',
      args: [],
    );
  }

  /// `the weight cannot be less than`
  String get weightTooLow {
    return Intl.message(
      'the weight cannot be less than',
      name: 'weightTooLow',
      desc: '',
      args: [],
    );
  }

  /// `Please select gender.`
  String get selectGender {
    return Intl.message(
      'Please select gender.',
      name: 'selectGender',
      desc: '',
      args: [],
    );
  }

  /// `Please select neuter status.`
  String get selectNeuterStatus {
    return Intl.message(
      'Please select neuter status.',
      name: 'selectNeuterStatus',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all required fields correctly.`
  String get fillAllFields {
    return Intl.message(
      'Please fill all required fields correctly.',
      name: 'fillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Authentication Error`
  String get authErrorTitle {
    return Intl.message(
      'Authentication Error',
      name: 'authErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Token is missing. Please login again.`
  String get authErrorMessage {
    return Intl.message(
      'Token is missing. Please login again.',
      name: 'authErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Authentication token not found.`
  String get authTokenErrorMessage {
    return Intl.message(
      'Authentication token not found.',
      name: 'authTokenErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get successTitle {
    return Intl.message('Success', name: 'successTitle', desc: '', args: []);
  }

  /// `Pet profile created successfully.`
  String get successMessage {
    return Intl.message(
      'Pet profile created successfully.',
      name: 'successMessage',
      desc: '',
      args: [],
    );
  }

  /// `Network Error`
  String get networkErrorTitle {
    return Intl.message(
      'Network Error',
      name: 'networkErrorTitle',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again.`
  String get networkErrorMessage {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'networkErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong.`
  String get unknownError {
    return Intl.message(
      'Something went wrong.',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Black`
  String get black {
    return Intl.message('Black', name: 'black', desc: '', args: []);
  }

  /// `Brown`
  String get brown {
    return Intl.message('Brown', name: 'brown', desc: '', args: []);
  }

  /// `White`
  String get white {
    return Intl.message('White', name: 'white', desc: '', args: []);
  }

  /// `Gray`
  String get gray {
    return Intl.message('Gray', name: 'gray', desc: '', args: []);
  }

  /// `Golden`
  String get golden {
    return Intl.message('Golden', name: 'golden', desc: '', args: []);
  }

  /// `Cat`
  String get cat {
    return Intl.message('Cat', name: 'cat', desc: '', args: []);
  }

  /// `Dog`
  String get dog {
    return Intl.message('Dog', name: 'dog', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
