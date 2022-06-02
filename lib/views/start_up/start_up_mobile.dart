part of start_up_view;

class _StartUpMobile extends StatelessWidget {
  final StartUpViewModel viewModel;

  _StartUpMobile (this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('StartUpMobile'),
      ),
    );
  }
}
