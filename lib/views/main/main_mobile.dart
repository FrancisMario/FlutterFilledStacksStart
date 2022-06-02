part of main_view;

class _MainMobile extends StatelessWidget {
  final MainViewModel viewModel;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  _MainMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('MainTablet'),
      ),
    );
  }
}
