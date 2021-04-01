import 'package:stacked_services/stacked_services.dart';

extension NavigationServiceExtension on NavigationService {
  void navigateToStartupPage() => this.popUntil((route) => route.isFirst);
}
