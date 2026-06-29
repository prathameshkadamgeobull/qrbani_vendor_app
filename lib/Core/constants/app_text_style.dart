import 'package:flutter/material.dart';
import 'app_font_size.dart';

class AppTextStyles {
  AppTextStyles._();

  //---------------- HEADINGS ----------------//

  static final TextStyle appBarTitle = TextStyle(
    fontSize: AppFontSizes.s20,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const TextStyle screenTitle = TextStyle(
    fontSize: AppFontSizes.s18,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: AppFontSizes.s17,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  //---------------- BODY ----------------//

  static const TextStyle bodyLarge = TextStyle(
    fontSize: AppFontSizes.s16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle body = TextStyle(
    fontSize: AppFontSizes.s14,
    fontWeight: FontWeight.w400,
    color: Colors.black87,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: AppFontSizes.s13,
    fontWeight: FontWeight.w500,
    color: Color(0xff666666),
  );

  static const TextStyle caption = TextStyle(
    fontSize: AppFontSizes.s12,
    fontWeight: FontWeight.w400,
    color: Color(0xff888888),
  );

  static const TextStyle overline = TextStyle(
    fontSize: AppFontSizes.s11,
    fontWeight: FontWeight.w500,
    color: Color(0xff999999),
  );

  //---------------- BUTTON ----------------//

  static const TextStyle button = TextStyle(
    fontSize: AppFontSizes.s15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  //---------------- CARD ----------------//

  static const TextStyle cardTitle = TextStyle(
    fontSize: AppFontSizes.s14,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontSize: AppFontSizes.s13,
    fontWeight: FontWeight.w500,
    color: Color(0xff666666),
  );

  //---------------- NUMBERS ----------------//

  static const TextStyle amount = TextStyle(
    fontSize: AppFontSizes.s24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static final TextStyle metric = TextStyle(
    fontSize: AppFontSizes.s28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  //---------------- DASHBOARD ----------------//

  static final TextStyle greeting = TextStyle(
    fontSize: AppFontSizes.s17,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle vendorName = TextStyle(
    fontSize: AppFontSizes.s18,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const TextStyle summaryTitle = TextStyle(
    fontSize: AppFontSizes.s20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle hijriDate = TextStyle(
    fontSize: AppFontSizes.s16,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  static const TextStyle statTitle = TextStyle(
    fontSize: AppFontSizes.s14,
    fontWeight: FontWeight.w500,
    color: Color(0xff4A4A4A),
  );

  static const TextStyle statValue = TextStyle(
    fontSize: AppFontSizes.s28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle revenueTitle = TextStyle(
    fontSize: AppFontSizes.s14,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle revenueAmount = TextStyle(
    fontSize: AppFontSizes.s22,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle navLabel = TextStyle(
    fontSize: AppFontSizes.s12,
    fontWeight: FontWeight.w500,
  );

  // Revenue Growth %
  static const TextStyle revenueGrowth = TextStyle(
    fontSize: AppFontSizes.s15,
    fontWeight: FontWeight.w700,
    color: Color(0xff0B8A47),
  );

// Revenue Comparison
  static const TextStyle revenueCompare = TextStyle(
    fontSize: AppFontSizes.s11,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  );

  // Orders Header
  static const TextStyle orderTitle = TextStyle(
    fontSize: AppFontSizes.s18,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const TextStyle orderDate = TextStyle(
    fontSize: AppFontSizes.s14,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static const TextStyle orderTab = TextStyle(
    fontSize: AppFontSizes.s12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle orderTabSelected = TextStyle(
    fontSize: AppFontSizes.s12,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

// Order Card
  static const TextStyle orderNo = TextStyle(
    fontSize: AppFontSizes.s15,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle orderAnimal = TextStyle(
    fontSize: AppFontSizes.s14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle orderSubtitle = TextStyle(
    fontSize: AppFontSizes.s12,
    color: Colors.grey,
  );

  static const TextStyle orderCustomer = TextStyle(
    fontSize: AppFontSizes.s13,
    color: Colors.black87,
  );

  static const TextStyle orderAmount = TextStyle(
    fontSize: AppFontSizes.s16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle orderStatus = TextStyle(
    fontSize: AppFontSizes.s11,
    fontWeight: FontWeight.w600,
  );

// Expandable Card
  static const TextStyle orderSectionTitle = TextStyle(
    fontSize: AppFontSizes.s16,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const TextStyle detailTitle = TextStyle(
    fontSize: AppFontSizes.s13,
    fontWeight: FontWeight.w500,
    color: Color(0xff8A8A8A),
  );

  static const TextStyle detailValue = TextStyle(
    fontSize: AppFontSizes.s14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: AppFontSizes.s14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle cancelButton = TextStyle(
    fontSize: AppFontSizes.s14,
    fontWeight: FontWeight.w600,
    color: Colors.red,
  );
}