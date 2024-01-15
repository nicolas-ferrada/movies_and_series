import 'package:flutter/material.dart';

class AppBarMediaDetailsComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String mediaName;
  const AppBarMediaDetailsComponent({
    super.key,
    required this.mediaName,
  });

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      automaticallyImplyLeading: false,
      title: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            backButton(context),
            mediaNameTitle(),
            buttonToCenterTitle(),
          ],
        ),
      ),
    );
  }

  Widget buttonToCenterTitle() {
    return Opacity(
      opacity: 0,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget mediaNameTitle() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          mediaName,
          textAlign: TextAlign.center,
          maxLines: 3,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget backButton(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.maybePop(context),
      icon: const Icon(Icons.arrow_back),
    );
  }
}
