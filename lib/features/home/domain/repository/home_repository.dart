import 'package:petadoption/core/resources/data_state.dart';
import 'package:petadoption/features/dashboard/data/models/pet_model.dart';

abstract class HomeRepository {
  // API Methods
  Future<DataState<List<String>>> getAccount();
  Future<DataState<List<PetModel>>> getPets();
}
