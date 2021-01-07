import 'package:bloc_test2/data/models/slang_model.dart';
import 'package:bloc_test2/data/provider/slang_provider.dart';

class SlangRepository {
  SlangProvider _slangProvider = SlangProvider();
  Future<SlangModel> getSlang() => _slangProvider.getSlang();
}
