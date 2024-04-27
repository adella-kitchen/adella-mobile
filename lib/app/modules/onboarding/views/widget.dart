class skipBtn extends StatelessWidget {
  const skipBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        right: 20,
        child: TextButton(
            onPressed: () => OnboardingController.instance.skipPage(),
            child: Text(
              'Lewati',
              style: TextStyle(color: myColor().primaryColor),
            )));
  }
}
