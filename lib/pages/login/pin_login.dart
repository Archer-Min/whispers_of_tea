import 'package:flutter/material.dart';
import 'package:whispers_of_tea/app_assets.dart';
import 'package:whispers_of_tea/app_style.dart';
import 'package:whispers_of_tea/app_theme.dart';
import 'package:whispers_of_tea/widgets/login_button.dart';
import 'package:whispers_of_tea/widgets/login_textfield.dart';

class PinLoginPage extends StatefulWidget {
  const PinLoginPage({super.key});

  @override
  State<PinLoginPage> createState() => _PinLoginPageState();
}

class _PinLoginPageState extends State<PinLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 避免输入法弹出时背景图被压缩变形
      body: Stack(
        children: [
          Image.asset(
            AppAssets.loginBg,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(gradient: AppTheme.loginBgColor),
          ),
          ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(overscroll: false),
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 90),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    '你好\n欢迎来到茶语',
                    style: AppStyle.loginPageText,
                  ),
                ),
                const SizedBox(height: 40),
                LoginTextfield(
                  label: '邮箱',
                  controller: emailController,
                ),
                const SizedBox(height: 20),
                LoginTextfield(
                  label: '验证码',
                  controller: pinController,
                  isPinTextfield: true,
                ),
                const SizedBox(height: 40),
                const LoginButton(
                  text: '立即登录',
                  backgroundColor: AppTheme.loginButtonDarkColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}