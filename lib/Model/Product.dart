class Product {
  String pName;
  int pPrice;
  String pDescription;
  String pLocation;
  int pQuantity;
  int pCount;

  Product(this.pCount, this.pQuantity, this.pName, this.pPrice,
      this.pDescription, this.pLocation);

  Map<String, dynamic> ConvertToMap() {
    return {
      'pName': this.pName,
      'pPrice': this.pPrice,
      'pLocation': this.pLocation,
      'pQuantity': this.pQuantity,
      'pCount': this.pCount,
      'pDescription': this.pDescription,
    };
  }

  Product fromMap(Map<String, dynamic> mymap) {
    return new Product(mymap['pCount'], mymap['pQuantity'], mymap['pName'],
        mymap['pPrice'], mymap['pDescription'], mymap['pLocation']);
  }
}
