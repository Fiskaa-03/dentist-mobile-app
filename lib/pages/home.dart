import 'package:flutter/material.dart';
import 'package:dentist_app/models/user.dart';
import 'package:dentist_app/services/authentication.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.user});

  final UserModel? user;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthenticationService _authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF72C0FE),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "APPOINTMENT",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "January",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DayElement(
                  day: "Sun",
                  date: "14",
                ),
                SizedBox(width: 10),
                DayElement(
                  day: "Mon",
                  date: "15",
                ),
                SizedBox(width: 10),
                DayElement(
                  day: "Tue",
                  date: "16",
                ),
                SizedBox(width: 10),
                DayElement(
                  day: "Wed",
                  date: "17",
                ),
                SizedBox(width: 10),
                DayElement(
                  day: "Thu",
                  date: "18",
                ),
                SizedBox(width: 10),
                DayElement(
                  day: "Fri",
                  date: "19",
                ),
                SizedBox(width: 10),
                DayElement(
                  day: "Sat",
                  date: "20",
                ),
                SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "CHOOSE PROCEDURES",
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 20),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.all(35),
                                height: 300,
                                width: 255,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 20,
                                      offset: Offset(0, 4), // Shadow position
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Image.asset(
                                              "assets/images/menu_gigi_4.png",
                                            ),
                                            const Text("Cabut Gigi"),
                                          ],
                                        ),
                                        const SizedBox(width: 45),
                                        Column(
                                          children: [
                                            Image.asset(
                                              "assets/images/menu_gigi_1.png",
                                            ),
                                            const Text("Cabut Gigi"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 35),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Image.asset(
                                              "assets/images/menu_gigi_2.png",
                                            ),
                                            const Text("Cabut Gigi"),
                                          ],
                                        ),
                                        const SizedBox(width: 45),
                                        Column(
                                          children: [
                                            Image.asset(
                                              "assets/images/menu_gigi_3.png",
                                            ),
                                            const Text("Cabut Gigi"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      const Column(
                        children: [
                          Text(
                            "AVAILABLE DOCTORS",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 20),
                          ),
                          SizedBox(height: 20),
                          DoctorCard(),
                          SizedBox(height: 20),
                          DoctorCard(),
                          SizedBox(height: 20),
                          DoctorCard(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width - 70.0;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
            offset: Offset(0, 0), // Shadow position
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset("assets/images/profile.png"),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Dr. Tirta",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Image.asset("assets/images/star.png"),
                  const SizedBox(width: 5),
                  Image.asset("assets/images/star.png"),
                  const SizedBox(width: 5),
                  Image.asset("assets/images/star.png"),
                  const SizedBox(width: 5),
                  Image.asset("assets/images/star.png"),
                  const SizedBox(width: 5),
                ],
              ),
            ],
          ),
          const SizedBox(width: 120),
          Image.asset("assets/images/bullet.png"),
        ],
      ),
    );
  }
}

class DayElement extends StatelessWidget {
  final day;
  final date;
  const DayElement({super.key, required this.day, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(
          date,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        )
      ],
    );
  }
}
