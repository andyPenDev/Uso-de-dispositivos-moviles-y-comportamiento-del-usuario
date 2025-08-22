# Uso-de-dispositivos-moviles-y-comportamiento-del-usuario
El objetivo es identificar por medio de una regresión lineal múltiple los factores relevantes que pueden influir en la cantidad de tiempo  invertida por cada persona en las aplicaciones y aprovechar estos patrones para mejorar la  experiencia de los consumidores.

1. Estructura del Informe 
Este informe se organiza en varias secciones clave que permiten analizar el comportamiento de las personas de dispositivos móviles.

1.2. Descripción del Dataset 
En esta primera sección se detalla el origen y las características del conjunto de datos utilizados para el análisis. También proporciona una breve descripción de cada variable en el dataset. 

1.3. EDA 
En esta parte se describen las técnicas empleadas para la exploración y visualización de los datos. Se utilizan funciones como summary y str para revisar el estado de las variables, 
además se presentan estadísticas descriptivas de las variables, incluyendo rangos, medias, medianas y distribuciones, para identificar patrones y tendencias en el uso de dispositivos móviles. 

1.4. Modelo de Regresión Lineal Múltiple 
Aquí se explica el modelo de regresión lineal múltiple utilizado para predecir el tiempo de uso de aplicaciones basado en variables independientes. También se menciona el proceso de selección del modelo y la validación de los supuestos, incluyendo la normalidad de los residuos, la homocedasticidad, la autocorrelación de errores y la multicolinealidad. 

1.5.  Bootstrapping   
Por último, se explica la técnica de bootstrapping, que se implementa para generar intervalos de confianza y mejorar la precisión del modelo. Donde se compara las distribuciones del modelo inicial y después utilizando bootstrapping 

2. Metodología  
2.1. Descripción del Dataset Descripción del dataset utilizado: origen, variables, tamaño, y características relevantes.  La siguiente base de datos fue tomada de la plataforma de ciencia de datos conocida como Kaggle. Cuenta con 700 muestras sobre el análisis de los patrones de uso de dispositivos 
móviles y la clasificación del comportamiento de los usuarios. Además, contiene algunos apartados como el consumo de batería, tiempo en pantalla y hasta una clasificación del usuario de 1 a 5, que va desde el uso leve al uso extremo.

Variables: 
• User ID (ID usuario) 

• Device Model (modelo del dispositivo) 

• Operating System (sistema operativo): Android o iOS 

• App Usage Time (Tiempo de uso de las aplicaciones):  Tiempo dedicado al, uso de las aplicaciones medida en minutos por día. 

• Screen On Time (Tiempo en pantalla):  promedio medido en horas por dían en la que panatalla está activa. 

• Battery Drain (consumo de bateria): Consumo diario de batería medida miliamperios hora (mAh).

• Number of Apps Installed (Número de apps instaladas): total de aplicaciones disponibles en el dispositivo.

• Data Usage (Uso de datos): Consumo diario de datos móviles en megabytes. 
• Age (edad) 

• Gender (sexo): Hombre o Mujer .

• User Behavior Class (clase de comportamiento del usuario): el patrón va 1 a 5 dependiendo del uso del dispositivo. Por otro lado, el conjunto de datos fue tomado y realizado por estudios de investigación 
en plataformas como Statista y Encuestas Pew Research .


2.2. Análisis Exploratorio de Datos (EDA) Métodos y herramientas utilizadas para el EDA. Incluye técnicas para la exploración de datos, visualización, y manejo de valores faltantes y atípicos.  
En primer lugar, llamamos la base de datos sobre el uso de dispositivos móviles y el comportamiento de los usuarios, luego llamamos las librerías oportunas.  Luego a través de funciones como Summary y str, verificamos la condición de cada variable con el fin realizar la visualización de datos correctamente. 


<img width="384" height="215" alt="image" src="https://github.com/user-attachments/assets/870c5d20-4223-4559-adea-a80975a85932" />

DATOS FALTANTES


<img width="274" height="187" alt="image" src="https://github.com/user-attachments/assets/da1d8791-c79b-443c-8ecb-4784a3b663c4" />
El conjunto de datos analizados no presenta valores faltantes en ninguna de las variables evaluadas. Por lo que la base de datos es adecuada para realizar análisis posteriores o aplicar modelos predictivos sin la necesidad de realizar tareas de limpieza relacionadas con datos incompletos. 
<img width="401" height="273" alt="image" src="https://github.com/user-attachments/assets/da563152-c29e-48eb-bf7c-015a77548d03" />
El boxplot muestra un conjunto de datos bien estructurado y sin valores atípicos, lo que facilita el análisis. Las variables reflejan consistencia en ciertos patrones de uso, mientras que las otras muestran alta dispersión lo que sugiere diversidad en los patrones de uso entre los usuarios.

<img width="407" height="341" alt="image" src="https://github.com/user-attachments/assets/2e433719-c20a-49d1-9764-b3254181da70" />

El gráfico muestra cómo los usuarios distribuyen su tiempo diario en aplicaciones móviles. El rango de tiempo más frecuente está al principio cercano a los 0-100 minutos, con una frecuencia 
superior a 50, lo que indica que muchos usuarios usan la aplicación por períodos cortos. Después de los 100 minutos, la frecuencia varía de manera irregular, con fluctuaciones entre rangos más y menos populares. Hay usuarios que alcanzan tiempos de uso más altos, como 500-600 minutos, pero en menor cantidad en comparación con los tiempos cortos. 

<img width="247" height="274" alt="image" src="https://github.com/user-attachments/assets/79d02332-d50c-408f-a3de-565e310f9d21" />

Este gráfico divide a los usuarios según el sistema operativo (iOS y Android). El sistema operativo Android es el más utilizado, representando un 79.1% del total de 
dispositivos. Esto significa que casi 4 de cada 5 dispositivos utilizan Android. iOS, el sistema operativo de Apple, tiene una participación del 20.9%, aunque es un porcentaje significativo, se encuentra por debajo de Android. A nivel general, los usuarios prefieren Android como sistema operativo para sus dispositivos. Esto podría deberse a diversos factores como la mayor variedad de dispositivos Android disponibles, precios más accesibles o características específicas. 

<img width="404" height="244" alt="image" src="https://github.com/user-attachments/assets/e13480aa-29cd-49cb-a413-99650e20d9f7" />

Este gráfico muestra cuántos usuarios tienen instaladas distintas cantidades de 
aplicaciones en sus dispositivos. La mayor parte de los usuarios tiene entre 15 y 25 aplicaciones instaladas, como lo indican las barras más altas. Esto sugiere este rango como el estándar promedio entre usuarios. A partir de las 30 aplicaciones instaladas, el número de usuarios empieza a descender de manera constante, por lo que no es común instalar una cantidad elevada de aplicaciones. Aunque hay usuarios con más de 75 aplicaciones, su proporción es mucho menor.

<img width="396" height="335" alt="image" src="https://github.com/user-attachments/assets/f098808c-d79c-4fa4-99ae-bcba1af28e91" />

Este gráfico cruza datos sobre tiempo de uso de aplicaciones con género y sistema operativo presentando una comparación visual del tiempo que usuarios de diferentes géneros (hombres y mujeres) y sistemas operativos (Android e iOS) dedican al uso de una aplicación específica.  Tanto hombres como mujeres que utilizan Android muestran un patrón similar en el tiempo de uso. En iOS, el patrón es similar al de Android. Sin embargo, la distribución parece ser un poco más dispersa, con menos usuarios concentrándose en el pico máximo. 
Las mujeres en ambos sistemas operativos muestran un patrón de uso bastante similar al de los hombres. No hay diferencias significativas en términos de tiempo promedio de uso o distribución de los datos.

2.3. Modelado de Regresión Lineal Múltiple Descripción del modelo de regresión 
lineal múltiple: variables dependientes e independientes, procedimiento de ajuste, y evaluación del modelo.  

<img width="186" height="59" alt="image" src="https://github.com/user-attachments/assets/fe2a5766-66d0-422e-8f4e-ef948eafb944" />

La variable dependiente que se decidió usar para el modelo, fue el tiempo de uso de aplicaciones (App Usage Time).  

<img width="413" height="260" alt="image" src="https://github.com/user-attachments/assets/7084305d-984a-454e-9d8c-2594211e27b0" />

El modelo de regresión revela que el número de aplicaciones instaladas, el tiempo de pantalla encendida, el consumo de datos y el consumo de batería son las variables más significativas para predecir el tiempo de uso de aplicaciones, con impactos positivos y relevantes. Cada aplicación instalada aumenta en promedio 1,75 minutos el uso, y un minuto adicional de tiempo de pantalla lo incrementa en 12,27 minutos. En contraste, variables como sistema operativo, género y edad no tienen una influencia significativa en el modelo.

<img width="401" height="263" alt="image" src="https://github.com/user-attachments/assets/bdaa7d76-041a-4333-8a8c-90e93d4192c3" />

Este modelo ajustado con variables escaladas con un R-cuadrado Ajustado de 0.9437, esto indica que el modelo explica el 94.43% de la variación en el tiempo de uso 
de aplicaciones, y se observa que las variables más importantes para predecir el tiempo de uso de aplicaciones son el número de aplicaciones instaladas, el tiempo de pantalla encendida, el consumo de batería y el uso de datos, todas con efectos positivos significativos. En contraste, variables como el sistema operativo y la edad no tienen un impacto relevante en este contexto. La estandarización permite comparar la magnitud relativa de los efectos, destacando que el número de aplicaciones instaladas tiene el mayor impacto. 

<img width="374" height="515" alt="image" src="https://github.com/user-attachments/assets/c816fab7-4887-46f6-b4c1-7acb8bfa59a3" />

El proceso de selección por AIC identificó un modelo más eficiente eliminando las variables no significativas como edad y sistema operativo, lo que redujo el AIC de 2007.46 a 2011.37. El 
modelo final incluye las variables más relevantes: número de aplicaciones instaladas, tiempo de pantalla encendida, consumo de batería y uso de datos, todas altamente significativas y con impacto positivo en el tiempo de uso de aplicaciones. Este modelo balancea simplicidad y ajuste, enfocándose en los predictores claves para explicar la variación en el tiempo de uso.

Validación de supuestos 
1. Normalidad de los residuos

<img width="377" height="236" alt="image" src="https://github.com/user-attachments/assets/81b5a7bd-2dae-4d54-b6e5-e411a9363745" />

El histograma de los residuos muestra una distribución aproximadamente normal, con una forma de campana simétrica alrededor de 0, lo que indica que los errores no están sesgados hacia valores positivos o negativos. La mayor concentración de residuos cerca de 0 sugiere que el modelo predice bien la mayoría de los valores, y no se observan valores atípicos. 

<img width="347" height="236" alt="image" src="https://github.com/user-attachments/assets/91370588-5ca1-429d-b1f6-11b0f38df0cd" />

Teniendo en cuenta los gráficos, notamos que los residuos del modelo se distribuyen de manera normal, el cual es comprobado con los tests respectivos para medir la normalidad.

<img width="197" height="94" alt="image" src="https://github.com/user-attachments/assets/bad8780d-5117-45e0-9386-58cfa11acfab" />

Determina si los residuos siguen una distribución normal, un supuesto. Como el valor p 0.3866 es mayor a un nivel de significancia común 0.05, no se rechaza la hipótesis nula de normalidad. Esto indica que los residuos del modelo pueden considerarse normalmente distribuidos. 

2. Homocedasticidad
   
<img width="223" height="80" alt="image" src="https://github.com/user-attachments/assets/0692cac3-8748-4836-bfe2-ca0d4a922137" />

Evalúa si los residuos presentan homocedasticidad. Dado que el valor p es extremadamente pequeño mucho menor que 0.050, se rechaza la hipótesis nula de homocedasticidad. 

<img width="398" height="299" alt="image" src="https://github.com/user-attachments/assets/bbed99a3-42e9-45d1-9bb4-78585f03abd9" />

3. No autocorrelación de errores 

<img width="320" height="58" alt="image" src="https://github.com/user-attachments/assets/1098dad9-a244-4513-b8a4-f69bed44a7e7" />

Determina si los residuos del modelo están autocorrelacionados, lo cual violaría los supuestos de independencia de los errores en un modelo de regresión. Un estadístico DurbinWatson cercano a 2 indica que no hay autocorrelación en los residuos. Dado que el valor p 0,7835 es mucho mayor que 0,05 no se rechaza la hipótesis nula de no autocorrelación. Esto significa que los errores no presentan una relación temporal significativa.

4. Multicolinealidad

<img width="380" height="76" alt="image" src="https://github.com/user-attachments/assets/47fb1a42-7da6-4115-9444-5a2cdf069017" />

Evalúa la multicolinealidad entre las variables independientes, es decir, si hay alta valoración entre ellas, lo que puede afectar la estabilidad de los coeficientes del modelo. Un VIF mayor a 10 generalmente indica un alta multicolinealidad. Las variables Number_of_Apps_Installed , Screen_On_Time , Battery_Drain , y Data_Usage presentan valores de VIF muy altos (>10), lo 
que indica que están fuertemente correlacionados entre sí. Gender , Operating_System , y Age no presentan problemas de multicolinealidad, ya que tienen VIF cercano a 1. 

2.4. Bootstrapping Explicación de la técnica de bootstrapping: cómo se implementa, el número de réplicas utilizadas y la metodología para calcular intervalos de confianza 
En este análisis se ajustó un modelo de regresión lineal para predecir el tiempo de uso de aplicaciones móviles (App_Usage_Time) en función de varias variables explicativas. Se utilizó bootstrap (1000 iteraciones) para estimar la distribución de los coeficientes del modelo, permitiendo obtener estadísticas más robustas de las estimaciones, como :La media (efecto promedio de cada predictor), la desviación estándar (incertidumbre), los intervalos de confianza del 95% (percentiles 2.5% y 97.5%). El análisis permitió identificar los predictores más importantes y evaluar la confiabilidad de sus efectos sobre el tiempo de uso de aplicaciones.

<img width="376" height="297" alt="image" src="https://github.com/user-attachments/assets/9799ef41-1945-4cc2-b986-0ed9a435366c" />

Comparación 
Distribución del tiempo en pantalla sin remuestreo


<img width="293" height="257" alt="image" src="https://github.com/user-attachments/assets/9a5b439f-0e29-4b22-bfa3-d3bec9576d3c" />

Distribución del tiempo en pantalla con remuestreo 

<img width="326" height="264" alt="image" src="https://github.com/user-attachments/assets/509e97cf-162c-47cd-919a-5b3142ab9138" />

<img width="405" height="155" alt="image" src="https://github.com/user-attachments/assets/7c06f020-036d-4f97-809d-64ef9de898e3" />

- Intervalos de confianza para los coeficientes del modelo 
En este caso, se obtuvieron los resultados de los intervalos de confianza de los coeficientes con el fin de evaluar si son estadísticamente significativos.  Si observamos, por ejemplo, el número de aplicaciones instaladas que va del 2,5% al 97,5%, puede constatar que a medida que aumenta el número de aplicaciones instaladas, se espera un aumento significativo en el tiempo de uso de aplicaciones (variable dependiente). Por otro lado, el intervalo en que se encuentra la edad indica que no tiene un efecto significativo sobre el modelo.

<img width="386" height="221" alt="image" src="https://github.com/user-attachments/assets/43f52a6e-70b3-466e-996c-9f4ceec0466b" />

Notamos que al tener un valor p alto (generalmente mayor que 0.05) sugiere que no se rechaza la hipótesis nula, lo que significa que los coeficientes siguen una distribución normal. Todos los valores p para los coeficientes son mayores que 0.05, lo que indica que no se rechaza la hipótesis nula en ninguno de los casos. En otras palabras, según el test de ShapiroWilk, los coeficientes del modelo (los resultados del bootstrapping) siguen una distribución normal.  

Conclusión 
Mediante el análisis del conjunto de datos sobre el uso de dispositivos móviles y el comportamiento de los usuarios permitió identificar patrones claves que influyen en el tiempo de uso de las aplicaciones. A través de exploración de datos, se observó que variables como cantidad de aplicaciones instaladas, el tiempo de pantalla encendida, el consumo de batería y el uso de datos son los principales predictores del comportamiento de las personas. El modelo de regresión múltiple desarrollado logra mostrar una alta capacidad explicativa, ya que con un R-cuadrado ajustado del 94.43%, indicando así que el modelo logra predecir adecuadamente el tiempo de uso de las aplicaciones. Sin embargo, se identificaron problemas de multicolinealidad entre algunas variables, lo cual se corrigió eliminado las que tuvieran una alta 
correlación, haciendo el modelo más estable y dando una interpretación más precisa de los coeficientes. 

Por último, el uso de técnicas como el brootstrapping de supuestos proporciono un enfoque más fiable en la evaluación de los coeficientes y sus intervalos de confianza, lo que permitió tener 
deducciones con mayor certeza. En general, este análisis no solo proporciona información sobre el comportamiento de los usuarios, sino también aporta una visión más clara sobre los hábitos de 
los usuarios de dispositivos móviles y como estos patrones pueden ser aprovechados para mejorar la experiencia del usuario como la estrategia comercial de las aplicaciones móviles, ya que ayuda a comprender mejor los factores que logran influir en el uso de estas y así las empresas pueden diseñar experiencias más personalizadas, optimizar sus servicios y desarrollar estrategias de monetización más efectivas. 


Referencias 
Khorasani, V. (n.d.). Mobile device usage and user behavior dataset [Conjunto de datos] 
.Kaggle. https://www.kaggle.com/datasets/valakhorasani/mobile-device-usage-and-user
behavior-dataset/data



