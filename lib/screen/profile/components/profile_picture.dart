import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: getPropScreenWidth(115),
        width: getPropScreenWidth(115),
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/Profile Image.jpeg"),
            ),
            Positioned(
              right: -16,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(getPropScreenWidth(10)),
                height: getPropScreenWidth(46),
                width: getPropScreenWidth(46),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xfff5f6f9),
                  border: Border.all(color: Colors.white)
                ),
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              )
            ),
          ],
        ),
      ),
    );
  }
}