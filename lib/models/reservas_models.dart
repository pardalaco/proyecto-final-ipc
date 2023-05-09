class Reservas {
  late List<Reserva> reservas;

  Reservas({required this.reservas});

  Reservas.fromJson(Map<String, dynamic> json) {
    if (json['reservas'] != null) {
      reservas = <Reserva>[];
      json['reservas'].forEach((v) {
        reservas.add(Reserva.fromJson(v));
      });
    }
  }
}

class Reserva {
  late String name;
  late String location;
  late double price;
  late String image;
  late String description;
  late int stars;
  late int nigths;
  late String entry_date;
  late String departure_date;

  Reserva({
    required this.name,
    required this.location,
    required this.price,
    required this.image,
    required this.description,
    required this.stars,
    required this.nigths,
    required this.entry_date,
    required this.departure_date,
  });

  Reserva.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    stars = json['stars'];
    nigths = json['nigths'];
    entry_date = json['entry_date'];
    departure_date = json['departure_date'];
  }
}
