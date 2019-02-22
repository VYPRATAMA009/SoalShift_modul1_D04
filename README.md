
KELOMPOK D04
DWI PRASETYA ARMUNANTA 05111740000025

VINSENSIUS YUDA PRATAMA 05111740000156

1. Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.
Hint: Base64, 
Unzip nature.zip di folder yang diinginkan, misal pada folder prak1, lalu buat subfolder *buka untuk menampung file jpg yang dibuka

```
// file tersebut di decrypt dengan fungsi base 64 | lalu namai tiap tiap file.jpg yang ada didecrypt (dimulai dari 0 sampai sejumlah isinya//
//// f
...

#!/bin/bash
j='0'
for i in nature/*.jpg 
do
base64 -d $i | xxd -r >> buka/$j.jpg
j=$(($j+1))
done
```#no1
#14 14 14 2 5 /bin/bash /home/vinsensius009/prak1/soal1.sh
 
Keterangan: jalankan script setiap pukul 14:14 pada tanggal 14 februari dan hari jumat
```

   
2. Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:
        a. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.
```
awk -F ',' '{if($7 == '2012') i[$1]+=$10} END {for(x in i){print i[x]" " x}}' WA_Sales_Products_2012-14.csv | sort -nr | head -1

Keterangan: syaratnya adalah tahunnya 2012, setelah itu jumlah quantity yang sesuai dengan negara ditampung, diprint, di sort dari yang terbesar terkecil, lalu mengambil data yang paling atas
```

   b. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin 
   ```
awk -F ',' '{if($1 == "United States" && $7 == '2012') i[$4]+=$10} END {for(x in i) {print i[x]" "x}}' WA_Sales_Products_2012-14.csv | sort -nr | head-3

Keterangan: syaratnya adalah negaranya United states karena hasil dari a, dan tahun 2017, lalu jumlah quantity yang sesuai dengan kolom nomor 4 akan ditampung dan diprint, setelah itu di sort dan di ambil 3 data teratas
   ```
   c. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b
   
    ```
    awk -F ',' '{if($4 == "Personal Accessories" || $4 == "Camping Equipment" || $ 4 == "Mountaineering Equipment" && $7 == '2012') i[$6]+=$10} END {for(x in i) {print i[x]" "x}}' WA_Sales_Products_2012-14.csv | sort -nr | head-3
    Syaratnya adalah: hasil dari b, dan tahun 2012, lalu jumlah quantity yang sesuai dengan kolom nomor 6 akan ditampung, diprint, di urutkan, dan di ambil 3 data teratas
   ```
    3. Buatlah sebuah script bash yang dapat menghasilkan password secara acak sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama sebagai berikut:
        a. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt
        b. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu           seterusnya.
        c. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
        d. Password yang dihasilkan tidak boleh sama.
  
```#!/bin/bash
loop=1
num=1
while [ $loop -ne 0 ]
do
if [[ -f /home/vinsensius009/prak1/password$num.txt ]] ;
then    num=$((num + 1))
else
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold  -w 12 | head -1> /home/vinsensius009/prak1/password$num.txt
loop=0
fi
done
keterangan : membuat *looping dengan fungsi if untuk mencari apakah ada file password?.txt di folder prak1, apabila belum buat file password.txt dengan (line 60) dengan kombinasi huruf besar kecil,dan numerik , lalu namai sesuai dengan urutan password$num, ketika di bash yang kedua & selanjutnya, penamaan password akan urut
```
4. Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:
        a. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.
        b. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya. 
        c. setelah huruf z akan kembali ke huruf a
        d. Backup file syslog setiap jam.
        e. dan buatkan juga bash script untuk dekripsinya.
   ```
   ```
5. Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi kriteria berikut:
        a. Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat  case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.
        b. Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.
        c. Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.
        d. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.
```#!/bin/bash
cat /var/log/syslog | grep -v "sudo" | grep -n "cron" | grep -i "cron" | awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12 }' >> /home/vinsensius009/modul1/record.txt
Keterangan: cat file syslog, lalu filter kata sudo menggunakan grep -v, lalu filter kata cron dengan grep -n, dan buat string cron menjadi insensitive case dengan grep -i, setelah itu print menjadi 12 kolom dan masukkan hasilnya di home/user/modul1/record.txt
```2-30/6 * * * * /bin/bash /home/vinsensius009/prak1/soal5.sh
Jalankan script setiap 6 menit dari menit kedua sampai menit 30
