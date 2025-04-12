import 'package:news_app/global_widget/export.dart';

class AppbackButton extends StatelessWidget {
  const AppbackButton({
    super.key,
    this.onTap,
    this.color,
  });
  final Function()? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap ?? () => context.pop(),
        child: Icon(Icons.arrow_back,
            color: color ?? AppColors.black, size: 25.sp));
  }
}
