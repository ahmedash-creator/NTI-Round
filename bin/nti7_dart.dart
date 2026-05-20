import 'dart:io';

void main() {
  List<List<String>> seats = List.generate(
    5,
    (_) => List.generate(5, (_) => 'E'),
  );
  Map<String, String> bookings = {};

  print('"Welcome To Our Theater"');

  while (true) {
    print('');
    print('press 1 to book new seat');
    print('press 2 to show the theater seats');
    print('press 3 to show users data');
    print('press 4 to exit');
    stdout.write('input=>');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        bookSeat(seats, bookings);
        break;
      case '2':
        showSeats(seats);
        break;
      case '3':
        showBookings(bookings);
        break;
      case '4':
        print('"See You Back"');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void bookSeat(List<List<String>> seats, Map<String, String> bookings) {
  stdout.write("Enter row (1-5) or 'exit' to quit: \ninput=>");
  String? rowInput = stdin.readLineSync();

  if (rowInput == null || rowInput.toLowerCase() == 'exit') return;

  int? row = int.tryParse(rowInput);
  if (row == null || row < 1 || row > 5) {
    print('Invalid row. Please enter a number between 1 and 5.');
    return;
  }

  stdout.write('Enter column (1-5): \ninput=>');
  String? colInput = stdin.readLineSync();
  if (colInput == null) return;

  int? col = int.tryParse(colInput);
  if (col == null || col < 1 || col > 5) {
    print('Invalid column. Please enter a number between 1 and 5.');
    return;
  }

  if (seats[row - 1][col - 1] == 'B') {
    print('Sorry, this seat is already booked. Please choose another seat.');
    return;
  }

  stdout.write('Enter your name: \ninput=>');
  String? name = stdin.readLineSync();
  if (name == null || name.trim().isEmpty) {
    print('Invalid name.');
    return;
  }

  stdout.write('Enter your phone number: \ninput=>');
  String? phone = stdin.readLineSync();
  if (phone == null || phone.trim().isEmpty) {
    print('Invalid phone number.');
    return;
  }

  seats[row - 1][col - 1] = 'B';
  String seatKey = '$row,$col';
  bookings[seatKey] = '${name.trim()} - ${phone.trim()}';

  print('Seat booked successfully!');
}

void showSeats(List<List<String>> seats) {
  print('Theater Seats:');
  for (var row in seats) {
    print(row.join(' '));
  }
}

void showBookings(Map<String, String> bookings) {
  if (bookings.isEmpty) {
    print('No bookings yet.');
    return;
  }
  print('Users Booking Details:');
  bookings.forEach((seat, userData) {
    print('Seat $seat: $userData');
  });
}
