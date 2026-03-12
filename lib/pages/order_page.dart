import 'package:flutter/material.dart';
import 'package:latihan_kuis/menu.dart';

class OrderPage extends StatefulWidget {
  final Food? menu;

  const OrderPage({super.key, this.menu});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController jumlahControler = TextEditingController();
  String hasil="";
  void hitungTotal(String value){
    int input = int.tryParse(value) ?? 0;
    int harga = int.tryParse(widget.menu!.harga) ?? 0;

    int totalHarga = input * harga;

    print("total: $totalHarga");

    setState(() {
      hasil = totalHarga.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    if (widget.menu == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Order'),
        ),
        body: const Center(
          child: Text('No menu selected'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan ${widget.menu!.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              widget.menu!.image,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              widget.menu!.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'harga: Rp. ${widget.menu!.harga}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: hitungTotal,
              controller: jumlahControler,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'jumlah',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Text(
              "Total harga: Rp.$hasil",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Konfirmasi Pesanan'),
                    content: 
                    Text('Apakah Anda yakin ingin memesan ${widget.menu!.name}?\nTotal harga Rp.$hasil'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Batal'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Pesanan ${widget.menu!.name} berhasil dibuat!')),
                          );
                          Navigator.pop(context);
                        },
                        child: const Text('Ya'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Konfirmasi Pesan'),
            ),
          ],
        ),
      ),
    );
  }
}