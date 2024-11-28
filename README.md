 <h1><strong>🎓 DASPRIMA : Dashboard Performa Siswa Matematika </strong></h1>
  <p align="center" width="80%">
   
<img width="60%" src="https://cdn1-production-images-kly.akamaized.net/jh5diFoj2r-Djr_rcCrAli7T-DA=/1280x720/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/5002080/original/075755900_1731386058-sma-adalah.jpg">

</p>


<p align="center">
📊 **Dashboard Interaktif untuk Mengevaluasi Performa Siswa Matematika **  
</p>

<div align="center">

[Tentang](#bar_chart-tentang) • [Deskripsi Project](#film_projector-deskripsi-project) • [Dataset](#pencil-dataset) • [Visualisasi Data](#chart_with_upwards_trend-visualisasi-data) • [Pengembang](#woman_technologist-pengembang)

</div>

---

## :bar_chart: Tentang

### 🎯 Apa itu Dashboard Performa Siswa?

<p align="justify">
Dashboard ini dirancang untuk memvisualisasikan dan menganalisis faktor-faktor yang memengaruhi kinerja akademik siswa berdasarkan dataset yang berasal dari dua sekolah di Portugal. Dengan menggabungkan berbagai faktor seperti demografi, sosial-ekonomi, dan gaya hidup siswa, dashboard ini bertujuan untuk memberikan wawasan yang mendalam kepada pengajar, siswa, dan pemangku kepentingan lainnya untuk mendukung pengambilan keputusan yang lebih baik.
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
1. **Memahami pola belajar siswa** berdasarkan waktu belajar, dukungan keluarga, dan kebiasaan.
2. **Mengidentifikasi variabel penting** seperti pendidikan orang tua, lokasi tempat tinggal, atau waktu belajar terhadap hasil akademik.
3. **Membantu pengembangan strategi pembelajaran** yang lebih personal dan efektif.

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
- **Nilai Akademik**: Nilai G1 (ujian pertama), G2 (ujian kedua), dan G3 (nilai akhir).

📂 **Sumber Dataset**:  
Dataset ini diambil dari Kaggle, tersedia di tautan berikut:  
[Student Performance Dataset on Kaggle](https://www.kaggle.com/datasets/devansodariya/student-performance-data/data)



### 🔍 **Beberapa Variabel Penting dalam Dataset**

- school: Jenis sekolah (GP: Gabriel Pereira, MS: Mousinho da Silveira).
- sex: Jenis kelamin siswa (F: Perempuan, M: Laki-laki).
- studytime: Waktu belajar mingguan siswa (1-4, dari "<2 jam" hingga ">10 jam").
- failures: Jumlah kegagalan akademik sebelumnya (0-3).
- famrel: Kualitas hubungan keluarga (1: Sangat buruk, 5: Sangat baik).
- G1, G2, G3: Nilai siswa pada ujian pertama, kedua, dan akhir.


### 🎯 **Tujuan Dataset**

Dataset ini bertujuan untuk:
1. Menganalisis berbagai faktor yang memengaruhi prestasi akademik siswa.
2. Memberikan wawasan untuk meningkatkan metode pengajaran.

---

## :chart_with_upwards_trend: **Visualisasi Data**

**Dashboard ini menyediakan visualisasi interaktif, termasuk:**

- 📊 **Distribusi Nilai Akademik**: Mengetahui pola nilai G1, G2, dan G3.
- 🧩 **Hubungan Antar Variabel**: Dampak waktu belajar, hubungan keluarga, dan akses internet terhadap nilai siswa.
- 🔍 **Insight Demografis**: Tren performa berdasarkan jenis kelamin, usia, dan lokasi tempat tinggal.
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
