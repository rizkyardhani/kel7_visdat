library(shiny)
library(shinydashboard)
library(DT)
library(shinythemes)
library(plotly)
library(RColorBrewer)
library(viridis)
library(shinyWidgets)
library(ggplot2)


ui <- dashboardPage(
  #------------------------------- HEADER -------------------------------------#
  dashboardHeader(
    title = tagList(
      tags$head(
        tags$style(HTML("
    .navbar {
      background-color: #6A669D !important; 
    }
    
    .main-header {
      background-color: #FFFFFF !important; 
      border-bottom: none !important;
    }

    .main-header .logo {
      height: 100px;
    }

    .main-header .navbar-custom-menu {
      padding-right: 10px;
    }

    .navbar .navbar-nav > li > a {
      background-color: transparent !important; 
      color: #FFFFFF !important;
    }
  
         ")
        )
      ),
      
      div(
        style = "background-color: #FFFFFF; padding: 10px; border-radius: 5px;",
        tags$img(
          src = "siswa.png", 
          height = "60px", 
          style = "display: block; margin: 0 auto; max-width: 100%;"
        ),
        tags$div(
          "DASPRIMA", 
          style = "text-align: center; font-size: 15px; font-weight: bold; margin-top: 0px; white-space: break-spaces; background-color: #FFFFFF important!; color:black;"
        )
      )
    ),
      
  dropdownMenu(type = "messages",
              messageItem(
                  from = "Admin",
                  message = "Halo, Selamat datang di DASPRIMA!",
                  icon = icon("info")
                ),
              messageItem(
                  from = "Sistem",
                  message = "Matematika itu menyenangkan bukan? BUKAN!",
                  icon = icon("exclamation-triangle", type = "fas")
          )
        )
      ),
  
  #------------------------------- SIDEBAR ------------------------------------#
  dashboardSidebar(
    collapsed = FALSE,
    sidebarMenu(
      menuItem("Beranda", tabName = "beranda", icon = icon("home")),
      menuItem("Tentang Data", tabName = "tentang", icon = icon("file")),
      menuItem("Visualisasi", tabName = "eksplor", icon = icon("chart-bar")),
      menuItem("Pemodelan", tabName = "model", icon = icon("chart-pie")),
      menuItem("Info", tabName = "info", icon = icon("info"))
    ),
    
   tags$style(HTML("
    .main-sidebar {
        min-height: 100vh;
        position: fixed;
        top: 80px;
        background-color: #FFFFFF !important;
        padding-left: 15px; 
        padding-right: 15px; 
        padding-top: 10px;
    }

    .sidebar-menu > li {
        background-color: #6A669D;
        padding: 12px 10px;
        border-radius: 5px; 
        margin-bottom: 5px;
        font-size: 20px;
        font-weight: bold;
        color: #FFFFFF important!;
    }

    .sidebar-menu > li.active {
        background-color: #6A669D !important; 
        color: #FFFFFF !important;
        border: none !important; 
    }

    .sidebar-menu > li.active > a {
        background-color: transparent !important;
        border: none !important;
        color: #FFFFFF !important;
    }

    .sidebar-menu > li:hover {
        background-color: #1C325B important!; 
    }

    .sidebar-menu > li > a {
        border-radius: 5px !important; 
    }

    .sidebar-menu {
        margin-top: 20px;
    }
        ")
      )
    ),
  
   #-------------------------------- BODY -------------------------------------#
  dashboardBody(
    tabItems(
      #-------------------------- Tab Beranda
      tabItem(
        tabName = "beranda",
        class = "tab-pane",
        
        tags$div(
          class = "jumbotron",
          style = "background-color: #3b5b92  ; color: white; padding: 50px; text-align: center;",
          tags$img(src = "belajar 4.png", height = "300px", width = "500px", style = "display: block; margin: 0 auto;"),
          tags$h1("DASPRIMA: Dashboard Performa Siswa Matematika", 
                  style = "font-size: 45px; font-weight: bold;"),
          tags$p("Hai, Selamat Datang!", style = "font-size: 25px; color: #FFE31A; font-weight: bold;"),
          tags$br(),
          tags$a(href = "https://www.kaggle.com/datasets/devansodariya/student-performance-data/data", "Dataset", 
                 style = "color: #FFFFFF; font-size: 20px; text-decoration: underline;")
          ),
        
        fluidRow(
          box(
            title = "Mengapa menganalisis performa siswa?",
            solidHeader = TRUE,
            status = "primary",
            tags$p("Setiap angka pada nilai siswa menyimpan cerita: keberhasilan, hambatan, dan peluang untuk berkembang. 
                   Dengan menganalisis performa siswa, kita dapat memahami apa yang mendukung keberhasilan mereka, mengenali faktor penghambat, 
                   dan menciptakan pendekatan pembelajaran yang lebih efektif, adaptif, dan inklusif.",
                   style = "background-color: #C1E3FC; color: black; font-size: 15px; display: flex; align-items: center; text-align: justify; 
                   padding: 10px; border-radius: 5px;"
                ), 
                   width = 6, collapsible = TRUE, collapsed = TRUE
            ),
        
          box(title = "Bagaimana cara penggunaannya?",solidHeader = TRUE,status="primary",
            tags$p("Dashboard ini dirancang untuk menjadi alat bantu dalam memahami data kinerja siswa secara menyeluruh. Dengan fitur eksplorasi data seperti bar plot, 
                   analisis korelasi, dan tabel kontingensi, pengguna dapat menggali informasi penting. Fitur clustering memberikan perspektif 
                   tambahan untuk mengidentifikasi kelompok siswa dengan karakteristik performa serupa, memungkinkan intervensi yang lebih terarah.",
                   style = "background-color: #C1E3FC;color: black;font-size:15px;display: flex;align-items: center;text-align: justify; padding: 10px; border-radius: 5px;"
                   ),
                  width = 6, collapsible = TRUE, collapsed = TRUE 
                )
            ),
      
          box(title = "Matematika Itu Menyenangkan Bukan?",solidHeader = TRUE,status="primary", width=14,div(
            img(src = "math.jpeg", height = 400, width = 1000), style = "display: flex; justify-content: center; align-items: center;"),
            tags$br(),
            tags$p("Mengapa matematika? Karena matematika adalah pilar penting dalam pendidikan yang tidak hanya mengasah kemampuan berhitung, 
               tetapi juga melatih logika, analisis, dan pemecahan masalah—kemampuan esensial yang diperlukan dalam kehidupan sehari-hari dan 
               berbagai profesi. Setiap soal matematika adalah teka-teki yang memicu rasa ingin tahu, dan setiap jawaban yang ditemukan membawa kebanggaan serta dorongan untuk terus belajar.",
               style = "color: black;font-size:18px;align-items: center;text-align: justify; padding: 10px; border-radius: 5px;"),
            tags$p("Dashboard ini dirancang khusus untuk mengevaluasi performa siswa berdasarkan nilai dari tiga ujian matematika. Melalui evaluasi nilai matematika, 
               kita dapat melihat sejauh mana siswa memahami konsep, menerapkan logika, dan menyelesaikan tantangan akademik. Analisis ini membantu mengidentifikasi pola keberhasilan, 
               hambatan yang dihadapi, serta memberikan wawasan untuk pengembangan kurikulum atau pendekatan belajar yang lebih efektif.",
               style = "color: black;font-size:18px;align-items: center;text-align: justify; padding: 10px; border-radius: 5px;")
        
                ),
            ),
      #-------------------------- Tab Analisis dan Evaluasi
      tabItem(
        fluidRow(
          h2(
            "Student Performance Data",
              style = "text-align: center; 
              padding: 5px 10px ;
              background-color: #3b5b92; 
              border-radius: 40px; 
              margin-bottom: 30px;
              color: white;"  
          ),
          tags$div(
            style = "display: flex; justify-content: center; align-items: center; gap: 10px; margin-bottom: 20px;",
            tags$img(
              src = "belajar 2.jpg",
              height = "250px",
              style = "max-width: 100%; border: 1px solid #ccc; border-radius: 5px;"
            ),
            tags$img(
              src = "belajar 5.jpg",
              height = "250px",
              style = "max-width: 100%; border: 1px solid #ccc; border-radius: 5px;"
                 )
             ),
          
          tags$br(),
            valueBoxOutput("observationsBox", width = 2),
            valueBoxOutput("variablesBox", width = 2),
            valueBoxOutput("averageGradesBox", width = 2),
            valueBoxOutput("maxBox", width = 2),
            valueBoxOutput("minBox", width = 2),
            valueBoxOutput("missingBox", width = 2)
          
             ),
        
          tabName = "eksplor", class = "tab-pane",
          tabPanel("Statistika Deskriptif", value = "descriptive",
                 h2(
                   "Statistika Deskriptif",
                      style = "text-align: center; 
                      padding: 5px 10px;
                      background-color: #3b5b92; 
                      border-radius: 40px; 
                      margin-bottom: 30px;
                      color: white;"  
                   ),
                 fluidRow(
                     width = 6,  # Lebar kolom kiri 6 dari 12
                     box(
                       title = "Pilih Variabel",
                       status = "primary",
                       solidHeader = TRUE,
                       selectInput(
                         inputId = "categorical_var",
                         label = "Pilih Variabel Kategorik:",
                         choices = c("sex", "school","address", "famsize", "schoolsup","Pstatus","Medu","Fedu","Mjob", "Fjob", "reason", "guardian","traveltime", "studytime", "failures", "famsup", "paid", "activities", "nursery", "higher", "internet", "romantic", "famrel", "freetime", "goout", "Dalc", "Walc", "health"), 
                         selected = "farmsize"
                       ),
                       selectInput(
                         inputId = "num_var",
                         label = "Pilih Variabel Numerik:",
                         choices = c("age", "absences", "G1", "G2", "G3"), 
                         selected = "G1"
                       
                                  )
                    ),
                     width = 6,  
                     box(
                       title = "Pilih Skema Warna",
                       status = "primary",
                       solidHeader = TRUE,
                       selectInput(
                         inputId = "color_var",
                         label = "Pilih Warna Histogram dan Pie Chart:",
                         choices = c("skyblue", "lightgreen", "lightcoral", "gold", "orange", "pink", "red", "blue", "yellow", "gray"),
                         selected = "pink"
                          )
                        )
                      ),
                  fluidRow(
                     width = 6,
                     box(
                       title = "Pie Chart",
                       status = "primary",
                       solidHeader = TRUE,
                       plotlyOutput("pie_chart")
                   ),
                     width = 6,
                     box(
                       title = "Histogram",
                       status = "primary",
                       solidHeader = TRUE,
                       plotlyOutput("histogram_plot")
                     
                        )
                      )
                    ),
        
          tabPanel("Korelasi", value = "correlation",
                 h2(
                   "Heatmap Korelasi Peubah",
                    style = "text-align: center; 
                    padding: 5px 10px;
                    background-color: #3b5b92; 
                    border-radius: 40px; 
                    margin-bottom: 30px;
                    color: white;"
                    ),
                 fluidRow(
                    box(
                    title = "Filter Metode Korelasi",
                    width = 6,
                    solidHeader = TRUE,
                    status = "primary",
                    selectInput("cor_method", "Pilih Metode Korelasi (Ket: Pearson(Numerik) dan Spearman(Ordinal)):", 
                                 choices = c("pearson", "spearman"), 
                                 selected = "pearson")
                    ),
                    box(
                    title = "Filter Skema Warna",
                    width = 6,
                    solidHeader = TRUE,
                    status = "primary",
                    selectInput("color_scheme", "Pilih Skema Warna:", 
                                 choices = c("viridis", "magma", "plasma", "inferno", "cividis"), 
                                 selected = "viridis")
                      )
                    ),
                    fluidRow(
                     box(
                     title = "Correlation Plot",
                     status = "primary",
                     width=12,
                     solidHeader = TRUE,
                     plotOutput("correlation_plot")
                  )
                )
              ),
        
          tabPanel("Scatter", value = "plot",
                 h2(
                   "Evaluasi Perkembangan Nilai",
                    style = "text-align: center; 
                    padding: 5px 10px;
                    background-color: #3b5b92; 
                    border-radius: 40px; 
                    margin-bottom: 30px;
                    color: white;"  
                   ),
                 fluidRow(
                   box(
                    title = "Filter Variabel",
                    width = 12,
                    solidHeader = TRUE,
                    status = "primary",
                    selectInput("x_var", "Pilih Variabel X (Eksplorasi):", choices = NULL),
                    selectInput("y_var", "Pilih Variabel Y (Nilai G1, G2, G3):", choices = c("G1", "G2", "G3")),
                    selectInput(
                       "plot_color", 
                       "Pilih Warna untuk Plot:", 
                        choices = c("orange", "skyblue", "green", "purple", "pink","cyan","brown","grey")
                          ),
                      )
                    ),
                 fluidRow(
                    width = 6,
                    box(
                      title = "Lolipop Plot",
                      status = "primary",
                      solidHeader = TRUE,
                      plotlyOutput("bar_plot")
                     
                       ),
                     width = 6,
                     box(
                      title = "Box Plot",
                      status = "primary",
                      solidHeader = TRUE,
                      plotlyOutput("box_plot")
                   )
                 )
               ),
        
          tabPanel(
            "Tabel Kontingensi",
            h2(
            "Analisis Crosstab: Visualisasi Data dengan Tabel dan Bar Chart",
              style = "text-align: center; 
              padding: 5px 10px;
              background-color: #3b5b92; 
              border-radius: 40px; 
              margin-bottom: 30px;
              color: white;"  
              ),

            box(
              title = "Filter Variabel",
              width = 14,
              solidHeader = TRUE,
              status = "primary",
              fluidRow(
                column(
                width = 6,
                selectInput("x_var_contingency", "Pilih Variabel Kolom:", choices = NULL)
              ),
                column(
                width = 6,
                selectInput("y_var_contingency", "Pilih Variabel Baris:", choices = NULL)
                )
              )
            ),
          
            fluidRow(
              box(
                width = 7,
                title = "Tabel Kontingensi",
                status = "primary",
                solidHeader = TRUE,
                DTOutput("contingency_table")
              
              ),
              box(
                width = 5,
                title = "Hasil Uji Chi Square",
                status = "primary",
                solidHeader = TRUE,
                verbatimTextOutput("chi_square_result")
                 )
              ),
            
            fluidRow(
              box(
                title = "Bar Plot",
                status = "primary",
                solidHeader = TRUE,
                width = 12,
                plotlyOutput("contingency_plot")
                )
              )
            ),
          ),
     
    #-------------------------- Tab Pemodelan
    tabItem(
      tabName = "model",
          h2(
            "Hasil Clustering (K-Means)",
              style = "text-align: center; 
              padding: 5px 10px;
              background-color: #3b5b92; 
              border-radius: 40px; 
              margin-bottom: 50px;
              color: white;"  
            ),
            box(
              title = "Mengungkap Pola Performa Siswa dengan K-Means Clustering",
              width = 12,
              solidHeader = TRUE,
              status = "primary",
              tags$p("Dashboard ini menggunakan metode K-Means Clustering untuk mengelompokkan siswa berdasarkan kesamaan nilai mereka dari
                     tiga ujian matematika. K-Means dikenal sebagai salah satu metode yang paling sederhana namun sangat efektif dalam analisis 
                     data. Metode ini membagi data ke dalam kelompok (cluster) berdasarkan kesamaan karakteristik, memungkinkan kita untuk
                     mengidentifikasi pola tersembunyi dalam data kinerja siswa.",
                     style = "background-color: #C1E3FC; color: black; font-size:20px; text-align: justify; padding: 10px; border-radius: 5px; list-style-type: disc; margin: 0; padding-left: 10px;"
              ),
              tags$p("Dalam konteks nilai matematika siswa, K-Means memungkinkan kita untuk mengelompokkan siswa berdasarkan performa mereka di 
                     tiga ujian, sehingga kita dapat memahami pola kinerja mereka. Apakah ada kelompok siswa yang konsisten dengan performa tinggi?
                     Ataukah terdapat kelompok yang memerlukan pendekatan khusus untuk meningkatkan kemampuan mereka?",
                     style = "background-color: #C1E3FC; color: black; font-size:20px; text-align: justify; padding: 10px; border-radius: 5px; list-style-type: disc; margin: 0; padding-left: 10px;"
              ),
              tags$p("Melalui analisis ini, kita dapat mengidentifikasi kebutuhan siswa berdasarkan kelompoknya dan merancang strategi pembelajaran yang lebih spesifik. 
                     K-Means membantu kita tidak hanya memahami data, tetapi juga mengambil langkah nyata untuk meningkatkan kualitas pendidikan.",
                     style = "background-color: #C1E3FC; color: black; font-size:20px; text-align: justify; padding: 10px; border-radius: 5px; list-style-type: disc; margin: 0; padding-left: 10px;"
                ),
              ),

            h4(
              "Silakan klik tombol Run dengan perasaan untuk menjalankan program", 
              style = "text-align: center;"),
              fluidPage(
              tags$div(style = "display: flex; justify-content: center; align-items: center; height: 10vh;", 
                       actionButton("run_kmeans_silhouette", 
                                    "Run K-Means Clustering", 
                                      style = "background-color: #6A669D; 
                                      color: white; 
                                      border-radius: 10px; 
                                      padding: 10px 20px; 
                                      font-size: 16px; 
                                      border: none; 
                                      box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);")),
              box(
                title = "K-Optimal",
                width = 14,
                solidHeader = TRUE,
                status = "primary",
              tags$div(style = "background-color: #f5f5f5; 
                    border: 1px solid #ddd; 
                    padding: 15px; 
                    border-radius: 8px; 
                    box-shadow: 0 4px 8px rgba(0,0,0,0.1);",
                       verbatimTextOutput("optimal_k_text")
                )
              ),
              box(
                title = "Cluster Plot",
                width = 14,
                solidHeader = TRUE,
                status = "primary",
              tags$div(style = "background-color: #f5f5f5; 
                    border: 2px solid #ddd; 
                    padding: 20px; 
                    border-radius: 8px; 
                    box-shadow: 0 4px 8px rgba(0,0,0,0.1);",
                       plotOutput("cluster_plot")
                )
              ),
          
              box(
                title = "Cluster Assignment",
                width = 14,
                solidHeader = TRUE,
                status = "primary",
              tags$div(style = "background-color: #f5f5f5; 
                    border: 2px solid #ddd; 
                    border-radius: 8px; 
                    padding: 20px; 
                    box-shadow: 0 4px 8px rgba(0,0,0,0.1); 
                    margin-bottom: 20px;",
                       DTOutput("cluster_table")
                )
              ),
              box(
                title = "Interpretasi Cluster",
                width = 14,
                solidHeader = TRUE,
                status = "primary",
              tags$div(style = "background-color: #f5f5f5; 
                    border: 2px solid #ddd; 
                    border-radius: 8px; 
                    padding: 20px; 
                    box-shadow: 0 4px 8px rgba(0,0,0,0.1);",
                       tableOutput("cluster_profile"),
                       uiOutput("additional_text")
                    )
                  )
                )
              ),
    

    
    #-------------------------- Tab Tentang Data
    tabItem(
      tabName = "tentang",
        h2(
        "Tentang Data",
          style = "text-align: center; 
             padding: 5px 10px;
             background-color: #3b5b92; 
             border-radius: 40px; 
             margin-bottom: 20px;
             color: white;"  
        ),
        tags$img(src = "belajar 3.jpg", height = "250px", style = "display: block; margin: 0 auto; max-width: 100%;"),
        tags$br(),
     
      tabsetPanel(
        tabPanel(strong("Dataset"),tags$br(),
            box(
              title = "Deskripsi Dataset",
              solidHeader = TRUE,
              status = "primary",
              tags$p("Dataset Student Performance berisi informasi terkait kinerja akademik siswa pada mata pelajaran matematika yang berasal dari dua sekolah 
                    di Portugal. Dataset ini mencakup 395 siswa dan memuat 33 variabel, meliputi data demografis, latar belakang keluarga, kondisi sosial-ekonomi, 
                    serta kebiasaan dan gaya hidup siswa. Selain itu, dataset ini juga mengandung data nilai akademik siswa dari tiga tahap penilaian (G1, G2, dan G3). Tujuan utama dataset ini adalah untuk mendukung
                    analisis berbagai faktor yang mempengaruhi prestasi akademik siswa.",
                    style = "background-color: #C1E3FC;color: black;font-size:18px;display: flex;align-items: center;text-align: justify; padding: 10px; border-radius: 5px;"
                    ), 
                    width = 12, collapsible = TRUE, collapsed = FALSE 
                    ),
            box(
              title = "Student Performance Dataset",
              solidHeader = TRUE, width = 12, collapsible = TRUE, collapsed = FALSE,
              status = "primary",
                 DTOutput("data_table")),
                 tags$br(),
                 tags$div(
                  style = "background-color: #6A669D; 
                 padding: 10px 20px; 
                 display: inline-block; 
                 border-radius: 8px; 
                 box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); color:white;",
                   tags$h3("Deskripsi Variabel Dataset",
                     style = "margin: 0; text-align: center;")
                  ),
                        fluidRow( 
                            tags$br(),
                                column(12,
                                  tags$div(
                                    tags$p(class = "section-title", "1. School"),
                                    tags$p(class = "description", "Jenis sekolah siswa."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("GP: Gabriel Pereira"),
                                            tags$li("MS: Mousinho da Silveira")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "2. Sex"),
                                    tags$p(class = "description", "Jenis kelamin siswa."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("F: Perempuan"),
                                            tags$li("M: Laki-laki")
                                     )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "3. Age"),
                                    tags$p(class = "description", "Usia siswa (dalam tahun).")
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "4. Address"),
                                    tags$p(class = "description", "Lokasi tempat tinggal siswa."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("U: Urban (Perkotaan)"),
                                            tags$li("R: Rural (Pedesaan)")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "5. Famsize"),
                                    tags$p(class = "description", "Ukuran keluarga siswa."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("LE3: ≤3 anggota keluarga"),
                                            tags$li("GT3: >3 anggota keluarga")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "6. Pstatus"),
                                    tags$p(class = "description", "Status hubungan orang tua siswa."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("T: Tinggal bersama"),
                                            tags$li("A: Terpisah")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "7. Medu"),
                                    tags$p(class = "description", "Tingkat pendidikan ibu (0-4)."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("0: Tidak sekolah"),
                                            tags$li("1: Sekolah dasar"),
                                            tags$li("2: Sekolah menengah pertama"),
                                            tags$li("3: Sekolah menengah atas"),
                                            tags$li("4: Pendidikan tinggi")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "8. Fedu"),
                                    tags$p(class = "description", "Tingkat pendidikan ayah (0-4)."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("0: Tidak sekolah"),
                                            tags$li("1: Sekolah dasar"),
                                            tags$li("2: Sekolah menengah pertama"),
                                            tags$li("3: Sekolah menengah atas"),
                                            tags$li("4: Pendidikan tinggi")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "9. Mjob"),
                                    tags$p(class = "description", "Pekerjaan ibu siswa."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("- at_home: Ibu rumah tangga"),
                                            tags$li("- health: Bidang kesehatan"),
                                            tags$li("- services: Layanan publik"),
                                            tags$li("- teacher: Guru"),
                                            tags$li("- other: Lainnya")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "10. Fjob"),
                                    tags$p(class = "description", "Pekerjaan ayah siswa."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("at_home: Bekerja dari rumah"),
                                            tags$li("health: Bidang kesehatan"),
                                            tags$li("services: Layanan publik"),
                                            tags$li("teacher: Guru"),
                                            tags$li("other: Lainnya")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "11. Reason"),
                                    tags$p(class = "description", "Alasan memilih sekolah."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("home: Dekat dengan rumah"),
                                            tags$li("reputation: Reputasi baik"),
                                            tags$li("course: Kualitas program studi"),
                                            tags$li("other: Alasan lain")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "12. Guardian"),
                                    tags$p(class = "description", "Wali utama siswa."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("mother: Ibu"),
                                            tags$li("father: Ayah"),
                                            tags$li("other: Lainnya")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "13. Traveltime"),
                                    tags$p(class = "description", "Waktu perjalanan ke sekolah (1-4)."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("1: <15 menit"),
                                            tags$li("2: 15-30 menit"),
                                            tags$li("3: 30-60 menit"),
                                            tags$li("4: >60 menit")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "14. Studytime"),
                                    tags$p(class = "description", "Waktu belajar mingguan (1-4)."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("1: <2 jam"),
                                            tags$li("2: 2-5 jam"),
                                            tags$li("3: 5-10 jam"),
                                            tags$li("4: >10 jam")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "15. Failures"),
                                    tags$p(class = "description", "Tingkat kegagalan akademik sebelumnya (0-3)."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("0: Tidak ada"),
                                            tags$li("1: Satu kegagalan"),
                                            tags$li("2: Dua kegagalan"),
                                            tags$li("3: Tiga kegagalan atau lebih")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "16. Schoolsup"),
                                    tags$p(class = "description", "Dukungan tambahan dari sekolah."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("yes: Ada"),
                                            tags$li("no: Tidak ada")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "17. Famsup"),
                                    tags$p(class = "description", "Dukungan tambahan dari keluarga."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("yes: Ada"),
                                            tags$li("no: Tidak ada")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "18. Paid"),
                                    tags$p(class = "description", "Kursus privat berbayar."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("yes: Mengikuti"),
                                            tags$li("no: Tidak mengikuti")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "19. Activities"),
                                    tags$p(class = "description", "Kegiatan ekstrakurikuler."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("yes: Mengikuti"),
                                            tags$li("no: Tidak mengikuti")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "20. Nursery"),
                                    tags$p(class = "description", "Pernah mengikuti pendidikan prasekolah."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("yes: Ya"),
                                            tags$li("no: Tidak")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "21. Higher"),
                                    tags$p(class = "description", "Ingin melanjutkan pendidikan tinggi."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("yes: Ya"),
                                            tags$li("no: Tidak")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "22. Internet"),
                                    tags$p(class = "description", "Akses internet di rumah."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("yes: Ya"),
                                            tags$li("no: Tidak")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "23. Romantic"),
                                    tags$p(class = "description", "Hubungan romantis saat ini."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("yes: Ya"),
                                            tags$li("no: Tidak")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "24. Famrel"),
                                    tags$p(class = "description", "Kualitas hubungan keluarga (1-5)."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("1: Sangat Buruk"),
                                            tags$li("2: Buruk"),
                                            tags$li("3: Cukup"),
                                            tags$li("4: Baik"),
                                            tags$li("5: Sangat Baik")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "25. Freetime"),
                                    tags$p(class = "description", "Waktu luang setelah sekolah (1-5)."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("1: Sangat Sedikit"),
                                            tags$li("2: Sedikit"),
                                            tags$li("3: Cukup"),
                                            tags$li("4: Banyak"),
                                            tags$li("5: Sangat Banyak")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "26. Goout"),
                                    tags$p(class = "description", "Frekuensi keluar bersama teman (1-5)."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("1: Sangat Jarang"),
                                            tags$li("2: Jarang"),
                                            tags$li("3: Cukup"),
                                            tags$li("4: Sering"),
                                            tags$li("5: Sangat Sering")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "27. Dalc"),
                                    tags$p(class = "description", "Konsumsi alkohol harian (1-5)."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("1: Sangat Sedikit"),
                                            tags$li("2: Sedikit"),
                                            tags$li("3: Cukup"),
                                            tags$li("4: Banyak"),
                                            tags$li("5: Sangat Banyak")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "28. Walc"),
                                    tags$p(class = "description", "Konsumsi alkohol pekan (1-5)."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("1: Sangat Sedikit"),
                                            tags$li("2: Sedikit"),
                                            tags$li("3: Cukup"),
                                            tags$li("4: Banyak"),
                                            tags$li("5: Sangat Banyak")
                                    )
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "29. Health"),
                                    tags$p(class = "description", "Status kesehatan siswa (1-5)."),
                                    tags$p("Kategori:"),
                                    tags$ul(class = "category-list",
                                            tags$li("1: Sangat Buruk"),
                                            tags$li("2: Buruk"),
                                            tags$li("3: Cukup"),
                                            tags$li("4: Baik"),
                                            tags$li("5: Sangat Baik")
                                    )
                                  ),
                                  tags$div(
                                    
                                    tags$p(class = "section-title", "30. Absences"),
                                    tags$p(class = "description", "Jumlah hari ketidakhadiran siswa.")
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "31. G1"),
                                    tags$p(class = "description", "Nilai pada ujian pertama.")
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "32. G2"),
                                    tags$p(class = "description", "Nilai pada ujian kedua.")
                                  ),
                                  tags$div(
                                    tags$p(class = "section-title", "33. G3"),
                                    tags$p(class = "description", "Nilai pada ujian ketiga.")
                                  )
                               )
                            )
                        ),
        
        tabPanel(
          strong("Deskripsi Metode"),
          tags$br(),
          fluidRow(
            box(
              title = "Apa itu Clustering K-Means?",
              solidHeader = TRUE,
              status = "primary", width = 12, collapsible = TRUE,
              tags$p("Clustering K-Means merupakan salah satu metode analisis data untuk mengelompokkan data ke dalam beberapa kelompok atau cluster berdasarkan kesamaan karakteristiknya. 
                   Pada dashboard ini, siswa akan dikelompokkan menjadi dua cluster utama, yaitu cluster siswa dengan performa tinggi dan cluster siswa dengan performa rendah.",
                   style = "background-color: #C1E3FC;color: black;font-size:18px;display: flex;align-items: center;text-align: justify; padding: 10px; border-radius: 5px;"
              )
            ),
            box(
              title = "Ilustrasi K-Means",
              solidHeader = TRUE,
              status = "primary",
              width = 12,
              collapsible = TRUE,
              collapsed = FALSE,
              tags$img(
              src = "kmeans.png",
              height = "300px",
              width = "500px",
              style = "display: block; margin: 0 auto; margin-bottom: 20px;"
            ),
            tags$p(
              "Cara Kerja Clustering K-Means",
              style = "font-weight: bold; text-align: center; margin-bottom: 15px;font-size:20px;"
            ),
            tags$ul(
              style = "list-style-type: decimal; margin-left: 20px; padding-left: 0;font-size:18px;",
              tags$li(
                tags$div(
                  style = "background-color: #C1E3FC; color: black; padding: 10px; border-radius: 5px; margin-bottom: 10px; text-align: justify;",
                  "Inisialisasi: Tahap clustering dimulai dengan menentukan jumlah cluster (k). Dalam analisis ini, ditentukan bahwa siswa akan dikelompokkan ke dalam 2 cluster, yaitu tinggi dan rendah. Titik awal untuk setiap cluster, yang disebut dengan centroids, akan dipilih secara acak dari data."
                )
              ),
              tags$li(
                tags$div(
                  style = "background-color: #C1E3FC; color: black; padding: 10px; border-radius: 5px;font-size:18px; margin-bottom: 10px; text-align: justify;",
                  "Pengelompokan Data: Setiap siswa akan dihitung jaraknya terhadap setiap centroid, dan akan dimasukkan ke dalam cluster dengan centroid terdekat."
                )
              ),
              tags$li(
                tags$div(
                  style = "background-color: #C1E3FC; color: black; padding: 10px; border-radius: 5px;font-size:18px; margin-bottom: 10px; text-align: justify;",
                  "Pembaruan Centroid: Setelah semua siswa dikelompokkan, posisi centroid akan diperbarui dengan dihitung berdasarkan rata-rata nilai siswa pada cluster tersebut."
                )
              ),
              tags$li(
                tags$div(
                  style = "background-color: #C1E3FC; color: black; padding: 10px; border-radius: 5px; margin-bottom: 10px;font-size:18px; text-align: justify;",
                  "Iterasi: Proses pengelompokan dan pembaruan centroid dilakukan berulang kali hingga posisi centroid tidak berubah secara signifikan atau ketika batas iterasi tertentu tercapai."
                )
              )
            )
          ),
          box(
            title = "Mengapa memilih Clustering K-Means?",
            solidHeader = TRUE,
            status = "primary",
            width = 12,
            collapsible = TRUE,
            tags$ul(
              style = "list-style-type: decimal; margin-left: 20px; padding-left: 0;font-size:18px;",
              tags$li(
                tags$div(
                  style = "background-color: #C1E3FC; color: black; padding: 10px; border-radius: 5px; margin-bottom: 10px; text-align: justify;",
                  "Clustering K-Means adalah metode yang cepat dan mudah diterapkan, terutama pada dataset yang besar."
                )
              ),
              tags$li(
                tags$div(
                  style = "background-color: #C1E3FC; color: black; padding: 10px; border-radius: 5px;font-size:18px; margin-bottom: 10px; text-align: justify;",
                  "Metode ini efektif dalam mengidentifikasi pola dan mengelompokkan data tanpa memerlukan informasi tambahan seperti label atau kategori sebelumnya."
                )
              ),
              tags$li(
                tags$div(
                  style = "background-color: #C1E3FC; color: black; padding: 10px; border-radius: 5px;font-size:18px; margin-bottom: 10px; text-align: justify;",
                  "Hasilnya dapat dimanfaatkan sebagai dasar pengambilan keputusan untuk menentukan strategi pembelajaran yang fokus sesuai dengan kebutuhan setiap kelompok siswanya."
                    )
                  )
                )
              )
            )
          ),
    
      tags$style(HTML("
    .section-title {
      font-weight: bold;
      font-size: 18px;
      color: #3366cc; 
    }
    .description {
      margin-top: 10px;
      margin-bottom: 10px;
    }
    .category-list {
      margin-left: 20px;
    }
    .category-list li {
      margin-bottom: 5px;
    }
          ")
         )
      )                         
   ),
  
  #-------------------------- Tab Info
  tabItem(
    tabName = "info",
    h2(
      "Meet Our Team",
        style = "text-align: center; 
           padding: 5px 10px;
           background-color: #6A669D; 
           border-radius: 40px; 
           margin-bottom: 20px;
           color: white;"  
      ),
    box(
      title = "Kelompok 7",
      solidHeader = TRUE, width = 12, collapsed = FALSE,
      status = "primary",
      tags$p("Dashboard ini dikembangkan oleh kelompok 7 yang merupakan projek dari mata kuliah Eksplorasi dan Visualisasi Data, Program Studi Statistika dan Sains Data Pascasarjana IPB University.",
             style = "background-color: #C1E3FC; color: black; font-size:20px; text-align: justify; padding: 10px; border-radius: 5px; list-style-type: disc; margin: 0; padding-left: 10px;"
      ),
      tags$p("Kontributor :",
             style = "background-color: #C1E3FC; color: black; font-size:20px; text-align: justify; padding: 10px; border-radius: 3px; list-style-type: disc; margin: 0; padding-left: 10px;"
      ),
      tags$ul(
        tags$li("Rizky Ardhani - G1501231074"),
        tags$li("Uswatun Hasanah - G1501231040"),
        tags$li("Rifda Nida'ul Labibah - G1501231061"),
        style = "background-color: #C1E3FC; color: black; font-size:20px;color:black;font-weight:bold; text-align: justify; padding: 10px; border-radius: 5px; list-style-type: disc; margin: 0; padding-left: 50px;"
      ),
      tags$p( 
        tags$a(href = "https://github.com/rizkyardhani/kelompok7_visdat", "Link GitHub", 
            style = " color: #3b5b92; font-size:20px;text-decoration: underline;")
              
            )     
          )
        )
      )
    )
  )
