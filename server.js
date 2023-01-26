const express = require('express')
const app = express()

const { hostname } = require('os');
const port = 8080;

app.use(express.static('public'))

app.get('/', function (req, res) {
  res.sendFile(process.cwd() + '/index.html');
});

app.listen(port, hostname, () => {
  console.log(`Servidor corriendo en http://${hostname()}:${port}/`)
})