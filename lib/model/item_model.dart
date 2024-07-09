// ignore_for_file: public_member_api_docs, sort_constructors_first

class Item {
  int id;
  String title;
  num price;
  String description;
  String category;
  String imgurl;
  Rating rating;
  Item({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imgurl,
    required this.rating,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': imgurl,
      'rating': rating.toJson(),
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      imgurl: json['image'],
      rating: Rating.fromJSon(
        json['rating'],
      ),
    );
  }
}

class Rating {
  num rate;
  num count;
  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJSon(Map<String, dynamic> json) {
    return Rating(rate: json['rate'], count: json['count']);
  }

  Map<String, dynamic> toJson() {
    return {'rate': rate, 'count': count};
  }
}
