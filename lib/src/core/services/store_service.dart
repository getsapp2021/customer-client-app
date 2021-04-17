import 'package:customer/src/core/models/store.dart';

abstract class StoreServiceBase {
  Future<List<Store>> getAllStores();
  Future<List<StoreProduct>> getAllStoreProducts();
  Future<Store> getStore(int id);
  Future<StoreProduct> getStoreProduct(int productId);

  Future<ServiceBooking> bookAService();
  Future<void> buyStoreProduct();
}

class StoreService implements StoreServiceBase {
  @override
  Future<ServiceBooking> bookAService() {
    return null;
  }

  @override
  Future<void> buyStoreProduct() {
    return null;
  }

  @override
  Future<List<Store>> getAllStores() {
    return null;
  }

  @override
  Future<Store> getStore(int id) {
    return null;
  }

  @override
  Future<StoreProduct> getStoreProduct(int productId) {
    return null;
  }

  @override
  Future<List<StoreProduct>> getAllStoreProducts() {
    // TODO: implement getAllStoreProducts
    throw UnimplementedError();
  }
}
