import 'package:petadoption/core/use_case/use_case.dart';
import 'package:petadoption/features/dashboard/domain/repository/dashboard_repository.dart';

class Logout implements UseCase<void, void> {
  Logout(this._dashboardRepository);
  final DashboardRepository _dashboardRepository;

  @override
  Future<void> call({void params}) async {
    await _dashboardRepository.logout();
  }
}
