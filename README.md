# The Waroenks (Mobile) 🏬🛒🏪

###### Nama : Muhammad Farid Hasabi <br> 
###### NPM   : 2306152512 <br> 
###### Kelas : PBP D <br>

<hr>

## TUGAS 8

### 1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
`const` di Flutter digunakan untuk membuat variabel, widget, atau objek yang bersifat konstan (tidak dapat diubah).

Keuntungan dalam menggunakan const pada flutter antara lain,
*  Ketika suatu variabel atau objek yang dideklarasikan dengan const hanya akan dibuat satu kali dan digunakan kembali jika dipanggil di tempat lain sehingga dapat meningkatkan efisiensi memori.  
*  Widget yang dideklarasikan dengan const dapat langsung dirender tanpa perlu membangun widget baru, sehingga meningkatkan performa aplikasi.

Flutter sebaiknya tidak digunakan ketika suatu variabel atau objek yang dideklarasikan dengan const akan berubah nilai selama aplikasi dijalankan.

### 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

Column adalah widget layout yang mengatur child widget-nya secara vertikal.
Sedangkan Row adalah widget layout yang mengatur child widget-nya secara horizontal.

Contoh implementasi `Column` :

```dart
child: const Column(
              children: [
                Text(
                  'The Waroenks',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Makanan dan Minuman Murah Berkualitas hanya disini!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
```

Contoh implementasi `Row` :
```dart
child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item.icon,
                color: Colors.white,
                size: 30.0,
              ),
              const SizedBox(width: 10), // Space between icon and text
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18, //  font size
                  fontWeight: FontWeight.bold, // Bold text
                ),
              ),
            ],
          ),
```


### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Pada project kali ini, saya menggunakan TextFormField pada Input untuk product, amount, dan description karena cocok digunakan untuk teks dan angka 

Elemen Input Flutter Lain yang Tidak Digunakan:
* Dropdown Input (DropdownButton / DropdownButtonFormField) : Untuk memilih satu dari beberapa opsi yang disajikan dalam dropdown list
* Checkbox Input : Untuk memilih beberapa opsi boleh lebih dari satu
* Radio Button INput : Untuk memilih satu dari beberapa opsi 
* Slider Input : Untuk memilih nilai dalam rentang tertentu
* Switch Input : Untuk memilih toggle on/off
* Date/time picker input : Untuk input tanggal dan waktu

### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

* Definisikan theme pada `main.app`
```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.lightBlue,
  ).copyWith(secondary: Colors.lightBlue[600]),
),
```
* Aplikasikan juga dalam `AppBar` pada `MyHomePage` untuk memastikan warna yang digunakan tetap konsisten
```dart
backgroundColor: Theme.of(context).colorScheme.primary,
```

### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Dengan menggunakan `Navigator.push()` untuk menambahkan halaman baru ke stack. Dan melakukan routing agar dapat menuju ke halaman yang ingin dituju.

```dart
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductEntryFormPage(), // ROUTING
    ));
```
gunakan `Navigator.push()` agar bisa kembali ke halaman sebelumnya.


<hr>

## TUGAS 7 🛍️

### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya. 
   #### Stateless Widget
   Merupakan widget yang bersifat statis, yang berarti setelah widget dibuat, nilai-nilai dalam widget tetap konstan dan tidak dapat diubah. Contoh nya adalah Teks, Gambar, Ikon
   #### Stateful Widget
   Merupakan widget yang bersifat dinamis, nilai-nilai dalam widget dapat diubah selama siklus hidup widget, yang memungkinkan widget untuk bereaksi terhadap input pengguna atau perubahan data. Statefull  widget dapat digunakan untuk membuat aplikasi yang lebih interaktif. Contoh nya adalah counter yang nilainya akan berubah terus menerus ketika suatu button diklik

   #### Perbedaan

| Fitur       |	Stateless Widget                    | 	Stateful Widget                     |    
| --------    | ---------------------------------   | ------------------------------        |
| State	      | Tidak dapat berubah 	            |   Dapat berubah                       |
| Dinamis	  | Tidak dinamis	                    |   Dinamis                             |
| Metode      |	Hanya memiliki metode build         |	Memiliki metode build dan `setState`|
| Kompleksitas|	Lebih sederhana dan efisien         |	Lebih kompleks dan memerlukan usaha |

### 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya. 🧩

* Scaffold: Struktur dasar aplikasi.
* AppBar: Menampilkan bar atas seperti judul dan tombol navigasi.
* Text: Menampilkan teks.
* Padding: Menambahkan jarak di sekitar widget.
* Column: Menyusun widget secara vertikal.
* Expanded: Mengisi ruang kosong dalam layout.
* GridView.count: Menampilkan widget dalam grid.
* Material: Gaya Material Design pada widget.
* InkWell: Efek interaktif saat ditekan.
* Container: Pembungkus dengan ukuran, padding, dan dekorasi.
* Icon: Menampilkan ikon.
* SnackBar: Pesan sementara di bawah layar.

### 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
 * `setState()` adalah sebuah method yang digunakan untuk memperbarui UI saat ada event tertentu dengan state yang baru.
  
 * Variable yang terdampak adalah variabel state yang dideklarasikan di dalam kelas StatefulWidget seperti int, double, String, dsb

### 4. Jelaskan perbedaan antara const dengan final.
#### Const
* Merupakan nilai variabel diketahui sebelum runtime dan tetap sepanjang waktu.
* harus diinisialisasi saat deklarasi
* Nilai dari const harus diketahui saat kompilasi
* Contoh penggunaannya, ketika digunakan pada widget atau objek, const membuat widget tersebut immutable dan memungkinkan optimalisasi.


### final
* Merupakan nilai yang hanya perlu ditetapkan sekali, tetapi baru bisa diketahui saat runtime
* Dapat diinisialisasi pada saat runtime, sehingga lebih fleksibel daripada const
* Digunakan ketika nilai baru bisa diketahui pada saat runtime atau berasal dari hasil perhitungan
* variabel dapat berupa tipe data apa pun
* Contoh penggunaannya, ketika digunakan pada widget atau objek, final juga membuat objek immutable, tetapi masih bisa di re-build jika berada dalam `setState()` meskipun nilai objek tidak berubah

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

#### 1. Membuat projek Flutter baru
* Pertama, dengan menjalankan perintah berikut di command prompt / terminal
```
flutter create the_waroenks
cd the_waroenks
flutter run // cek running
```
* Merapikan struktur project dengan membuat file `menu.dart` untuk memisahkan logika ke file tersebut (class `MyHomePage` dan `_MyHomePageState`).
* Kemudian, di `main.dart` membuat tema warna aplikasi dengan kode dibawah.
```dart
colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.lightBlue,
).copyWith(secondary: Colors.lightBlue[600]),
```
* Di `menu.dart`, atur title aplikasi dan tambahkan subjudul serta mengatur style fontnya.
```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'The Waroenks',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              // Menambahkan judul
              const Text(
                "Selamat Datang di TheWaroenks!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 200), // Space between title and grid
              Expanded(
                child: GridView.count(
                  primary: true,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: items.map((ItemHomepage item) {
                    return ItemCard(item);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
```
#### 2. Membuat tiga tombol sederhana dengan ikon dan teks dengan warna yang berbeda
* Tambahkan items `List<ItemHomepage>` pada `MyHomePage` untuk mengatur Text, Icon, dan warna yang berbeda
```dart
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.list, Colors.lightGreen.shade700),
    ItemHomepage("Tambah Produk", Icons.add, Colors.blue.shade800),
    ItemHomepage("Logout", Icons.logout, Colors.orange.shade700),
  ];
```
* Membuata class `ItemHomePage` untuk menyimpan informasi name, icon, dan color dari `items` button yang telah dibuat
```dart
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);

}
```

#### 3. Memunculkan Snackbar
* Tambahkan `child: InkWell(...)` untuk menampilkan Snackbar dibagian bawah layar ketika tombol di-klik dan gunakan `${item.name}` untuk menampilkan nama dari item yang diklik

```dart
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),

```

