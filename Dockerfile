# Definindo imagem base
FROM node:latest

# Criando diretório de trabalho na imagem
WORKDIR /app

# Copiando o package.json e o yarn.lock (ou package-lock.json se estiver usando o npm) para a imagem
COPY package*.json ./

# Instalando as dependências da aplicação
RUN yarn install

# Copiando todos os arquivos da aplicação para a imagem
COPY . .

# Compilando a aplicação TypeScript
RUN yarn build

# Expondo a porta que a aplicação está escutando
EXPOSE 80

# Iniciando a aplicação
CMD ["yarn", "start"]