class User{
  int id;
  String name;
  String login;
  String email;
  String password;
  String phone;
  String address;
  String complement;
  String status;
  int userInsertId;
  String tuyaUserUID;
  String tuyaHomeId;

  User();

  User.fromJson(Map<String, dynamic> map) :
    id = map["id"],
    name = map["name"],
    login = map["login"],
    email = map["email"],
    password = map["password"],
    phone = map["phone"],
    address = map["address"],
    complement = map["complement"],
    status = map["status"],
    userInsertId = map["userInsertId"],
    tuyaUserUID = map["tuyaUserUID"],
    tuyaHomeId = map["tuyaHomeId"];

  

  @override
  String toString() {
    return 'User{id: $id, name: $name, login: $login, email: $email, password: $password, phone: $phone, address: $address, complement: $complement, status: $status, userInsertId: $userInsertId, tuyaUserUID: $tuyaUserUID, tuyaHomeId: $tuyaHomeId}';
  }

}