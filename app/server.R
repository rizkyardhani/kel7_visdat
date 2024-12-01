library(shiny)
library(DT)
library(dplyr)
library(cluster)
library(fpc)
library(factoextra)
library(viridis)
library(reshape2)
library(reactable)
library(formattable)
library(shinyWidgets)

server <- function(input, output, session) {
  #-------- Input Data
  data <- reactiveVal(read.csv("student_data.csv"))  # Default dataset (replace with user-uploaded file later)
  
  #-------- Tab Analisis dan Visualisasi--------#
  #------ Observation Box
  output$observationsBox <- renderValueBox({
    valueBox(nrow(data()), "Observasi", icon = icon("list"), color = "red")
  })
  output$averageGradesBox <- renderValueBox({
    avg_grade <- mean(c(mean(as.numeric(data()$G1)), mean(as.numeric(data()$G2)), mean(as.numeric(data()$G3))), na.rm = TRUE)
    valueBox(round(avg_grade, 2), "Rataan total nilai", icon = icon("graduation-cap"), color = "aqua")
  })
  output$variablesBox <- renderValueBox({
    valueBox(ncol(data()), "Variabel", icon = icon("columns"), color = "purple")
  })
  output$missingBox <- renderValueBox({
    missing_perc <- sum(is.na(data())) / (nrow(data()) * ncol(data())) * 100
    valueBox(paste0(round(missing_perc, 1), "%"), "Data hilang", icon = icon("exclamation"), color = "green")
  })
  output$minBox <- renderValueBox({
    min_grade <- min(c(as.numeric(data()$G1), as.numeric(data()$G2), as.numeric(data()$G3)), na.rm = TRUE)
    valueBox(round(min_grade, 2), "Nilai Minimum", icon = icon("arrow-down"), color = "fuchsia")
  })
  output$maxBox <- renderValueBox({
    max_grade <- max(c(as.numeric(data()$G1), as.numeric(data()$G2), as.numeric(data()$G3)), na.rm = TRUE)
    valueBox(round(max_grade, 2), "Nilai Maksimum", icon = icon("arrow-up"), color = "lime")
  })
  
  #------ Statistika Deskriptif
  output$histogram_plot <- renderPlotly({
    req(input$num_var)  
    plot_ly(data(), x = ~get(input$num_var), type = "histogram", 
    marker = list(color = input$color_var, line = list(color = 'black', width = 1))) %>%
    layout(
        title = paste("Distribusi", input$num_var),
        xaxis = list(title = input$num_var),
        yaxis = list(title = "Frekuensi")
      )
  })
  
  output$pie_chart <- renderPlotly({
    req(input$categorical_var) 
    data_for_pie <- data() %>%
      group_by(.data[[input$categorical_var]]) %>%
      summarise(count = n()) %>%
      mutate(percentage = count / sum(count) * 100)
    highlight_category <- unique(data_for_pie[[1]])[1]
    default_color <- input$color_var
    colors <- ifelse(data_for_pie[[1]] == highlight_category, "purple", default_color)
    plot_ly(
      data = data_for_pie,
      labels = ~.data[[input$categorical_var]],
      values = ~percentage,
      type = "pie",
      textinfo = "label+percent",
      insidetextorientation = "auto",
      marker = list(
        colors = colors  
      ),
      pull = 0.1  
      ) %>%
      layout(
        title = paste("Pie Chart Proporsi", input$categorical_var),
        showlegend = TRUE
        )
  })
  
  #------ Heatmap Korelasi Peubah
  output$correlation_plot <- renderPlot({
    data_for_correlation <- data()
    numeric_cols <- c("age", "absences", "G1", "G2", "G3")
    ordinal_cols <- c("Fedu", "Medu", "traveltime", "studytime", "failures", "famrel", "freetime", "goout", "Dalc", "Walc", "health")
    cor_method_to_use <- input$cor_method
    
    if (cor_method_to_use == "pearson") {
      data_for_correlation <- data_for_correlation[, numeric_cols, drop = FALSE]
    } else if (cor_method_to_use == "spearman") {
      data_for_correlation <- data_for_correlation[, ordinal_cols, drop = FALSE]
    }
    cor_matrix <- cor(data_for_correlation, use = "complete.obs", method = cor_method_to_use)
    cor_data <- melt(cor_matrix)
    selected_color_scheme <- input$color_scheme
    ggplot(data = cor_data, aes(Var1, Var2, fill = value)) +
      geom_tile() +
      geom_text(aes(label = round(value, 2)), color = "white", size = 4) + 
      scale_fill_viridis_c(option = selected_color_scheme) +  # Menggunakan skema warna dari viridis
      labs(
        x = NULL,
        y = NULL,
        fill = "Korelasi"
      ) +
      theme_minimal() +
      theme(
        axis.text.x = element_text(angle = 45, hjust = 1), # Rotasi teks sumbu x
        panel.grid = element_blank()
      
      )
  })
  
  #------ Evaluasi Perkembangan Nilai
  observe({
    df <- data()
    x_vars <- setdiff(names(df), c("G1", "G2", "G3"))
    updateSelectInput(session, "x_var", choices = x_vars)
  })
  
  output$bar_plot <- renderPlotly({
    req(input$x_var, input$y_var, input$plot_color)
    avg_data <- data() %>%
      group_by_at(input$x_var) %>%
      summarise(avg_value = mean(.data[[input$y_var]], na.rm = TRUE))
    p_lollipop <- ggplot(avg_data, aes(x = .data[[input$x_var]], y = avg_value)) +
      geom_segment(aes(x = .data[[input$x_var]], xend = .data[[input$x_var]], y = 0, yend = avg_value),
          color = input$plot_color, size = 1) +
      geom_point(color = input$plot_color, size = 4) +
      labs(
        title = paste("Lollipop Plot untuk Rata-rata", input$y_var, "berdasarkan", input$x_var),
        x = input$x_var,
        y = paste("Rata-rata", input$y_var)
      ) +
      theme_minimal()
    ggplotly(p_lollipop)
  })
  
  output$box_plot <- renderPlotly({
    req(input$x_var, input$y_var, input$plot_color) 
    p_box <- ggplot(data(), aes_string(x = input$x_var, y = input$y_var)) +
      geom_boxplot(fill = input$plot_color, color = "black") +  
      labs(
        title = paste("Box Plot untuk", input$y_var, "berdasarkan", input$x_var),
        x = input$x_var,
        y = paste("Nilai", input$y_var)
      ) +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      scale_x_discrete(limits = unique(data()[[input$x_var]]))  # Pastikan sumbu auto-scale
    ggplotly(p_box, tooltip = c(input$x_var, input$y_var))
  })
  
  #------ Analisis Crosstab
  observe({
    df <- data()
    categorical_vars <- names(df)[sapply(df, function(x) {
      is.factor(x) || is.character(x) && length(unique(x)) == 2
    })]
    
    updateSelectInput(session, "x_var_contingency", choices = categorical_vars)
    updateSelectInput(session, "y_var_contingency", choices = categorical_vars,selected="sex")
  })
  
  output$contingency_table <- renderDT({
    req(input$x_var_contingency, input$y_var_contingency)
    
    validate(
      need(input$x_var_contingency %in% names(data()), "Variabel X tidak ditemukan."),
      need(input$y_var_contingency %in% names(data()), "Variabel Y tidak ditemukan."),
      need(is.factor(data()[[input$x_var_contingency]]) || is.character(data()[[input$x_var_contingency]]), 
           "Variabel X harus bertipe faktor atau karakter."),
      need(is.factor(data()[[input$y_var_contingency]]) || is.character(data()[[input$y_var_contingency]]), 
           "Variabel Y harus bertipe faktor atau karakter.")
    )
    
    contingency <- table(data()[[input$x_var_contingency]], data()[[input$y_var_contingency]])
    
    contingency_with_totals <- rbind(
      cbind(contingency, "Total" = rowSums(contingency)),  
      "Total" = c(colSums(contingency), sum(contingency))
    )
    
    colnames(contingency_with_totals) <- c(colnames(contingency), "Total")
    rownames(contingency_with_totals)[nrow(contingency_with_totals)] <- "Total"
    
    datatable(
      contingency_with_totals, 
      options = list(
        pageLength = 5, 
        autoWidth = TRUE, 
        columnDefs = list(
          list(
            targets = 1:(ncol(contingency_with_totals)-1),  
            className = 'dt-center'
          ),
          list(
            targets = ncol(contingency_with_totals), 
            className = 'dt-right'
          )
        )
      ),
      caption = paste("Tabel Kontingensi antara", input$x_var_contingency, "dan", input$y_var_contingency),
      style = 'bootstrap4'
      ) %>%
    
      formatStyle(
        columns = 1:(ncol(contingency_with_totals)-1),  # Kolom data
        backgroundColor = styleInterval(
          c(5, 10), 
          viridis(3)  
        ),
        color = 'black' 
      ) %>%
   
      formatStyle(
        columns = 1:ncol(contingency_with_totals),
        cursor = 'pointer', 
        hover = TRUE,
        backgroundColor = styleEqual(
          unique(contingency_with_totals),
          rep('lightblue', length(unique(contingency_with_totals)))
        )
      )
  })
  
  output$contingency_plot <- renderPlotly({
    req(input$x_var_contingency, input$y_var_contingency)

    contingency <- table(data()[[input$x_var_contingency]], data()[[input$y_var_contingency]])

    plot_data <- as.data.frame(contingency)

    plot_ly(
      data = plot_data,
      x = ~Var1, 
      y = ~Freq, 
      color = ~Var2, 
      type = 'bar',
      barmode = 'stack',
      text = ~paste(Var1, "vs", Var2, "<br>Freq: ", Freq),
      hoverinfo = 'text'
      ) %>%
      layout(
        title = paste("Bar Plot Kontingensi: ", input$x_var_contingency, " vs ", input$y_var_contingency),
        xaxis = list(title = paste(input$x_var_contingency)),
        yaxis = list(title = "Frekuensi"),
        barmode = 'stack',
        showlegend = TRUE
      )
  })
  
  output$chi_square_result <- renderText({
    req(input$x_var_contingency, input$y_var_contingency)

    contingency <- table(data()[[input$x_var_contingency]], data()[[input$y_var_contingency]])

    validate(
      need(nrow(contingency) >= 2 && ncol(contingency) >= 2, 
           "Tabel kontingensi tidak memenuhi syarat untuk uji Chi-Square.")
    )

    chi_result <- chisq.test(contingency)

    paste0(
      "Hasil Uji Chi-Square:\n",
      "Statistik Chi-Square: ", round(chi_result$statistic, 2), "\n",
      "df: ", chi_result$parameter, "\n",
      "P-value: ", format.pval(chi_result$p.value, digits = 4), "\n\n",
      ifelse(chi_result$p.value < 0.05,
             "Kesimpulan: Terdapat hubungan yang signifikan antara variabel.",
             "Kesimpulan: Tidak terdapat hubungan yang signifikan antara variabel.")
    )
  })
  
  #-------- Tab Pemodelan Clustering--------#
  Mode <- function(x) {
    uniq_x <- unique(x)
    uniq_x[which.max(tabulate(match(x, uniq_x)))]
  }
  
  observeEvent(input$run_kmeans_silhouette, {
    req(data())
    
    set.seed(123)

    raw_data <- data()

    data_transformed <- raw_data %>%
      mutate_if(is.factor, as.character) %>%                
      mutate_if(is.character, ~factor(.) %>% as.numeric())

    data_scaled <- scale(data_transformed)

    silhouette_scores <- sapply(2:10, function(k) {
      kmeans_result <- kmeans(data_scaled, centers = k, nstart = 25)
      sil <- cluster.stats(dist(data_scaled), kmeans_result$cluster)$avg.silwidth
      return(sil)
    })

    optimal_k <- which.max(silhouette_scores) + 1  
    output$optimal_k_text <- renderText({
      paste("K-Optimal (berdasarkan Silhouette Score) sebanyak", optimal_k)
    })

    kmeans_result <- kmeans(data_scaled, centers = optimal_k, nstart = 25)

    data_with_cluster <- raw_data
    data_with_cluster$cluster <- kmeans_result$cluster

    output$cluster_table <- renderDT({
      datatable(data_with_cluster, options = list(pageLength = 10, scrollX = TRUE))
    })

    output$cluster_plot <- renderPlot({
      fviz_cluster(
        kmeans_result,
        data = data_scaled,
        geom = c("point", "text"),      
        ellipse.type = "convex",         
        palette = "jco",                 
        ggtheme = theme_minimal()
      )
    })
    
    output$cluster_profile <- renderTable({
      cluster_profile <- data_with_cluster %>%
        group_by(cluster) %>%
        summarise(
          across(c(age, absences, G1, G2, G3), ~mean(., na.rm = TRUE), .names = "mean_{.col}")  
        ) %>%
        mutate(
          cluster_category = case_when(
            cluster == 1 ~ "Tinggi",
            cluster == 2 ~ "Rendah",
            TRUE ~ "Lainnya"  
          )
        )
      
      cluster_profile
    })
    
    output$additional_text <- renderUI({
      tags$div(
        style = "text-align: justify;",
        tags$p(
          "Proses clustering ini akan menghasilkan cluster siswa yang memiliki karakteristik serupa yaitu:",
          style = "font-size: 18px; text-align: justify; margin-bottom: 10px;"
        ),
        
        tags$ul(
          style = "padding-left: 20px; margin-top: 10px;",
          tags$li(
            style = "padding: 10px; background-color: #C1E3FC; color: black; font-size: 18px; border-radius: 5px; margin-bottom: 10px;",
            "Cluster 1: Kelompok siswa dengan performa tinggi yang dianggap sebagai siswa berprestasi."
          ),
          tags$li(
            style = "padding: 10px; background-color: #C1E3FC; color: black; font-size: 18px; border-radius: 5px; margin-bottom: 10px;",
            "Cluster 2: Kelompok siswa dengan performa rendah yang masih membutuhkan perhatian khusus, baik melalui bimbingan tambahan maupun strategi pembelajaran yang lebih terarah."
          )
        )
      )
    })
  })
  

  #-------- Tab Tentang Data--------#
  output$data_table <- renderDataTable({
    datatable(data(), options = list(pageLength = 10,scrollX = TRUE))
  })

}
