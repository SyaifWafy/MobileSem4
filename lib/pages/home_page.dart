import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projekmobile_sem4/authentication/login_screen.dart';
import 'package:projekmobile_sem4/widget/logout_button.dart';
import '../models/wisata_model.dart';
import '../models/event_model.dart';
import '../services/api_service.dart';
import '../nav_pages.dart/main_wrapper.dart';
import '../widget/reuseable_text.dart';
import '../widget/reuseabale_middle_app_text.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;
  late Future<List<Wisata>> futureWisata;
  late Future<List<Event>> futureEvent;
  final EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 10.0);

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    futureWisata = ApiService().fetchTempatWisata();
    futureEvent = ApiService().fetchEvent();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(size),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: padding,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    delay: const Duration(milliseconds: 300),
                    child: const AppText(
                      text: "JemberWonder",
                      size: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 400),
                    child: const AppText(
                      text: "Kemana anda akan berkunjung?",
                      size: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1000),
                    child: const MiddleAppText(
                      text: "Wisata",
                      routeName: '/wisata',
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 700),
                    child: FutureBuilder<List<Wisata>>(
                      future: futureWisata,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          return SizedBox(
                            height: size.height * 0.4,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var tempatWisata = snapshot.data![index];
                                return GestureDetector(
                                  onTap: () {
                                    // Navigate to detail page
                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      Hero(
                                        tag: tempatWisata.gambarwisata,
                                        child: Container(
                                          margin: const EdgeInsets.all(10.0),
                                          width: size.width * 0.6,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: NetworkImage(tempatWisata.gambarwisata),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        top: size.height * 0.2,
                                        child: Container(
                                          margin: const EdgeInsets.all(10.0),
                                          width: size.width * 0.53,
                                          height: size.height * 0.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color.fromARGB(153, 0, 0, 0),
                                                Color.fromARGB(118, 29, 29, 29),
                                                Color.fromARGB(54, 0, 0, 0),
                                                Color.fromARGB(0, 0, 0, 0),
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: size.width * 0.07,
                                        bottom: size.height * 0.045,
                                        child: AppText(
                                          text: tempatWisata.nama_wisata,
                                          size: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Positioned(
                                        left: size.width * 0.07,
                                        bottom: size.height * 0.025,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                            SizedBox(width: size.width * 0.01),
                                            AppText(
                                              text: tempatWisata.lokasi,
                                              size: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return const Center(child: Text('No data found'));
                        }
                      },
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1000),
                    child: const MiddleAppText(
                      text: "Event",
                      routeName: '/event',
                    ),
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1100),
                    child: FutureBuilder<List<Event>>(
                      future: futureEvent,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          return SizedBox(
                            height: size.height * 0.4,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var event = snapshot.data![index];
                                return GestureDetector(
                                  onTap: () {
                                    // Navigate to detail page
                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      Hero(
                                        tag: event.gambarevent,
                                        child: Container(
                                          margin: const EdgeInsets.all(10.0),
                                          width: size.width * 0.6,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: NetworkImage(event.gambarevent),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        top: size.height * 0.2,
                                        child: Container(
                                          margin: const EdgeInsets.all(10.0),
                                          width: size.width * 0.53,
                                          height: size.height * 0.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            gradient: const LinearGradient(
                                              colors: [
                                                Color.fromARGB(153, 0, 0, 0),
                                                Color.fromARGB(118, 29, 29, 29),
                                                Color.fromARGB(54, 0, 0, 0),
                                                Color.fromARGB(0, 0, 0, 0),
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: size.width * 0.07,
                                        bottom: size.height * 0.045,
                                        child: AppText(
                                          text: event.judul,
                                          size: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Positioned(
                                        left: size.width * 0.07,
                                        bottom: size.height * 0.025,
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                            SizedBox(width: size.width * 0.01),
                                            AppText(
                                              text: event.tempat,
                                              size: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return const Center(child: Text('No data found'));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar(Size size) {
    return PreferredSize(
      preferredSize: Size.fromHeight(size.height * 0.09),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: GestureDetector(
              onTap: () => Get.off(() => const MainWrapper()),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/jw.png",
                  width: 70,
                  height: 70,
                ),
              ),
            ),
          ),
          actions: [
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}
