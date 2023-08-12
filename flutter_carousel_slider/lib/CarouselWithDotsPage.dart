// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWithDotsPage extends StatefulWidget {
  final List<String> imgList;

 const CarouselWithDotsPage({super.key, required this.imgList});

  @override
  State<CarouselWithDotsPage> createState() => _CarouselWithDotsPageState();
}

class _CarouselWithDotsPageState extends State<CarouselWithDotsPage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.imgList
        .map((item) => ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          child: Stack(
            children: [
              Image.network(
                item,
                fit: BoxFit.cover,
                width: 1000,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const  BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    'No. ${widget.imgList.indexOf(item)} image',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Carousel With Image, Text & Dots",
            style: TextStyle(
              color: Colors.green[700],
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList.map((url) {
            int index = widget.imgList.indexOf(url);
            return Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 3,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? const Color.fromRGBO(0, 0, 0, 0.9)
                    : const Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
