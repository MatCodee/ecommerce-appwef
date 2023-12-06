
class AddressModel {
  late int? _id;
  late String _addressType;
  late String? _contactPersonName;
  late String? _contactPersonNumber; 
  late String _address;
  late String _latitude;
  late String _longitude;

 AddressModel({
  id,
  required this._addressType,
  _contactPersonName,
  _contactPersonNumber,
  _address,
  _latitude,
  _longitude
 }){
  _id = id;
  _addressType = _addressType;
  _contactPersonName = _contactPersonName;
  _contactPersonNumber = _contactPersonNumber;
  _longitude = _longitude;
 }


}