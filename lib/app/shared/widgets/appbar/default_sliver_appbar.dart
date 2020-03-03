import 'package:cached_network_image/cached_network_image.dart';
import 'package:ems/app/shared/widgets/buttons/default_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String title;
  final String imagePath;
  final Widget content;
  final bool showBackButton;
  final double hideContent;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  DefaultSliverAppBar({
    @required this.expandedHeight,
    @required this.title,
    this.imagePath,
    this.content,
    this.showBackButton = true,
    this.hideContent = 1.4,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.clip,
      children: [
        imagePath != null
            ? CachedNetworkImage(
                imageUrl: imagePath,
                fit: BoxFit.cover,
              )
            : Container(),
        Positioned(
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Opacity(
              opacity: (1 - shrinkOffset / expandedHeight),
              child: shrinkOffset < expandedHeight / hideContent
                  ? content
                  : Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ),
        showBackButton
            ? Positioned(
                top: 0.0,
                left: 0.0,
                child: SafeArea(
                  child: Container(
                    child:
                        shrinkOffset == 0.0 ? DefaultBackButton() : Container(),
                  ),
                ),
              )
            : Container(),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Container(
              height: shrinkOffset * expandedHeight,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xff010013).withAlpha(200),
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black.withAlpha(200),
                  ),
                ),
              ),
              child: SafeArea(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    DefaultBackButton(),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
