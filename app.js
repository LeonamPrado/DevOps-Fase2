// app.js

// Importa o módulo 'http' nativo do Node.js para criar um servidor web.
const http = require('http');

// Define a porta em que o servidor vai escutar.
// Usamos 3000, que é a mesma porta que expomos no Dockerfile.
const port = 3000;

// Cria o servidor. A função dentro do createServer é executada
// toda vez que uma requisição chega ao servidor.
const server = http.createServer((req, res) => {
  // Define o código de status da resposta como 200 (OK).
  res.statusCode = 200;

  // Define o tipo de conteúdo da resposta como texto simples.
  res.setHeader('Content-Type', 'text/plain');

  // Escreve a mensagem de resposta que será exibida no navegador.
  res.end('Ola, DevOps! Meu container esta funcionando!\n');
});

// Inicia o servidor e o faz "escutar" na porta definida.
// A mensagem no console.log aparecerá no log do seu container Docker.
server.listen(port, () => {
  console.log(`Servidor rodando na porta ${port}`);
});