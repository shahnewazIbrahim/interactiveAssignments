import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'forecast_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E2251), Color(0xFF9330B0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 10),

              // ☁️ Weather Icon
              Image.asset(
                'assets/sunny.png',
                height: 380,
              ),

              const SizedBox(height: 32),

              // 🌤️ Titles
              Column(
                children: [
                  Text(
                    "Weather",
                    style: GoogleFonts.poppins(
                      fontSize: 64,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "ForeCasts",
                    style: GoogleFonts.poppins(
                      fontSize: 64,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE1B646),
                    ),
                  ),
                ],
              ),

              // const Spacer(),
              const SizedBox(height: 32),
              // 🚀 Get Start Button
              SizedBox(
                width: 280,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE1B646),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ForecastScreen()),
                    );
                  },
                  child: Text(
                    "Get Start",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: const Color(0xFF1E2251),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Spacer(),

            ],
          ),
        ),
      ),
    );
  }
}
