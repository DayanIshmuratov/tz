import 'package:flutter/material.dart';
import 'package:tz/common/templates/colors/app_colors.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images;

  const ImageSlider({Key? key, required this.images}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  late PageController _pageController;
  int activePage = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: activePage, viewportFraction: 1.1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          height: 230,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            pageSnapping: true,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage(widget.images[pagePosition]),fit: BoxFit.cover,),
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: widget.images.length * 20,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: indicators(widget.images.length, activePage),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> indicators(int imagesLength, int activePage) {
    return List.generate(
      imagesLength,
      (index) => Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
            color: index == activePage ? Colors.black : AppColors.grayText,
            shape: BoxShape.circle),
      ),
    );
  }
}
