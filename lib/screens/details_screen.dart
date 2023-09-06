import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class DetailScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final imagePath;

  const DetailScreen(this.imagePath, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///For image and back button and favorate button
            Stack(
              children: [
                ///Container for place quick info
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5 + 16,
                    bottom: 20,
                    right: 32,
                    left: 32,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pakistan",
                          style: GoogleFonts.poppins(
                            color: AppColors.darkTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        ///Container for data
                        Container(
                          margin: const EdgeInsets.only(right: 80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: AppColors.lightGreenColor,
                                    size: 22,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "4.0",
                                    style: GoogleFonts.poppins(
                                      color: AppColors.darkTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.alarm,
                                    color: AppColors.lightTextColor,
                                    size: 22,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "10 Hours",
                                    style: GoogleFonts.poppins(
                                      color: AppColors.veryLightTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: AppColors.lightTextColor,
                                    size: 22,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "125 Km",
                                    style: GoogleFonts.poppins(
                                      color: AppColors.veryLightTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                ///Hero Image Container
                Hero(
                  tag: widget.imagePath,
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60),
                      ),
                      child: SvgPicture.asset(
                        widget.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                ///Back button
                Positioned(
                  top: 40,
                  left: 24,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                ///Favorate icon
                Positioned(
                  right: 34,
                  bottom: 80,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade100, blurRadius: 8)
                        ]),
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.lightRedColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),

            ///Spacing
            const SizedBox(
              height: 24,
            ),

            ///About text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "About",
                style: GoogleFonts.poppins(
                    color: AppColors.lightGreenColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            ///About detail text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: AppColors.veryLightTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const Spacer(),

            ///Container for contacting button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                  color: Colors.white),
              child: Row(
                children: [
                  ///fees
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Travelling Expense",
                        style: GoogleFonts.poppins(
                          color: AppColors.veryLightTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "\$1000",
                        style: GoogleFonts.poppins(
                            color: AppColors.darkTextColor,
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),

                  const Spacer(),

                  ///Button
                  ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                        ),
                      ),
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.lightGreenColor),
                    ),
                    child: Text(
                      "Contact",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
