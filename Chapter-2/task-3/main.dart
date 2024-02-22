import 'dart:io';

class TransportationType {
  int type_id;
  String type_name;

  TransportationType(this.type_id, this.type_name);
}

class TransportationClass {
  int class_id;
  String class_name;

  TransportationClass(this.class_id, this.class_name);
}

class Transportation {
  int transportation_id;
  int type_id;
  int class_id;
  String name;
  int price;
  String source_location;
  String destination_location;

  Transportation(this.transportation_id, this.type_id, this.class_id, this.name,this.price,this.source_location,this.destination_location);
}
void main() {
  List<TransportationType> types = [
    TransportationType(1, 'Bus'),
    TransportationType(2, 'Kereta Api'),
    TransportationType(3, 'Pesawat Terbang'),
    TransportationType(4, 'Kapal Feri')
  ];
  List<TransportationClass> classes = [
    TransportationClass(1, 'Ekonomi'),
    TransportationClass(2, 'Bisnis'),
    TransportationClass(3, 'Eksekutif'),
    TransportationClass(4, 'VIP'),
    TransportationClass(5, 'Double Decker'),
    TransportationClass(6, 'Sleeper'),
  ];
  List<Transportation> transportations = [
    Transportation(1, 1, 1, 'Bus Harapan Jaya', 250000, 'Jakarta', 'Solo'),
    Transportation(2, 1, 3, 'Bus Harapan Jaya', 280000, 'Jakarta', 'Semarang'),
    Transportation(3, 1, 3, 'Bus Harapan Jaya', 400000, 'Jakarta', 'Malang'),
    Transportation(4, 1, 4, 'Bus Harapan Jaya', 360000, 'Jakarta', 'Surabaya'),
    Transportation(5, 1, 5, 'Bus Harapan Jaya', 435000, 'Jakarta', 'Malang'),
    Transportation(6, 1, 2, 'Bus Gunung Harta', 380000, 'Jakarta', 'Malang'),
    Transportation(7, 1, 2, 'Bus Gunung Harta', 385000, 'Jakarta', 'Surabaya'),
    Transportation(8, 1, 4, 'Bus Gunung Harta', 400000, 'Jakarta', 'Malang'),
    Transportation(9, 1, 5, 'Bus Gunung Harta', 420000, 'Jakarta', 'Surabaya'),
    Transportation(10, 1, 6, 'Bus Gunung Harta', 410000, 'Jakarta', 'Malang'),
    Transportation(11, 1, 2, 'Bus Sinar Jaya', 210000, 'Jakarta', 'Bandung'),
    Transportation(12, 1, 3, 'Bus Sinar Jaya', 220000, 'Jakarta', 'Tasikmalaya'),
    Transportation(13, 1, 1, 'Bus Sinar Jaya', 240000, 'Jakarta', 'Cirebon'),
    Transportation(14, 1, 2, 'Bus Sinar Jaya', 235000, 'Jakarta', 'Bogor'),
    Transportation(15, 1, 3, 'Bus Sinar Jaya', 225000, 'Jakarta', 'Bandung'),

    Transportation(16, 2, 1, 'Kereta Api Serayu', 65000, 'Jakarta', 'Bandung'),
    Transportation(17, 2, 3, 'Kereta Api Argo Semeru', 65000, 'Jakarta', 'Cirebon'),
    Transportation(18, 2, 1, 'Kereta Api Fajar Utama', 430000, 'Jakarta', 'Cirebon'),
    Transportation(19, 2, 3, 'Kereta Api Argo Bromo', 490000, 'Jakarta', 'Semarang'),
    Transportation(20, 2, 6, 'Kereta Api Argo Aggrek', 1450000, 'Jakarta', 'Semarang'),
    Transportation(21, 2, 3, 'Kereta Api Taksaka', 650000, 'Jakarta', 'Yogyakarta'),
    Transportation(22, 2, 4, 'Kereta Api Taksaka Luxury', 1400000, 'Jakarta', 'Yogyakarta'),
    Transportation(23, 2, 3, 'Kereta Api Argo Aggrek', 890000, 'Jakarta', 'Surabaya'),
    Transportation(24, 2, 2, 'Kereta Api Brawijaya', 750000, 'Jakarta', 'Malang'),
    Transportation(25, 2, 4, 'Kereta Api Gajayana Luxury', 1560000, 'Jakarta', 'Malang'),

    Transportation(26, 3, 1, 'Pesawat Batik Air', 875000, 'Jakarta', 'Yogyakarta'),
    Transportation(27, 3, 2, 'Pesawat Garuda Indonesia', 1250000, 'Jakarta', 'Semarang'),
    Transportation(28, 3, 1, 'Pesawat Lion Air', 1250000, 'Jakarta', 'Surabaya'),
    Transportation(29, 3, 1, 'Pesawat Citilink', 1450000, 'Jakarta', 'Denpasar'),
    Transportation(30, 3, 1, 'Pesawat Pelita Air', 675000, 'Jakarta', 'Palembang'),

    Transportation(31, 4, 1, 'Kapal KM Kelud', 1200000, 'Jakarta', 'Batam'),
    Transportation(32, 4, 2, 'Kapal KM Lawit', 100000, 'Jakarta', 'Semarang'),
    Transportation(33, 4, 4, 'Kapal KM Dharma Rucitra 8', 400000, 'Surabaya', 'Lombok'),
    Transportation(34, 4, 2, 'Kapal KM Dharma Kartika 2', 475000,'Surabaya', 'Banjarmasin'),
    Transportation(34, 4, 4, 'Kapal KM. Dharma Kencana 7', 575000,'Surabaya', 'Makassar'),
  ];
  var isContinue = true;
  while(isContinue){
    print("Aplikasi Pemesanan Tiket Transportasi");
    print("Pilih jenis transportasi yang diinginkan:");
    for (var type in types) {
      print("${type.type_id}. ${type.type_name}");
    }
    print("0. Keluar");
    print("Masukkan pilihan: ");
    int choice = int.tryParse(stdin.readLineSync()!) ?? -1;
    if (choice == 0){
      print("Program selesai.");
      break;
    } else{
      var filteredTransportations = transportations.where((element) => element.type_id == choice).toList();
      if(filteredTransportations.isNotEmpty){
        var choice2 =-1;
        while (choice2 != 0 ) {
          print("Pilih kelas transportasi yang diinginkan:");
          for (var type in classes) {
            print("${type.class_id}. ${type.class_name}");
          }
          print("0. Kembali");
          print("999. Keluar");
          choice2 = int.tryParse(stdin.readLineSync()!) ?? -1;
          if (choice2 == 0){
            print("Kembali ke 'Pilih jenis transportasi yang diinginkan'");
            break;
          }else if(choice2 == 999) {
            isContinue = false;
            break;
          }else{
            var filteredByClassTransportations = filteredTransportations.where((element) => element.class_id == choice2).toList();
            if(filteredByClassTransportations.isNotEmpty){
              print("Pilih transportasi yang diinginkan:");
              for (var type in filteredByClassTransportations) {
                print("${type.transportation_id}. ${type.name} - ${type.price} Dari ${type.source_location} ke ${type.destination_location}");
              }
              print("0. Kembali");
              print("999. Keluar");
              var choice3 = int.tryParse(stdin.readLineSync()!) ?? -1;
              if (choice3 == 0){
                print("Kembali ke 'Pilih kelas transportasi yang diinginkan'");
                break;
              }else if(choice3 == 999) {
                isContinue = false;
                break;
              }
              else {
                var selectedTransportation = filteredByClassTransportations
                    .firstWhere((element) =>
                element.transportation_id == choice3);
                print("Jumlah Pembelian: ");
                var quantity = int.tryParse(stdin.readLineSync()!) ?? -1;
                print("Memiliki Bagasi? (Y/N): ");
                var baggage = stdin.readLineSync()!;
                if (baggage.toLowerCase() == "y") {
                  print("Jumlah Berat Bagasi: ");
                  var baggageQuantity = int.tryParse(stdin.readLineSync()!) ?? -1;

                  if (baggageQuantity.isNegative || baggageQuantity == 0) {
                    print("Jumlah berat bagasi tidak valid");
                  } else {
                    var extraBaggageFee = (baggageQuantity > 20) ? (baggageQuantity - 20) * 100000 : 0;

                    print("Transportasi: ${selectedTransportation.name}");
                    print("Kelas: ${classes.firstWhere((element) => element.class_id == selectedTransportation.class_id).class_name}");
                    print("Jumlah Tiket: $quantity");
                    print("Jumlah Bagasi: $baggageQuantity Kg");
                    print("Biaya Bagasi: $extraBaggageFee");
                    print("Total Harga: ${selectedTransportation.price * quantity + extraBaggageFee}");
                    print("Silakan lanjutkan ke pembayaran");
                    print("Terima kasih telah menggunakan layanan kami");
                    print('\n\n\n');
                    break;
                  }
                } else {
                  print("Transportasi: ${selectedTransportation.name}");
                  print("Kelas: ${classes.firstWhere((element) => element.class_id == selectedTransportation.class_id).class_name}");
                  print("Jumlah Tiket: $quantity");
                  print("Total Harga: ${selectedTransportation.price * quantity}");
                  print("Silakan lanjutkan ke pembayaran");
                  print("Terima kasih telah menggunakan layanan kami");
                  print('\n\n\n');
                  break;
                }
              }
            }
          }
        }
      }
    }
  }
}