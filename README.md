 <h1><strong>🎓 DASPRIMA : Dashboard Performa Siswa Matematika </strong></h1>
  <p align="center" width="80%">
   
<img width="60%" src="https://cdn1-production-images-kly.akamaized.net/jh5diFoj2r-Djr_rcCrAli7T-DA=/1280x720/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/5002080/original/075755900_1731386058-sma-adalah.jpg">

</p>


<p align="center">
  📊 <strong>Dashboard Interaktif untuk Mengevaluasi Performa Siswa Matematika</strong>
</p>


<div align="center">

[Tentang](#bar_chart-tentang) • [Deskripsi Project](#film_projector-deskripsi-project) • [Dataset](#pencil-dataset) • [Visualisasi Data](#chart_with_upwards_trend-visualisasi-data) • [Pengembang](#woman_technologist-pengembang)

</div>

---

## :bar_chart: Tentang

### 🎯 Apa itu Dashboard Performa Siswa?

<p align="justify">
Dashboard ini dirancang untuk menjadi alat bantu dalam memahami data kinerja siswa secara menyeluruh. Dengan fitur eksplorasi data seperti bar plot, analisis korelasi, dan tabel kontingensi, pengguna dapat menggali informasi penting. Fitur clustering memberikan perspektif tambahan untuk mengidentifikasi kelompok siswa dengan karakteristik performa serupa, memungkinkan intervensi yang lebih terarah.
</p>

<p align="justify"><strong>Mengapa penting untuk menganalisis kinerja siswa?</strong></p>

 <p align="justify">

- 📈 **Pemahaman tren belajar siswa**: Mengetahui pola belajar siswa berdasarkan data.
- 🧠 **Identifikasi faktor keberhasilan**: Membantu menemukan faktor-faktor yang memengaruhi hasil belajar.
- 🎯 **Strategi peningkatan belajar**: Membantu guru mengembangkan strategi pembelajaran berdasarkan hasil analisis.
- ✅ **Pengambilan keputusan**: Memberikan dasar yang berbasis data untuk meningkatkan kualitas pembelajaran.

</p>

---

## :film_projector: **Deskripsi Project**

<p align="center">
  <img width="80%" src="https://cdn1-production-images-kly.akamaized.net/8zY5k_oCDjaU-KqHy1wbYliHNr0=/0x116:2400x1468/1280x720/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4465100/original/003467700_1686708688-ed-us-RwZzAcRmbbI-unsplash.jpg">
</p>


**Dashboard ini dibangun dengan:**
- 📈 **R Shiny** untuk visualisasi data interaktif.
- 📊 **R Studio** untuk analisis data.
- 🔍 Fokus utama pada pemahaman faktor-faktor yang berkontribusi pada performa siswa.

### 🚀 Tujuan Utama:
1. **Eksplorasi dan visualisasi data** untuk memahami pola dan distribusi performa siswa berdasarkan berbagai variabel, seperti waktu belajar, dukungan keluarga, dan kebiasaan.
2. **Melakukan klaster analisis** untuk mengelompokkan siswa dengan karakteristik yang serupa, sehingga dapat mengidentifikasi pola tersembunyi dalam data.
3. **Membantu dalam pembuatan strategi pembelajaran yang lebih personal dan efektif** berdasarkan hasil klaster analisis, untuk meningkatkan performa siswa.

---
## :pencil: **Dataset**

<p align="center">
  <img width="80%" src="https://cdn0-production-images-kly.akamaized.net/TdBDgGhNkhKC0UeMwDXe-76K2NA=/1280x720/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/4660603/original/097268300_1700738553-IMG-20231123-WA0021.jpg">
</p>


### 📋 **Deskripsi Awal Dataset**

Dataset ini mencakup **395 siswa dan 33 variabel**, dengan data meliputi:
- **Data Demografis**: Jenis kelamin, usia, lokasi tempat tinggal.
- **Latar Belakang Keluarga**: Pendidikan orang tua, pekerjaan, ukuran keluarga.
- **Kondisi Sosial-Ekonomi**: Dukungan keluarga, akses internet, dll.
- **Kebiasaan dan Gaya Hidup**: Waktu belajar, aktivitas ekstrakurikuler, konsumsi alkohol, dll.
- **Nilai Akademik**: Nilai G1 (ujian pertama), G2 (ujian kedua), dan G3 (ujian ketiga).

📂 **Sumber Dataset**:  
Dataset ini diambil dari Kaggle, tersedia di tautan berikut:  
[Student Performance Dataset on Kaggle](https://www.kaggle.com/datasets/devansodariya/student-performance-data/data)



### 🔍 **Beberapa Variabel Penting dalam Dataset**

- school: Jenis sekolah (GP: Gabriel Pereira, MS: Mousinho da Silveira).
- sex: Jenis kelamin siswa (F: Perempuan, M: Laki-laki).
- age: Usia siswa (dalam tahun)
- Address: Lokasi tempat tinggal siswa (U : Urban, R: Rural)
- Famsize: Ukuran keluarga siswa (LE3: ≤3 anggota keluarga, GT3: >3 anggota keluarga)
- Pstatus: Status hubungan orang tua siswa (T: Tinggal bersama, A: Terpisah)
- Medu: Tingkat pendidikan ibu (0-4) (0: Tidak sekolah,1: Sekolah dasar, 2: Sekolah menengah pertama, 3: Sekolah menengah atas, 4: Pendidikan tinggi)
- Fedu: Tingkat pendidikan ayah (0-4) (0: Tidak sekolah,1: Sekolah dasar, 2: Sekolah menengah pertama, 3: Sekolah menengah atas, 4: Pendidikan tinggi)
- Mjob: Pekerjaan ibu siswa (at_home: Ibu rumah tangga, health: Bidang kesehatan, services: Layanan publik,  teacher: Guru, other: Lainnya )

- studytime: Waktu belajar mingguan siswa (1-4, dari "<2 jam" hingga ">10 jam").
- failures: Jumlah kegagalan akademik sebelumnya (0-3).
- famrel: Kualitas hubungan keluarga (1: Sangat buruk, 5: Sangat baik).
- G1, G2, G3: Nilai siswa pada ujian pertama, kedua, dan akhir.


### 🎯 **Tujuan Dataset**

Dataset ini bertujuan untuk:
1. Menganalisis berbagai faktor yang memengaruhi prestasi akademik siswa.
2. Memberikan wawasan untuk meningkatkan metode pengajaran.
3. Memberikan wawasan ter

---

## :chart_with_upwards_trend: **Visualisasi Data**

**Dashboard ini menyediakan visualisasi interaktif, termasuk:**

- 📊 **Distribusi Nilai Akademik**: Mengetahui pola nilai G1, G2, dan G3.
- 🧩 **Hubungan Antar Variabel**: Menganalisis dampak seluruh variabel kategorik, seperti jenis kelamin, lokasi tempat tinggal, pekerjaan orang tua, dukungan keluarga, dan lainnya, terhadap nilai siswa untuk mengidentifikasi pola dan hubungan yang mempengaruhi kinerja akademik.
- 🔍 **Insight**: Menganalisis tren performa siswa berdasarkan seluruh variabel kategorik untuk mengidentifikasi pola dan kelompok siswa yang dapat digunakan dalam pengembangan strategi pembelajaran.
- 📈 **Cluster Analysis (Analisis Kluster)**: 
  - Mengelompokkan siswa ke dalam beberapa kategori berdasarkan variabel seperti waktu belajar, hubungan keluarga, dan hasil akademik.
  - Memanfaatkan algoritma **K-Means** untuk mengidentifikasi pola tersembunyi dalam data siswa.
  - Menyediakan visualisasi kluster untuk membantu memahami kelompok siswa dengan karakteristik yang serupa.

🎯 **Temukan wawasan interaktif melalui dashboard ini!**  
[🌐 Visualisasi Dashboard - ShinyApps](https://rizkyardhani01.shinyapps.io/EVD-Kelompok7/)

---

## :woman_technologist: **Pengembang**

💡 **Kelompok XYZ** terdiri dari mahasiswa dengan keahlian dalam analisis data pendidikan, visualisasi data, dan pengembangan aplikasi berbasis data:

- **👩‍💻 [Nama Pengembang 1](https://github.com/nama1)**  
  Menguasai R Shiny dan Python dengan pengalaman di bidang data pendidikan.

- **👨‍💻 [Nama Pengembang 2](https://github.com/nama2)**  
  Ahli dalam analisis data dan pemodelan statistik dengan fokus pada big data.

- **👩‍💻 [Nama Pengembang 3](https://github.com/nama3)**  
  Terampil dalam membangun dashboard interaktif dan memberikan wawasan berbasis data.


<p align="center"> Dibuat dengan ❤️ oleh Kelompok 7 </p>
