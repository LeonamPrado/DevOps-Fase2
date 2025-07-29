# Dockerfile

# --- Estágio 1: Builder ---
# Usamos uma imagem completa do Node para instalar dependências e construir o projeto
FROM node:18-alpine AS builder

WORKDIR /app

# Copia os arquivos de definição de pacotes
COPY package*.json ./

# Instala TODAS as dependências, incluindo as de desenvolvimento (para testes, etc.)
RUN npm install

# Copia o restante do código da aplicação
COPY . .

# (Opcional) Se você tivesse um passo de "build", ele viria aqui.
# RUN npm run build


# --- Estágio 2: Production ---
# Usamos uma imagem limpa e leve do Node para rodar a aplicação
FROM node:18-alpine

WORKDIR /app

# Copia os arquivos de pacotes novamente
COPY package*.json ./

# Instala APENAS as dependências de produção, resultando numa imagem menor e mais segura
RUN npm install --omit=dev

# Copia o código da aplicação do estágio anterior (builder)
COPY --from=builder /app .

# Expõe a porta que a sua aplicação usa (ex: 3000 para uma API Express)
EXPOSE 3000

# Comando para iniciar a aplicação quando o container rodar
CMD [ "node", "app.js" ] 
#Altere 'app.js' se seu arquivo principal tiver outro nome