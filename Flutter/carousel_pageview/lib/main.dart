import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Carousel",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const CarouselPage(),
    );
  }
}

class CarouselPage extends StatefulWidget {
  const CarouselPage({super.key});

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int mySlideIndex = 0;
  List<String> images = [
    "assets/images/20221203_124556.jpg",
    "assets/images/20230514_071426.jpg",
    "assets/images/20230529_175624.jpg",
    "assets/images/20230724_084155.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page view Builder"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.teal,
        child: Column(
          children: [
            SizedBox(
              height: 460,
              child: PageView.builder(
                onPageChanged: (value) => setState(() {
                  mySlideIndex = value;
                }),
                itemCount: images.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      // child: Text(images[index]),
                      child: Image.asset(
                        images[index],
                        width: 260,
                        height: 260,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == mySlideIndex
                            ? Colors.deepOrange
                            : const Color.fromARGB(255, 188, 186, 186),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
