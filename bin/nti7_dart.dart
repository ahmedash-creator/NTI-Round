import 'dart:io';

void main() {
  var seats = List.generate(5, (_) => List.filled(5, 'E'));
  Map<String, String> bookings = {};

  while (true) {
    print("\nWelcome To Our Theater");
    print("press 1 to book new seat");
    print("press 2 to show the theater seats");
    print("press 3 to show users data");
    print("press 4 to exit");
    print("input=>");

    String choice = stdin.readLineSync()!;

    if (choice == '1') {
      print("Enter row (1-5):");
      int row = int.parse(stdin.readLineSync()!) - 1;

      print("Enter column (1-5):");
      int col = int.parse(stdin.readLineSync()!) - 1;

      if (seats[row][col] == 'E') {
        print("Enter your name:");
        String name = stdin.readLineSync()!;

        print("Enter your phone number:");
        String phone = stdin.readLineSync()!;

        seats[row][col] = 'B';
        bookings["$row,$col"] = "$name - $phone";

        print("Seat booked successfully!");
      } else {
        print("Sorry, this seat is already booked!");
      }

    } else if (choice == '2') {
      print("\nTheater Seats:");
      for (int i = 0; i < 5; i++) {
        String row = '';
        for (int j = 0; j < 5; j++) {
          row += seats[i][j] + ' ';
        }
        print(row);
      }

    } else if (choice == '3') {
      print("\nUsers Booking Details:");

      if (bookings.isEmpty) {
        print("No bookings yet!");
      } else {
        bookings.forEach((seat, data) {
          print("Seat $seat: $data");
        });
      }

    } else if (choice == '4') {
      print("See You Back");
      break;

    } else {
      print("Invalid choice!");
    }
  }
}