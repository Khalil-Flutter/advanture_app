import 'package:advanture_app/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 64,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Container for header
            SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  ///Container for welcoming text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, Khalil!",
                        style: GoogleFonts.poppins(
                            color: AppColors.veryLightTextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                      Text(
                        "where\nare you going\n on vacations?",
                        style: GoogleFonts.playfairDisplay(
                            color: AppColors.darkTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 36),
                      )
                    ],
                  ),

                  ///Profile Picture
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 30,
                      child: ClipOval(
                        child: Image.network("https://instagram.fkhi11-2.fna.fbcdn.net/v/t51.2885-19/349551797_585882216945796_7697025146854591604_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fkhi11-2.fna.fbcdn.net&_nc_cat=104&_nc_ohc=-xKEy9JU9N0AX-V5sv6&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfBm8gkEvH17AtcsC0dCHZ9RRSO8eztL5IuRVo44Oh3OUg&oe=64FD665E&_nc_sid=8b3546"),
                      ),
                    ),
                  )
                ],
              ),
            ),

            ///vertical spacing
            const SizedBox(
              height: 16,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top",
                  style: GoogleFonts.poppins(
                    color: AppColors.lightGreenColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "For you",
                  style: GoogleFonts.poppins(
                    color: AppColors.veryLightTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Hidden Gems",
                  style: GoogleFonts.poppins(
                    color: AppColors.veryLightTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: AppColors.veryLightTextColor,
                  ),
                  onPressed: () {},
                )
              ],
            ),

            ///vertical spacing
            const SizedBox(
              height: 16,
            ),

            ///Container for places list
            Expanded(
              child: LayoutGrid(
                columnGap: 12,
                rowGap: 12,
                columnSizes: const [
                  FlexibleTrackSize(1),
                  FlexibleTrackSize(1),

                  ///means 50% to both columns
                ],
                rowSizes: const [
                  ///three rows
                  FlexibleTrackSize(1),
                  FlexibleTrackSize(0.6),
                  FlexibleTrackSize(1),

                  ///means first and third row will share same space but second will take 1/6 height compare to others
                ],
                children: [
                  ///Lets make container for each elements
                  getPlaceWidget("assets/5.svg").withGridPlacement(
                      rowStart: 0, columnStart: 0, rowSpan: 2,),
                  getPlaceWidget("assets/3.svg").withGridPlacement(
                      rowStart: 2, columnStart: 0, rowSpan: 1,),
                  getPlaceWidget("assets/2.svg").withGridPlacement(
                      rowStart: 0, columnStart: 1, rowSpan: 1,),
                  getPlaceWidget("assets/4.svg").withGridPlacement(
                      rowStart: 1, columnStart: 1, rowSpan: 2,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getPlaceWidget(imagePath) {
    return GestureDetector(
      onTap: () {
        ///For going on next screen
        Navigator.push(
          context,
          MaterialPageRoute(
            ///Send image path as we have setted it as tag of hero
            builder: (context) => DetailScreen(imagePath),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.lightRedColor),
        child: Stack(
          children: [
            Hero(
              ///For hero animation on route transition
              tag: imagePath,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SvgPicture.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            ///For rating and title
            Positioned(
              top: 16,
              left: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pakistan",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  Chip(
                    backgroundColor: Colors.white,
                    label: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.lightGreenColor,
                          size: 15,
                        ),

                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "4.0",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.veryLightTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
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
