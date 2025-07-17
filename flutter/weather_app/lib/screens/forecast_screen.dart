import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    "North America",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    "Max: 24°   Min: 18°",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                Text(
                  "7-Days Forecasts",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),

                // 👉 Forecast Cards (horizontal)
                // IconButton(
                //   icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                //   onPressed: (){},
                // ),
                // SizedBox(
                //   height: 150,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: const [
                //       ForecastCard(day: "Mon", temp: "19°C", icon: '🌦️', width: 80,),
                //       ForecastCard(day: "Tue", temp: "18°C", icon: '🌧️', width: 80,),
                //       ForecastCard(day: "Wed", temp: "18°C", icon: '🌧️', width: 80,),
                //       ForecastCard(day: "Thu", temp: "19°C", icon: '🌦️', width: 80,),
                //     ],
                //   ),
                // ),
                // IconButton(
                //   icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                //   onPressed: (){},
                // ),


                ForecastSlider(),

                const SizedBox(height: 24),

                // 🌫️ Air Quality Section
                Container(
                  width: 352,
                  height: 174,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3E2D8F), Color(0xFF533595) , Color(0xFF9D52AC)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.my_location, size: 24, color: Colors.white),

                          SizedBox(width: 10),

                          const Text(
                            "AIR QUALITY",
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "3 - Low Health Risk",
                        style: GoogleFonts.poppins(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 28),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "See more",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 4),

                          const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.white),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // 🌅 Sunrise & UV Index
                Row(
                  children: [
                    Expanded(
                      child: InfoBox(
                        title: "SUNRISE",
                        subtitle: "5:28 AM",
                        // extra: "Sunset: 7.25PM",
                        extra: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Sunset: ", style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600

                              )
                            ),
                            Text("5:28 AM",  style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70))
                          ],
                        ),
                        icon: Image.asset(
                          'assets/sunburst.png',
                          width: 36,
                          height: 36,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: InfoBox(
                        title: "UV INDEX",
                        subtitle: "4 Moderate",
                        icon: Image.asset(
                          'assets/sunburst.png',
                          width: 36,
                          height: 36,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForecastCard extends StatelessWidget {
  final String day;
  final String temp;
  final String icon;
  final double width;

  const ForecastCard({
    super.key,
    required this.day,
    required this.temp,
    required this.icon,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF3E2D8F),
            Color(0xFF533595),
            Color(0xFF9D52AC),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(temp, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 8),
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Text(day, style: const TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}


class InfoBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget icon; // ✅ এখন Widget নিচ্ছে
  final Widget? extra;

  const InfoBox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.extra,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 161,
      height: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF3E2D8F),
            Color(0xFF533595),
            Color(0xFF9D52AC),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFF7CBFD),),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ Title row with icon
          Row(
            children: [
              icon,
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(child: Text(subtitle, style: const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w600 ))),
          const SizedBox(height: 4),
          // if (extra != null)
            // Text(extra!, style: const TextStyle(fontSize: 14, color: Colors.white70)),
          if (extra != null) extra!,
        ],
      ),
    );
  }
}


class ForecastSlider extends StatefulWidget {
  const ForecastSlider({super.key});

  @override
  State<ForecastSlider> createState() => _ForecastSliderState();
}

class _ForecastSliderState extends State<ForecastSlider> {
  final ScrollController _scrollController = ScrollController();

  void scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double totalHorizontalPadding = 96;
    final double cardWidth = (MediaQuery.of(context).size.width - totalHorizontalPadding) / 4;

    // final double cardWidth = (MediaQuery.of(context).size.width - 80) / 4;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: scrollLeft,
        ),
        Expanded(
          child: SizedBox(
            height: 150,
            child: ListView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              children: [
                ForecastCard(day: "Mon", temp: "19°C", icon: '🌦️',width: cardWidth),
                ForecastCard(day: "Tue", temp: "18°C", icon: '🌧️',width: cardWidth),
                ForecastCard(day: "Wed", temp: "18°C", icon: '🌧️',width: cardWidth),
                ForecastCard(day: "Thu", temp: "19°C", icon: '🌦️',width: cardWidth),
              ],
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          onPressed: scrollRight,
        ),
      ],
    );
  }
}




