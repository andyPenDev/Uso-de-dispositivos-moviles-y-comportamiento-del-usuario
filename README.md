# Uso-de-dispositivos-moviles-y-comportamiento-del-usuario
El objetivo es identificar por medio de una regresión lineal múltiple los factores relevantes que pueden influir en la cantidad de tiempo  invertida por cada persona en las aplicaciones y aprovechar estos patrones para mejorar la  experiencia de los consumidores.

1.3 Estructura del Informe 
Este informe se organiza en varias secciones clave que permiten analizar el 
comportamiento de las personas de dispositivos móviles.  
1.3.1 Descripción del Dataset 
En esta primera sección se detalla el origen y las características del conjunto de datos 
utilizados para el análisis. También proporciona una breve descripción de cada variable en el 
dataset. 
1.3.2 EDA 
En esta parte se describen las técnicas empleadas para la exploración y visualización de 
los datos. Se utilizan funciones como summary y str para revisar el estado de las variables, 
además se presentan estadísticas descriptivas de las variables, incluyendo rangos, medias, 
medianas y distribuciones, para identificar patrones y tendencias en el uso de dispositivos 
móviles. 
1.3.3 Modelo de Regresión Lineal Múltiple 
Aquí se explica el modelo de regresión lineal múltiple utilizado para predecir el tiempo 
de uso de aplicaciones basado en variables independientes. También se menciona el proceso de 
selección del modelo y la validación de los supuestos, incluyendo la normalidad de los residuos, 
la homocedasticidad, la autocorrelación de errores y la multicolinealidad. 
1.3.4 Bootstrapping   
Por último, se explica la técnica de bootstrapping, que se implementa para generar 
intervalos de confianza y mejorar la precisión del modelo. Donde se compara las distribuciones 
del modelo inicial y después utilizando bootstrapping 
2. Metodología  
2.1. Descripción del Dataset Descripción del dataset utilizado: origen, variables, tamaño, 
y características relevantes.  
La siguiente base de datos fue tomada de la plataforma de ciencia de datos conocida 
como Kaggle. Cuenta con 700 muestras sobre el análisis de los patrones de uso de dispositivos 
móviles y la clasificación del comportamiento de los usuarios. Además, contiene algunos 
apartados como el consumo de batería, tiempo en pantalla y hasta una clasificación del usuario 
de 1 a 5, que va desde el uso leve al uso extremo.  
Variables: 
• User ID (ID usuario) 
• Device Model (modelo del dispositivo) 
• Operating System (sistema operativo): Android o iOS 
• App Usage Time (Tiempo de uso de las aplicaciones):  Tiempo dedicado al, 
uso de las aplicaciones medida en minutos por día. 
• Screen On Time (Tiempo en pantalla):  promedio medido en horas por dían en 
la que panatalla está activa. 
• Battery Drain (consumo de bateria): Consumo diario de batería medida 
miliamperios hora (mAh) 
• Number of Apps Installed (Número de apps instaladas): total de aplicaciones 
disponibles en el dispositivo 
• Data Usage (Uso de datos): Consumo diario de datos móviles en megabytes. 
• Age (edad) 
• Gender (sexo): Hombre o Mujer 
• User Behavior Class (clase de comportamiento del usuario): el patrón va 1 a 5 
dependiendo del uso del dispositivo. 
Por otro lado, el conjunto de datos fue tomado y realizado por estudios de investigación 
en plataformas como Statista y Encuestas Pew Research  
2.2. Análisis Exploratorio de Datos (EDA) Métodos y herramientas utilizadas para el 
EDA. Incluye técnicas para la exploración de datos, visualización, y manejo de valores faltantes 
y atípicos.  
En primer lugar, llamamos la base de datos sobre el uso de dispositivos móviles y el 
comportamiento de los usuarios, luego llamamos las librerías oportunas.  Luego a través de 
funciones como Summary y str, verificamos la condición de cada variable con el fin realizar la 
visualización de datos correctamente. 


<img width="384" height="215" alt="image" src="https://github.com/user-attachments/assets/870c5d20-4223-4559-adea-a80975a85932" />

