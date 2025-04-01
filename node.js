// app.js
const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');

// Express alkalmazás létrehozása
const app = express();

// Middleware-ek beállítása
app.use(bodyParser.json()); // Kérés testének JSON formátumban történő kezelése



const connection = mysql.createConnection({
  host: 'localhost', // Az adatbázis hosztja (például localhost)
  user: 'root',      // Az adatbázis felhasználója
  password: '', // Az adatbázis jelszava
  database: 'cattalodge' // Az adatbázis neve
});

connection.connect(err => {
  if (err) {
    console.error('Hiba a kapcsolódás során:', err.stack);
    return;
  }
  console.log('Sikeres kapcsolódás, ID:', connection.threadId);
});

module.exports = connection;

// Az alapértelmezett oldal
app.get('/', (req, res) => {
  res.send('Helló, Express!');
});

// Felhasználó hozzáadása (POST kérés)
app.post('/add-user', async (req, res) => {
  const { name, email } = req.body;

  // Ellenőrizzük, hogy a name és email megvan-e
  if (!name || !email) {
    return res.status(400).send('A név és email mezők kitöltése kötelező!');
  }

  try {
    // Új felhasználó létrehozása
    const user = new User({
      name,
      email
    });

    // Felhasználó mentése az adatbázisba
    await user.save();
    res.status(201).send(`Felhasználó hozzáadva: ${name}`);
  } catch (err) {
    console.error('Hiba történt a felhasználó hozzáadásakor:', err);
    res.status(500).send('Belső hiba történt.');
  }
});

// Felhasználók listázása (GET kérés)
app.get('/users', async (req, res) => {
  try {
    const users = await User.find(); // Az összes felhasználó lekérése az adatbázisból
    res.status(200).json(users);
  } catch (err) {
    console.error('Hiba történt a felhasználók lekérésekor:', err);
    res.status(500).send('Belső hiba történt.');
  }
});

// Az alkalmazás futtatása
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Szerver fut a ${PORT} porton`);
});


