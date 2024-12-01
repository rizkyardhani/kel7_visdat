<h1><strong>🎓 DASPRIMA: Dashboard Performa Siswa Matematika</strong></h1>
<p align="center" width="80%">
  <img src="https://github.com/user-attachments/assets/27c438da-2d0f-49b1-9c54-8d0eb29a9aef" alt="Belajar 4" width="400">
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



### 🔍 **Variabel dalam Dataset**

- school: Jenis sekolah (GP: Gabriel Pereira, MS: Mousinho da Silveira).
- sex: Jenis kelamin siswa (F: Perempuan, M: Laki-laki).
- age: Usia siswa (dalam tahun)
- Address: Lokasi tempat tinggal siswa (U : Urban, R: Rural)
- Famsize: Ukuran keluarga siswa (LE3: ≤3 anggota keluarga, GT3: >3 anggota keluarga)
- Pstatus: Status hubungan orang tua siswa (T: Tinggal bersama, A: Terpisah)
- Medu: Tingkat pendidikan ibu (0-4) (0: Tidak sekolah,1: Sekolah dasar, 2: Sekolah menengah pertama, 3: Sekolah menengah atas, 4: Pendidikan tinggi)
- Fedu: Tingkat pendidikan ayah (0-4) (0: Tidak sekolah,1: Sekolah dasar, 2: Sekolah menengah pertama, 3: Sekolah menengah atas, 4: Pendidikan tinggi)
- Mjob: Pekerjaan ibu siswa (at_home: Ibu rumah tangga, health: Bidang kesehatan, services: Layanan publik,  teacher: Guru, other: Lainnya )
- Fjob: Pekerjaan ayah siswa (at_home: Bekerja dari rumah, health: Bidang kesehatan, services: Layanan publik, teacher: Guru, other: Lainnya)
- Reason: Alasan memilih sekolah (home: Dekat dengan rumah, reputation: Reputasi baik, course: Kualitas program studi, other: Alasan lain)
- Guardian: Wali utama siswa (mother: Ibu,father: Ayah, other: Lainnya)
- Traveltime: Waktu perjalanan ke sekolah (1: <15 menit, 2: 15-30 menit, 3: 30-60 menit, 4: >60 menit)
- studytime: Waktu belajar mingguan siswa (1: <2 jam, 2:2-5 jam, 3: 5-10 jam, 4: >10 jam).
- failures: Tingkat kegagalan akademik sebelumnya (0: Tidak ada, 1: Satu kegagalan, 2: Dua kegagalan, 3: Tiga kegagalan atau lebih).
- Schoolsup: Dukungan tambahan dari sekolah (yes: Ada, no: Tidak ada)
- Famsup: Dukungan tambahan dari keluarga  (yes: Ada, no: Tidak ada)
- Paid: Kursus privat berbayar (yes: Ada, no: Tidak ada)
- Activities: Kegiatan ekstrakurikuler (yes: Ada, no: Tidak ada)
- Nursery: Pernah mengikuti pendidikan prasekolah  (yes: Ada, no: Tidak ada)
- Higher: Ingin melanjutkan pendidikan tinggi (yes: Ada, no: Tidak ada)
- Internet: Akses internet di rumah (yes: Ada, no: Tidak ada)
- Romantic: Hubungan romantis saat ini (yes: Ada, no: Tidak ada)
- Famrel: Kualitas hubungan keluarga (1: Sangat Buruk, 2: Buruk, 3: Cukup, 4: Baik, 5: Sangat Baik)
- Freetime: Waktu luang setelah sekolah (1: Sangat Sedikit, 2: Sedikit, 3: Cukup, 4: Banyak, 5: Sangat Banyak)
- Goout: Frekuensi keluar bersama teman (1: Sangat Jarang, 2: Jarang, 3: Cukup, 4: Sering, 5: Sangat Sering)
- Dalc: Konsumsi alkohol harian (1: Sangat Sedikit, 2: Sedikit, 3: Cukup, 4: Banyak, 5: Sangat Banyak)
- Walc: Konsumsi alkohol pekan (1: Sangat Sedikit, 2: Sedikit, 3: Cukup, 4: Banyak, 5: Sangat Banyak)
- Health: Status kesehatan siswa (1: Sangat Buruk, 2: Buruk, 3: Cukup, 4: Baik, 5: Sangat Baik)
- Absences: Jumlah hari ketidakhadiran siswa.
- G1, G2, G3: Nilai siswa pada ujian pertama, kedua, dan akhir.


### 🎯 **Tujuan Dataset**

Dataset ini bertujuan untuk:
1. Menganalisis berbagai faktor yang memengaruhi prestasi akademik siswa.
2. Memberikan wawasan untuk meningkatkan metode pengajaran.

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

💡 **Kelompok 7** terdiri dari:

- **👨‍💻 [Rizky Ardhani](https://github.com/rizkyardhani)**  

- **👩‍💻 [Uswatun Hasanah](https://github.com/hhyuss)**  

- **👩‍💻 [Rifda Nida'ul Labibah](https://github.com/rifdanid)**  


<p align="center"> Dibuat dengan ❤️ oleh Kelompok 7 </p>
