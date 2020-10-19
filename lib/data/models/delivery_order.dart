import 'dart:convert';

List<DeliveryOrder> deliveryOrderFromJson(List<dynamic> json) => List<DeliveryOrder>.from(json.map((x) => DeliveryOrder.fromJson(x)));

String deliveryOrderToJson(List<DeliveryOrder> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeliveryOrder {
    DeliveryOrder({
        this.id,
        this.driverId,
        this.postcode,
        this.address,
        this.lat,
        this.lon,
        this.name,
        this.contact,
        this.placeType,
        this.awbList,
        this.pickupStatus,
        this.dropoffStatus,
        this.isComplete,
        this.hasReschedule,
        this.collectionDate,
        this.session,
        this.city,
        this.addr4,
        this.addr3,
        this.addr2,
        this.addr1,
        this.person,
        this.maxPerformAt,
    });

    String id;
    dynamic driverId;
    String postcode;
    String address;
    dynamic lat;
    dynamic lon;
    String name;
    String contact;
    PlaceType placeType;
    AwbList awbList;
    String pickupStatus;
    DropoffStatus dropoffStatus;
    bool isComplete;
    bool hasReschedule;
    DateTime collectionDate;
    Session session;
    String city;
    Addr addr4;
    Addr addr3;
    String addr2;
    String addr1;
    List<Person> person;
    String maxPerformAt;

    factory DeliveryOrder.fromJson(Map<String, dynamic> json) => DeliveryOrder(
        id: json["id"],
        driverId: json["driver_id"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        address: json["address"],
        lat: json["lat"] == null ? null : json["lat"],
        lon: json["lon"] == null ? null : json["lon"],
        name: json["name"],
        contact: json["contact"],
        placeType: placeTypeValues.map[json["place_type"]],
        awbList: AwbList.fromJson(json["awb_list"]),
        pickupStatus: json["pickup_status"],
        dropoffStatus: dropoffStatusValues.map[json["dropoff_status"]],
        isComplete: json["is_complete"],
        hasReschedule: json["has_reschedule"],
        collectionDate: DateTime.parse(json["collection_date"]),
        session: sessionValues.map[json["session"]],
        city: json["city"] == null ? null : json["city"],
        addr4: json["addr4"] == null ? null : addrValues.map[json["addr4"]],
        addr3: json["addr3"] == null ? null : addrValues.map[json["addr3"]],
        addr2: json["addr2"] == null ? null : json["addr2"],
        addr1: json["addr1"] == null ? null : json["addr1"],
        person: List<Person>.from(json["person"].map((x) => Person.fromJson(x))),
        maxPerformAt: json["max_perform_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "driver_id": driverId,
        "postcode": postcode == null ? null : postcode,
        "address": address,
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
        "name": name,
        "contact": contact,
        "place_type": placeTypeValues.reverse[placeType],
        "awb_list": awbList.toJson(),
        "pickup_status": pickupStatus,
        "dropoff_status": dropoffStatusValues.reverse[dropoffStatus],
        "is_complete": isComplete,
        "has_reschedule": hasReschedule,
        "collection_date": collectionDate.toIso8601String(),
        "session": sessionValues.reverse[session],
        "city": city == null ? null : city,
        "addr4": addr4 == null ? null : addrValues.reverse[addr4],
        "addr3": addr3 == null ? null : addrValues.reverse[addr3],
        "addr2": addr2 == null ? null : addr2,
        "addr1": addr1 == null ? null : addr1,
        "person": List<dynamic>.from(person.map((x) => x.toJson())),
        "max_perform_at": maxPerformAt,
    };
}

enum Addr { EMPTY, NULL, TEST, JALAN_MAYANG_PASIR_SATU, BANDAR_BAYAN_BARU }

final addrValues = EnumValues({
    "Bandar Bayan Baru,": Addr.BANDAR_BAYAN_BARU,
    "": Addr.EMPTY,
    "Jalan Mayang Pasir Satu": Addr.JALAN_MAYANG_PASIR_SATU,
    "null": Addr.NULL,
    "test": Addr.TEST
});

class AwbList {
    AwbList({
        this.dropoff,
        this.pickup,
    });

    List<Awb> dropoff;
    List<Awb> pickup;

    factory AwbList.fromJson(Map<String, dynamic> json) => AwbList(
        dropoff: List<Awb>.from(json["dropoff"].map((x) => x)),
        pickup: List<Awb>.from(json["pickup"].map((x) => Awb.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dropoff": List<dynamic>.from(dropoff.map((x) => x)),
        "pickup": List<dynamic>.from(pickup.map((x) => x.toJson())),
    };
}

class Awb {
    Awb({
        this.awb,
        this.isDone,
        this.scanStatus,
        this.performAt,
        this.type,
        this.attempt,
        this.issueReason,
        this.serviceId,
    });

    String awb;
    dynamic isDone;
    dynamic scanStatus;
    dynamic performAt;
    dynamic type;
    dynamic attempt;
    String issueReason;
    dynamic serviceId;

    factory Awb.fromJson(Map<String, dynamic> json) => Awb(
        awb: json["awb"],
        isDone: json["is_done"],
        scanStatus: json["scan_status"],
        performAt: json["perform_at"],
        type: json["type"],
        attempt: json["attempt"],
        issueReason: json["issue_reason"],
        serviceId: json["service_id"],
    );

    Map<String, dynamic> toJson() => {
        "awb": awb,
        "is_done": isDone,
        "scan_status": scanStatus,
        "perform_at": performAt,
        "type": type,
        "attempt": attempt,
        "issue_reason": issueReason,
        "service_id": serviceId,
    };
}

enum DropoffStatus { THE_00 }

final dropoffStatusValues = EnumValues({
    "0/0": DropoffStatus.THE_00
});

class Person {
    Person({
        this.name,
        this.contact,
    });

    String name;
    String contact;

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        name: json["name"],
        contact: json["contact"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "contact": contact,
    };
}

enum PlaceType { DOOR }

final placeTypeValues = EnumValues({
    "door": PlaceType.DOOR
});

enum Session { AM }

final sessionValues = EnumValues({
    "AM": Session.AM
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
