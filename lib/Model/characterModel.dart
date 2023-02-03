import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Character(
      {required this.name,
      required this.imagePath,
      required this.description,
      required this.colors});
}

List characters = [
  Character(
      name: "Iam a webullish",
      imagePath: "assets/images/Kevin_minions.png",
      description:
          "Are you a stock trader who wishes to get maximum returns out of your trades? Then you will fall in love with Bullish Spotter!Our team at Wwbullish wishes to deliver a more straightforward approach to anyone who is into stock trading. We will do analysis and research. You just need to follow our guidance and proceed with stock trading. Our experts will ensure accuracy, and you will be able to end up getting the best possible returns at the end of the day. On top of that, we will continue to hunt for new opportunities in the stock market and let you know about them. We do all the hard work, and you just need to reap the benefits that come on your way.We started Bullish Webullish back in the year 2020. In fact, we started our business as Labeebz.com. From 2020 up to now, we have been able to help hundreds of traders to be successful with their trades. Even if you have basic knowledge of stock trading, you can get in touch with us. We will provide direction to you on how to get the most out of stock trading. Our specialization is to guide swing traders and help them with executing winning trades.We love to partner up with stock traders and deliver the best results to them. Go ahead and get in touch with us. Then you can allow us to help you with getting the most out of your stock trading efforts.",
      colors: [Colors.orange.shade200, Colors.deepOrange.shade400]),
  Character(
      name: "webullish.com",
      imagePath: "assets/images/Agnes_gru.png",
      description:
          "Webullish.com is an online service dedicated to seeking out and identifying recent bullish stock movements, as well as technical breakouts in both the NASDAQ and NYSE. This information is then conveyed in a matter that allows stock traders of all levels to effortlessly gather vital insight. All resources on webullish.com are meant for informational purposes only, as we are not financial advisors.",
      colors: [Colors.pink.shade200, Colors.redAccent.shade400]),
  Character(
      name: "Achievement",
      imagePath: "assets/images/a.jpg",
      description:
          "Our team of top tier technology and investment experts are ready to work day and night to create a welcoming atmosphere and expansive access to financial services, equity analysis and maximized personal potential.",
      colors: [
        Color.fromARGB(255, 111, 206, 232),
        Color.fromARGB(255, 25, 59, 114)
      ]),
];
