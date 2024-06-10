# Usa una imagen base oficial de Node.js
FROM node:20.11.1

# Establece el directorio de trabajo en /app
WORKDIR /var/www/html/erp_asmed_medical/frontend

# Copia package.json y package-lock.json
COPY package*.json ./

# Instala las dependencias
RUN npm install

# Copia el resto de los archivos del proyecto
COPY . .

# Expone el puerto 5173
EXPOSE 5173

# Define el comando de ejecución
CMD ["npm", "run", "dev"]

