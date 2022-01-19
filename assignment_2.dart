int i = 0;
void main() {
  List<Map<String, String>> HotelRooms = [
    {
      "Room_no": "201",
      "No_of_Rooms": "4",
      "Type": "Luxury",
      "Status": "Clean",
      "Is_Book": "Booked"
    },
    {
      "Room_no": "202",
      "No_of_Rooms": "4",
      "Type": "Luxury",
      "Status": "Clean",
      "Is_Book": "Not Booked"
    },
    {
      "Room_no": "203",
      "No_of_Rooms": "3",
      "Type": "Studio",
      "Status": "Dirty",
      "Is_Book": "Booked"
    },
    {
      "Room_no": "204",
      "No_of_Rooms": "2",
      "Type": "Compact",
      "Status": "Dirty",
      "Is_Book": "Booked"
    },
    {
      "Room_no": "205",
      "No_of_Rooms": "2",
      "Type": "Standard",
      "Status": "Clean",
      "Is_Book": "Not Booked"
    }
  ];
  show_available_rooms(HotelRooms);
}

void show_available_rooms(var rooms) {
  for (int i = 0; i < rooms.length; i++) {
    if (rooms[i]["Is_Book"] == "Not Booked") {
      display(rooms[i]);
    } else {
      continue;
    }
  }
}

void display(var room) {
  i++;
  print("\t\tRoom Number $i");
  print("\nRoom Number = " + room["Room_no"] + "\n");
  print("Total Rooms = " + room["No_of_Rooms"] + "\n");
  print("Type of Room = " + room["Type"] + "\n");
  print("Status = " + room["Status"] + "\n");
  print("Booking Status = " + room["Is_Book"] + "\n");
}
