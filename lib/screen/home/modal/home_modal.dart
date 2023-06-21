class HomeModal {
  String? name, price, description, offer, category, id, image;

  HomeModal({
    this.name,
    this.price,
    this.description,
    this.offer,
    this.category,
    this.id,
    this.image,
  });
}

class CategoryModal {
  String? name, price, description, offer, category, id, image;

  CategoryModal({
    this.name,
    this.price,
    this.description,
    this.offer,
    this.category,
    this.id,
    this.image,
  });
}

class SearchModal {
  String? name, price, description, offer, category, id, image;

  SearchModal({
    this.name,
    this.price,
    this.description,
    this.offer,
    this.category,
    this.id,
    this.image,
  });
}

class CartModal {
  String? name, price, description, offer, category, id, image;
  bool? cart;

  CartModal({
    this.name,
    this.price,
    this.description,
    this.offer,
    this.category,
    this.id,
    this.image,
    this.cart,
  });
}
