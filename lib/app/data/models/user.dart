class User {
    int id;
    String name;
    String noTelp;
    String email;
    dynamic googleId;
    String jenisKelamin;
    String tanggalLahir;
    String tempatLahir;
    String role;
    List<Address> address;

    User({
        required this.id,
        required this.name,
        required this.noTelp,
        required this.email,
        required this.googleId,
        required this.jenisKelamin,
        required this.tanggalLahir,
        required this.tempatLahir,
        required this.role,
        required this.address,
    });

}

class Address {
    int idAddress;
    int idUsers;
    String idCity;
    String completeAddress;

    Address({
        required this.idAddress,
        required this.idUsers,
        required this.idCity,
        required this.completeAddress,
    });

}
