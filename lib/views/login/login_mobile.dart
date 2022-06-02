part of login_view;

class _LoginMobile extends StatelessWidget {
  final LoginViewModel viewModel;

  _LoginMobile(this.viewModel);

  StreamController<ErrorAnimationType> errorController = StreamController();

  final phoneController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: viewModel.codeStage
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinCodeTextField(
                    appContext: context,
                    length: viewModel.codeLength,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v.length == viewModel.codeLength &&
                          viewModel.wrongCode) {
                        debugPrint("incorrect coed");
                        return "Incorrect Code";
                      }
                      return "";
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: const Color.fromARGB(0, 183, 183, 183),
                      selectedColor: Colors.black26,
                      inactiveColor: Colors.black54,
                      activeColor: Colors.black54,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    // enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    enabled: !viewModel.isBusy,
                    onCompleted: (v) async {
                      debugPrint('Completed => $v');
                      viewModel.verify2faCode(code: v);
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 38,
                    ),
                  ),
                  verticalSpaceLarge,
                  InputField(
                    placeholder: 'Phone',
                    controller: phoneController,
                  ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BusyButton(
                        title: 'Sign Up',
                        busy: viewModel.isBusy,
                        onPressed: () =>
                            viewModel.login(phone: phoneController.text),
                      )
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
