
import '../model/currency_item.dart';
import '../services/api_service.dart';

class CurrencyRepository {
  CurrencyRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  late ApiService _apiService;

  Future<List<CurrencyItem>> getAllCurrencies() =>
      _apiService.getCurrencyList();
}
