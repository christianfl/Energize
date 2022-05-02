class ProductNotFoundException implements Exception {
  String ean;
  ProductNotFoundException(this.ean);

  @override
  String toString() {
    return ean;
  }
}
