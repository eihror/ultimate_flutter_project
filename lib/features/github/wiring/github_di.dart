import 'package:ultimate_flutter_project/features/github/wiring/github_data_di.dart';
import 'package:ultimate_flutter_project/features/github/wiring/github_domain_di.dart';
import 'package:ultimate_flutter_project/features/github/wiring/github_presentation_di.dart';

abstract class GithubDI {
  static Future<void> initializeDependencies() async {
    GithubDataDI.initializeDependencies();
    GithubDomainDI.initializeDependencies();
    GithubPresentationDI.initializeDependencies();
  }
}
