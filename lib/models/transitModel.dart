// To parse this JSON data, do
//
//     final transit = transitFromJson(jsonString);
//     final album = albumFromJson(jsonString);
//     final track = trackFromJson(jsonString);

import 'dart:convert';

Transit transitFromJson(String str) => Transit.fromJson(json.decode(str));

String transitToJson(Transit data) => json.encode(data.toJson());

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

Track trackFromJson(String str) => Track.fromJson(json.decode(str));

String trackToJson(Track data) => json.encode(data.toJson());

class Transit {
  List<GeocodedWaypoint> geocodedWaypoints;
  List<Route> routes;
  String status;
  String name;
  int founded;
  List<String> members;

  Transit({
    this.geocodedWaypoints,
    this.routes,
    this.status,
    this.name,
    this.founded,
    this.members,
  });

  factory Transit.fromJson(Map<String, dynamic> json) => new Transit(
        geocodedWaypoints: json["geocoded_waypoints"] == null
            ? null
            : new List<GeocodedWaypoint>.from(json["geocoded_waypoints"]
                .map((x) => GeocodedWaypoint.fromJson(x))),
        routes: json["routes"] == null
            ? null
            : new List<Route>.from(
                json["routes"].map((x) => Route.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
        name: json["name"] == null ? null : json["name"],
        founded: json["founded"] == null ? null : json["founded"],
        members: json["members"] == null
            ? null
            : new List<String>.from(json["members"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "geocoded_waypoints": geocodedWaypoints == null
            ? null
            : new List<dynamic>.from(geocodedWaypoints.map((x) => x.toJson())),
        "routes": routes == null
            ? null
            : new List<dynamic>.from(routes.map((x) => x.toJson())),
        "status": status == null ? null : status,
        "name": name == null ? null : name,
        "founded": founded == null ? null : founded,
        "members": members == null
            ? null
            : new List<dynamic>.from(members.map((x) => x)),
      };
}

class GeocodedWaypoint {
  String geocoderStatus;
  String placeId;
  List<String> types;

  GeocodedWaypoint({
    this.geocoderStatus,
    this.placeId,
    this.types,
  });

  factory GeocodedWaypoint.fromJson(Map<String, dynamic> json) =>
      new GeocodedWaypoint(
        geocoderStatus: json["geocoder_status"],
        placeId: json["place_id"],
        types: new List<String>.from(json["types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "geocoder_status": geocoderStatus,
        "place_id": placeId,
        "types": new List<dynamic>.from(types.map((x) => x)),
      };
}

class Route {
  Bounds bounds;
  String copyrights;
  Fare fare;
  List<Leg> legs;
  Polyline overviewPolyline;
  String summary;
  List<String> warnings;
  List<dynamic> waypointOrder;

  Route({
    this.bounds,
    this.copyrights,
    this.fare,
    this.legs,
    this.overviewPolyline,
    this.summary,
    this.warnings,
    this.waypointOrder,
  });

  factory Route.fromJson(Map<String, dynamic> json) => new Route(
        bounds: Bounds.fromJson(json["bounds"]),
        copyrights: json["copyrights"],
        fare: Fare.fromJson(json["fare"]),
        legs: new List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
        overviewPolyline: Polyline.fromJson(json["overview_polyline"]),
        summary: json["summary"],
        warnings: new List<String>.from(json["warnings"].map((x) => x)),
        waypointOrder:
            new List<dynamic>.from(json["waypoint_order"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "bounds": bounds.toJson(),
        "copyrights": copyrights,
        "fare": fare.toJson(),
        "legs": new List<dynamic>.from(legs.map((x) => x.toJson())),
        "overview_polyline": overviewPolyline.toJson(),
        "summary": summary,
        "warnings": new List<dynamic>.from(warnings.map((x) => x)),
        "waypoint_order": new List<dynamic>.from(waypointOrder.map((x) => x)),
      };
}

class Bounds {
  Northeast northeast;
  Northeast southwest;

  Bounds({
    this.northeast,
    this.southwest,
  });

  factory Bounds.fromJson(Map<String, dynamic> json) => new Bounds(
        northeast: Northeast.fromJson(json["northeast"]),
        southwest: Northeast.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast.toJson(),
        "southwest": southwest.toJson(),
      };
}

class Northeast {
  double lat;
  double lng;

  Northeast({
    this.lat,
    this.lng,
  });

  factory Northeast.fromJson(Map<String, dynamic> json) => new Northeast(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Fare {
  String currency;
  String text;
  int value;

  Fare({
    this.currency,
    this.text,
    this.value,
  });

  factory Fare.fromJson(Map<String, dynamic> json) => new Fare(
        currency: json["currency"],
        text: json["text"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "text": text,
        "value": value,
      };
}

class Leg {
  Time arrivalTime;
  Time departureTime;
  Distance distance;
  Distance duration;
  String endAddress;
  Northeast endLocation;
  String startAddress;
  Northeast startLocation;
  List<Step> steps;
  List<dynamic> trafficSpeedEntry;
  List<dynamic> viaWaypoint;

  Leg({
    this.arrivalTime,
    this.departureTime,
    this.distance,
    this.duration,
    this.endAddress,
    this.endLocation,
    this.startAddress,
    this.startLocation,
    this.steps,
    this.trafficSpeedEntry,
    this.viaWaypoint,
  });

  factory Leg.fromJson(Map<String, dynamic> json) => new Leg(
        arrivalTime: Time.fromJson(json["arrival_time"]),
        departureTime: Time.fromJson(json["departure_time"]),
        distance: Distance.fromJson(json["distance"]),
        duration: Distance.fromJson(json["duration"]),
        endAddress: json["end_address"],
        endLocation: Northeast.fromJson(json["end_location"]),
        startAddress: json["start_address"],
        startLocation: Northeast.fromJson(json["start_location"]),
        steps: new List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        trafficSpeedEntry:
            new List<dynamic>.from(json["traffic_speed_entry"].map((x) => x)),
        viaWaypoint: new List<dynamic>.from(json["via_waypoint"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "arrival_time": arrivalTime.toJson(),
        "departure_time": departureTime.toJson(),
        "distance": distance.toJson(),
        "duration": duration.toJson(),
        "end_address": endAddress,
        "end_location": endLocation.toJson(),
        "start_address": startAddress,
        "start_location": startLocation.toJson(),
        "steps": new List<dynamic>.from(steps.map((x) => x.toJson())),
        "traffic_speed_entry":
            new List<dynamic>.from(trafficSpeedEntry.map((x) => x)),
        "via_waypoint": new List<dynamic>.from(viaWaypoint.map((x) => x)),
      };
}

class Time {
  String text;
  String timeZone;
  int value;

  Time({
    this.text,
    this.timeZone,
    this.value,
  });

  factory Time.fromJson(Map<String, dynamic> json) => new Time(
        text: json["text"],
        timeZone: json["time_zone"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "time_zone": timeZone,
        "value": value,
      };
}

class Distance {
  String text;
  int value;

  Distance({
    this.text,
    this.value,
  });

  factory Distance.fromJson(Map<String, dynamic> json) => new Distance(
        text: json["text"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "value": value,
      };
}

class Step {
  Distance distance;
  Distance duration;
  Northeast endLocation;
  String htmlInstructions;
  Polyline polyline;
  Northeast startLocation;
  List<Step> steps;
  TravelMode travelMode;
  TransitDetails transitDetails;
  String maneuver;

  Step({
    this.distance,
    this.duration,
    this.endLocation,
    this.htmlInstructions,
    this.polyline,
    this.startLocation,
    this.steps,
    this.travelMode,
    this.transitDetails,
    this.maneuver,
  });

  factory Step.fromJson(Map<String, dynamic> json) => new Step(
        distance: Distance.fromJson(json["distance"]),
        duration: Distance.fromJson(json["duration"]),
        endLocation: Northeast.fromJson(json["end_location"]),
        htmlInstructions: json["html_instructions"] == null
            ? null
            : json["html_instructions"],
        polyline: Polyline.fromJson(json["polyline"]),
        startLocation: Northeast.fromJson(json["start_location"]),
        steps: json["steps"] == null
            ? null
            : new List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
        travelMode: travelModeValues.map[json["travel_mode"]],
        transitDetails: json["transit_details"] == null
            ? null
            : TransitDetails.fromJson(json["transit_details"]),
        maneuver: json["maneuver"] == null ? null : json["maneuver"],
      );

  Map<String, dynamic> toJson() => {
        "distance": distance.toJson(),
        "duration": duration.toJson(),
        "end_location": endLocation.toJson(),
        "html_instructions": htmlInstructions == null ? null : htmlInstructions,
        "polyline": polyline.toJson(),
        "start_location": startLocation.toJson(),
        "steps": steps == null
            ? null
            : new List<dynamic>.from(steps.map((x) => x.toJson())),
        "travel_mode": travelModeValues.reverse[travelMode],
        "transit_details":
            transitDetails == null ? null : transitDetails.toJson(),
        "maneuver": maneuver == null ? null : maneuver,
      };
}

class Polyline {
  String points;

  Polyline({
    this.points,
  });

  factory Polyline.fromJson(Map<String, dynamic> json) => new Polyline(
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "points": points,
      };
}

class TransitDetails {
  Stop arrivalStop;
  Time arrivalTime;
  Stop departureStop;
  Time departureTime;
  String headsign;
  int headway;
  Line line;
  int numStops;

  TransitDetails({
    this.arrivalStop,
    this.arrivalTime,
    this.departureStop,
    this.departureTime,
    this.headsign,
    this.headway,
    this.line,
    this.numStops,
  });

  factory TransitDetails.fromJson(Map<String, dynamic> json) =>
      new TransitDetails(
        arrivalStop: Stop.fromJson(json["arrival_stop"]),
        arrivalTime: Time.fromJson(json["arrival_time"]),
        departureStop: Stop.fromJson(json["departure_stop"]),
        departureTime: Time.fromJson(json["departure_time"]),
        headsign: json["headsign"],
        headway: json["headway"],
        line: Line.fromJson(json["line"]),
        numStops: json["num_stops"],
      );

  Map<String, dynamic> toJson() => {
        "arrival_stop": arrivalStop.toJson(),
        "arrival_time": arrivalTime.toJson(),
        "departure_stop": departureStop.toJson(),
        "departure_time": departureTime.toJson(),
        "headsign": headsign,
        "headway": headway,
        "line": line.toJson(),
        "num_stops": numStops,
      };
}

class Stop {
  Northeast location;
  String name;

  Stop({
    this.location,
    this.name,
  });

  factory Stop.fromJson(Map<String, dynamic> json) => new Stop(
        location: Northeast.fromJson(json["location"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "name": name,
      };
}

class Line {
  List<Agency> agencies;
  String color;
  String name;
  String shortName;
  String textColor;
  Vehicle vehicle;

  Line({
    this.agencies,
    this.color,
    this.name,
    this.shortName,
    this.textColor,
    this.vehicle,
  });

  factory Line.fromJson(Map<String, dynamic> json) => new Line(
        agencies: new List<Agency>.from(
            json["agencies"].map((x) => Agency.fromJson(x))),
        color: json["color"],
        name: json["name"],
        shortName: json["short_name"],
        textColor: json["text_color"],
        vehicle: Vehicle.fromJson(json["vehicle"]),
      );

  Map<String, dynamic> toJson() => {
        "agencies": new List<dynamic>.from(agencies.map((x) => x.toJson())),
        "color": color,
        "name": name,
        "short_name": shortName,
        "text_color": textColor,
        "vehicle": vehicle.toJson(),
      };
}

class Agency {
  String name;
  String url;

  Agency({
    this.name,
    this.url,
  });

  factory Agency.fromJson(Map<String, dynamic> json) => new Agency(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Vehicle {
  String icon;
  String localIcon;
  String name;
  String type;

  Vehicle({
    this.icon,
    this.localIcon,
    this.name,
    this.type,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => new Vehicle(
        icon: json["icon"],
        localIcon: json["local_icon"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "local_icon": localIcon,
        "name": name,
        "type": type,
      };
}

enum TravelMode { WALKING, TRANSIT }

final travelModeValues = new EnumValues(
    {"TRANSIT": TravelMode.TRANSIT, "WALKING": TravelMode.WALKING});

class Album {
  String name;
  Artist artist;
  List<Track> tracks;

  Album({
    this.name,
    this.artist,
    this.tracks,
  });

  factory Album.fromJson(Map<String, dynamic> json) => new Album(
        name: json["name"],
        artist: Artist.fromJson(json["artist"]),
        tracks:
            new List<Track>.from(json["tracks"].map((x) => Track.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "artist": artist.toJson(),
        "tracks": new List<dynamic>.from(tracks.map((x) => x.toJson())),
      };
}

class Artist {
  String name;
  int founded;
  List<String> members;

  Artist({
    this.name,
    this.founded,
    this.members,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => new Artist(
        name: json["name"],
        founded: json["founded"],
        members: new List<String>.from(json["members"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "founded": founded,
        "members": new List<dynamic>.from(members.map((x) => x)),
      };
}

class Track {
  String name;
  int duration;

  Track({
    this.name,
    this.duration,
  });

  factory Track.fromJson(Map<String, dynamic> json) => new Track(
        name: json["name"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "duration": duration,
      };
}

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
