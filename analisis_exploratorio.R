##LLamado de las librerias

library(data.table)
library(tidyverse)
library(car)
library(boot)
library(ggplot2)
library(dplyr)
library(viridis)

#Asignamos nombre a la base de datos
data <- fread(file = "user_behavior_dataset.csv")

#Examinamos la escala de los datos
str(data)

colnames(data)

#cambiamos a factor las variables con el fin de realizar la exploración de los datos
data2<-data %>% 
  mutate(Device_Model=as.factor(Device_Model), Operating_System=as.factor(Operating_System), Gender=as.factor(Gender),
              User_Behavior_Class=as.factor(User_Behavior_Class))

#Verificamos 
summary(data2)


#Realizamos una distribución para el tiempo de uso en aplicaciones
ggplot(data2, aes(x = `App_Usage_Time_(min/day)`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black", alpha = 0.7) + # Línea KDE
  labs(
    title = "Distribution del Tiempo de uso de la aplicación (min/day)",
    x = "Tiempo de uso de la aplicación",
    y = "Frequency"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) # Centrar título




# los datos del histograma 
mi_histograma <- hist(data2$`App_Usage_Time_(min/day)`, breaks = 30, plot = FALSE)

# Crear un marco de datos con los intervalos y frecuencias
datos_histograma <- data.frame(
  Intervalo = paste(head(mi_histograma$breaks, -1), tail(mi_histograma$breaks, -1), sep = " - "),
  Frecuencia = mi_histograma$counts
)

# Ver los datos tabulares
print(datos_histograma)

summary(datos_histograma)


#Distribución de datos que muestra numero de apas instaladas segun el número de personas

colnames(data2)
ggplot(data2, aes(x = `Number_of_Apps_Installed`)) +
  geom_bar(aes(fill = as.factor(`Number_of_Apps_Installed`)), color = "black") + # Color por categoría
  scale_fill_viridis_d(option = "viridis", direction = -1) + # Paleta viridis
  labs(
    title = "Count of Users by Number of Apps Installed",
    x = "Number of Apps Installed",
    y = "Count",
    fill = "Apps Installed"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 20), # Centrar título
    axis.text = element_text(size = 14),              # Tamaño del texto de los ejes
    axis.title = element_text(size = 16),             # Tamaño de los títulos de los ejes
    legend.position = "none"                          # Eliminar leyenda si no es necesaria
  ) +
  theme(plot.margin = margin(20, 20, 20, 20))       


tabla_frecuencias <- data2 %>%
  group_by(`Number_of_Apps_Installed`) %>%
  summarise(Count = n(), .groups = "drop")
tabla_frecuencias

tabla_frecuencias_categoria <- data2 %>%
  group_by(`Number_of_Apps_Installed`) %>%
  summarise(Count = n(), .groups = "drop") %>%
  arrange(`Number_of_Apps_Installed`) # Ordenar por categoría

tabla_frecuencias_categoria


ggplot(data2, aes(x = `Number_of_Apps_Installed`)) +
  geom_bar(aes(fill = as.factor(`Number_of_Apps_Installed`)), color = "black") +
  scale_fill_viridis_d(option = "viridis", direction = -1) +
  labs(
    title = "Count of Users by Number of Apps Installed",
    x = "Number of Apps Installed",
    y = "Count",
    fill = "Apps Installed"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 20),
    axis.text = element_text(size = 14),
    axis.title = element_text(size = 16),
    legend.position = "none"
  ) +
  theme(plot.margin = margin(20, 20, 20, 20)) +
  geom_text(stat = "count", aes(label = ..count..), vjust = -0.5, size = 3)

##GRÁFICO DE TORTA
# Contar las ocurrencias de cada sistema operativo
conteo<- table(data2$`Operating_System`)

# Crear el gráfico de pastel

ggplot(data = as.data.frame(conteo), aes(x = "", y = Freq, fill = Var1)) +
  geom_bar(stat = "identity", width = 1, show.legend = FALSE) +  # Crear el gráfico de barras para el pastel
  coord_polar(theta = "y") +  # Convertir el gráfico de barras a pie
  scale_fill_manual(values = c("skyblue", "salmon")) +  # Colores personalizados
  labs(
    title = "Operating System Distribution",
    y = NULL,  # Eliminar la etiqueta del eje Y
    x = NULL  # Eliminar la etiqueta del eje X
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 20),  # Centrar título
    axis.text = element_blank(),  # Eliminar los textos del eje
    axis.ticks = element_blank()  # Eliminar las marcas de los ejes
  ) +
  geom_text(
    aes(label = paste0(Var1, ": ", round(Freq / sum(Freq) * 100, 1), "%")),  # Agregar nombre + porcentaje
    position = position_stack(vjust = 0.5),  # Colocar los textos en el centro de cada sector
    size = 6
  )



#valores atipicos
library(plotly)

df_long <- data2 %>%
  select(where(is.numeric)) %>%  # Seleccionar solo columnas numéricas
  pivot_longer(everything(), names_to = "variable", values_to = "value") 

# Crear el boxplot
g2 <- ggplot(df_long, aes(x = variable, y = value)) +
  geom_boxplot() +
  theme_minimal() +
  coord_flip() +
  labs(title = "Boxplot de Variables Numéricas",
       x = "Variable",
       y = "Valor")
ggplotly(g2)




library(tidyr)

#districución de frecuencias de tiempo de uso de la aplicaciones por genero

gg2<-ggplot(data2, aes(x = `App_Usage_Time_(min/day)`)) +
  geom_histogram(bins = 20, fill = 'lightsteelblue', color = 'black', alpha = 0.7) +  # Histograma
  facet_grid(Gender ~ `Operating_System`, scales = 'free_y', labeller = label_both) +  # Facetado por Gender y OS
  labs(
    title = "App Usage Time by OS and Gender",
    x = "App Usage Time (min/day)",
    y = "Frequency"
  ) +
  theme_minimal() +  
  theme(
    plot.title = element_text(hjust = 0.5, size = 16),  
    strip.text = element_text(size = 12)  
  )
ggplotly(gg2)


data2 <- data2 %>%
  mutate(App_Usage_Time_Hours = `App_Usage_Time_(min/day)` / 60)

# Graficar el histograma con los datos en horas
gg3<-ggplot(data2, aes(x = App_Usage_Time_Hours)) +
  geom_histogram(bins = 20, fill = 'lightsteelblue', color = 'black', alpha = 0.7) +  # Histograma
  facet_grid(Gender ~ `Operating_System`, scales = 'free_y', labeller = label_both) +  # Facetado por Gender y OS
  labs(
    title = "App Usage Time by OS and Gender",
    x = "App Usage Time (hours/day)",
    y = "Frequency"
  ) +
  theme_minimal() +  
  theme(
    plot.title = element_text(hjust = 0.5, size = 16),  # Centrar el título
    strip.text = element_text(size = 12)               # Tamaño del texto en los facetas
  )
ggplotly(gg3)

##### 

###Distribución por modelo del dispositivo y su sistema operativo

ggplot(data2, aes(y = `Device_Model`, fill = `Operating_System`)) +
  geom_bar(stat = "count", position = "stack", show.legend = TRUE) +  # Contar y apilar las barras
  geom_text(
    stat = "count", 
    aes(label = ..count..), 
    position = position_stack(vjust = 0.5),  # Ubicar etiquetas al centro de cada segmento
    size = 4,                               # Tamaño del texto
    color = "white"                         # Color del texto
  ) +
  labs(
    title = "Count of Users by Device Model and Operating System",
    x = "Count",
    y = "Device Model"
  ) +
  scale_fill_manual(values = c("lightskyblue2", "lightskyblue4")) +  # Colores personalizados para los sistemas operativos
  theme_minimal() +  # Tema minimalista
  theme(
    plot.title = element_text(hjust = 0.5, size = 16),  # Centrar y ajustar tamaño del título
    legend.title = element_text(size = 12),  # Título de la leyenda
    legend.position = "right"  # Ubicación de la leyenda
  )

datos_grafico <- data2 %>%
  group_by(Device_Model, Operating_System) %>%
  summarise(Count = n(), .groups = "drop") 
datos_grafico

#####


age_usage <- data2 %>%
  group_by(Age) %>%
  summarise(avg_usage = mean(`App_Usage_Time_(min/day)`, na.rm = TRUE))

# Crear el gráfico de líneas
ggplot(age_usage, aes(x = Age, y = avg_usage)) +
  geom_line(color = 'mediumpurple') +  # Línea verde
  geom_point(color = 'mediumpurple') +  # Agregar puntos a la línea
  labs(
    title = "Age vs. Average App Usage Time",
    x = "Age",
    y = "Average App Usage Time (min/day)"
  ) +
  theme_minimal() +  # Tema minimalista
  theme(
    plot.title = element_text(hjust = 0.5, size = 16)  # Centrar el título
  )







#Modelo
#desde aqui cambié de data2 a data
library(forcats)

colnames(data)<-c("ID", "Device_Model", "Operating_System", "App_Usage_Time", "Screen_On_Time", "Battery_Drain", "Number_of_Apps_Installed", "Data_Usage", "Age","Gender", "User_Behavior_Class")

fit <- lm(App_Usage_Time ~ Number_of_Apps_Installed + Screen_On_Time + Gender + Battery_Drain +
            Operating_System + Data_Usage + Age, data = data )
summary(fit)




#ESTANDARIZACIÓN OPCIONAL

df2 <- data %>%
  mutate(across(where(is.numeric), ~ scale(.)))

fit_scaled <- lm(App_Usage_Time ~ Number_of_Apps_Installed + Screen_On_Time + Battery_Drain + Operating_System +
                   Data_Usage + Age, data = df2)

summary(fit_scaled)

##Akaike

step(object = fit_scaled, direction = "both", trace = 1)





#VALIDACION DE SUPUESTOS

#PRIMERO: NORMALIDAD DE LOS RESIDUOS
# Q-Q plot
qqnorm(residuals(fit))
qqline(residuals(fit))
hist(residuals(fit))

# Prueba de Shapiro-Wilk
shapiro.test(residuals(fit))
#menor al 5%, no hay normalidad en los residuos


#SEGUNDO: HOMOCEDASTICIDAD
# Gráfico de residuos vs. valores ajustados
plot(fit$fitted.values, residuals(fit))
abline(h = 0, col = "red")

# Prueba de Breusch-Pagan
library(lmtest)
bptest(fit)
#0.12 es mayor al 5%, existe homoscedasticidad


#TERCERO: NO AUTOCORRELACION DE ERRORES
library(car)
library(lmtest)

dwtest(fit)
#la prueba de dw dio 1.9839, el valor es cercano a 2, por ende no hay autocorrelacion de los errores


#CUARTO: MULTICOLINEALIDAD
vif(fit)
#expieriencia presenta multicolinealidad

library(ggExtra)
colnames(data2)

#AQUI VOLVI A CAMBIAR DE DATA2 A DATA
datos3<-data %>% 
  mutate(log_screen=log(Screen_On_Time))

library(ggplot2)

g4 <- ggplot(data, aes(sample= Screen_On_Time))+stat_qq(col="red")+geom_qq_line (col="blue")+ labs(title = "Distribución Screen_On_Time")+theme(plot.title = element_text(hjust = 0.5))
ggMarginal(g4, type="histogram", fill="steelblue", col="darkblue")

fit <- lm(App_Usage_Time ~ Number_of_Apps_Installed + Screen_On_Time + Gender + 
            Battery_Drain + Operating_System + Data_Usage + Age, data = data)

# Extraer los residuos y valores ajustados
residuos <- residuals(fit)
ajustados <- fitted(fit)

# Crear un dataframe con las observaciones originales, residuos y valores ajustados
tabla_residuos <- data.frame(
  Observado = data$App_Usage_Time,
  Ajustado = ajustados,
  Residuo = residuos
)

# Mostrar las primeras filas
head(tabla_residuos)





####MODELO 2#######


model_coefficients <- function(data, indices) {
  sampled_data <- data[indices, ]
 model <- lm(App_Usage_Time ~ Number_of_Apps_Installed + Screen_On_Time + Gender + 
               + Operating_System + Age, data = sampled_data)
  
  return(coef(model))
}

#aqui tambien de data2 a data
set.seed(123) # Semilla Para la reproducibilidad
results <- boot(data = data, statistic = model_coefficients, R = 1000)


results_df <- as.data.frame(results$t)
names(results_df) <- names(coef(lm(App_Usage_Time ~ Number_of_Apps_Installed + Screen_On_Time + Gender + 
                                     + Operating_System + Age, data = data)))
summary_results <- results_df %>%
  summarise(across(everything(), list(
    Mean = mean,
    SD = sd,
    `2.5%` = ~ quantile(., 0.025),
    `97.5%` = ~ quantile(., 0.975)
  )))
print(summary_results)



ggplot(results_df, aes(x = `(Intercept)`)) +
  geom_histogram(binwidth = 0.5, fill = "lightblue", color = "black") +
  labs(title = "Distribución del Coeficiente del Intercepto",
       x = "Valor del Coeficiente del Intercepto",
       y = "Frecuencia") +
  theme_minimal()


# Ajusta el tamaño del bin para ver si el histograma aparece correctamente
ggplot(results_df, aes(x = Screen_On_Time)) +
  geom_histogram(fill = "lightgreen", color = "black") +
  labs(title = "Distribución del Coeficiente de tiempo en pantalla",
       x = "Valor del Coeficiente de tiempo",
       y = "Frecuencia") +
  theme_minimal()



g5 <- ggplot(results_df, aes(sample=Screen_On_Time))+stat_qq(col="red")+geom_qq_line(col="blue")+
  labs(title = "QQ Plot del Coeficiente Screen_On_Time")+theme(plot.title = element_text(hjust = 0.5))
ggMarginal(g5, type="histogram", fill="steelblue", col="darkblue")
 



coef_ic <- results_df %>%
  summarise(across(everything(), list(
    `2.5%` = ~ quantile(., 0.025),
    `97.5%` = ~ quantile(., 0.975)
  )))
print(coef_ic)


# 3. Aplicar el test de Shapiro-Wilk a cada columna de los coeficientes
shapiro_results <- apply(results_df, 2, function(x) shapiro.test(x)$p.value)

# 4. Mostrar los resultados del test de Shapiro-Wilk para cada coeficiente
shapiro_results

