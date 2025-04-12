import 'package:news_app/global_widget/export.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebviewPage extends StatefulWidget {
  const AppWebviewPage({super.key, required this.details});
  final WebViewModel details;

  @override
  State<AppWebviewPage> createState() => _AppWebviewPageState();
}

class _AppWebviewPageState extends State<AppWebviewPage> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
          NavigationDelegate(onPageStarted: (url) {}, onPageFinished: (url) {}))
      ..loadRequest(Uri.parse(widget.details.url));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppbackButton(),
          10.verticalSpace,
          Expanded(child: WebViewWidget(controller: _controller))
        ]),
      ),
    );
  }
}

class WebViewModel {
  final String url, title;
  WebViewModel({required this.url, required this.title});
}
