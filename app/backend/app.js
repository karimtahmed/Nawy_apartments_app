const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const pool = require('./database/db');
const Joi = require('joi');

// Define the validation schema
// Middleware to parse JSON bodies
app.use(express.json());
const apartmentSchema = Joi.object({
  name: Joi.string().min(3).max(100).required(),
  location: Joi.string().min(3).max(100).required(),
  price: Joi.number().positive().required(),
  description: Joi.string().optional(), // Optional or .required() based on your need
  available_types: Joi.string().optional(),
  developer: Joi.string().optional(),
  image_url: Joi.string().optional() // You can specify a URL format if needed
});

async function getApartments(id = null) { // Accept an optional 'id' parameter
  try {
    let query = 'SELECT * FROM apartments';
    let values = [];

    if (id) {
      query += ' WHERE id = $1'; // Use parameterized query to prevent SQL injection
      values.push(id);
    }

    const result = await pool.query(query, values);
    // Log the results
    console.log('Data retrieved from database:');
    console.log(result.rows);
    return result.rows; // Return the rows instead of the entire result object

  } catch (error) {
    console.error('Error retrieving data:', error);
  }
}
async function getProject(dev = null) {
  try {
    let query = 'SELECT * FROM projects';
    let values = [];

    if (dev) {
      dev = decodeURIComponent(dev);  // Decode URL-encoded developer name
      query += ' WHERE developer = $1'; // Use parameterized query to prevent SQL injection
      values.push(dev);
    }

    const result = await pool.query(query, values);
    console.log('Data retrieved from database:');
    console.log(result.rows);
    return result.rows; // Return the rows instead of the entire result object

  } catch (error) {
    console.error('Error retrieving data:', error);
  }
}
async function addApartment(name, location, price, description, available_types, developer, image_url) {
  try {
    let query = 'INSERT INTO apartments (name, location, price, description, available_types, developer, image_url) VALUES ($1, $2, $3, $4, $5, $6, $7)'
    let values = [];
    values.push(name, location, parseFloat(price), description, available_types, developer, image_url);
    console.log(values)
    const result = await pool.query(query, values);
    // Log the results
    console.log(result);
    return result; // Return the rows instead of the entire result object

  } catch (error) {
    console.error('Error creating data:', error);
  }
}

app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*"); // Update "*" to restrict to specific origins if needed
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

// Route to get all apartments
app.get('/', async (req, res) => {
  try {
    const apartments = await getApartments(); // Await the result for all apartments
    res.json(apartments); // Send the data as JSON
  } catch (error) {
    res.status(500).send('Error retrieving apartments');
  }
});

// Route to get a single apartment by ID
app.get('/:id', async (req, res) => {
  try {
    const apartmentId = req.params.id; // Get the ID from the request params
    const apartments = await getApartments(apartmentId); // Await the result for the specific ID

    if (apartments.length === 0) {
      return res.status(404).json({ message: 'Apartment not found' });
    }

    res.json(apartments[0]); // Send the single apartment as JSON

  } catch (error) {
    res.status(500).send('Error retrieving apartment');
  }
});
app.get('/project/:dev', async (req, res) => {
  try {
    const projectDev = req.params.dev;
    console.log(`Received developer name: ${projectDev}`); // Log the developer name received

    const projects = await getProject(projectDev);

    if (projects.length === 0) {
      return res.status(404).json({ message: 'Project not found for ' + projectDev });
    }

    res.json(projects); // Send the projects as JSON

  } catch (error) {
    res.status(500).send('Error retrieving project');
  }
});

app.post('/apartment', async (req, res) => {
  const { error } = apartmentSchema.validate(req.body);

  if (error) {
    return res.status(400).json({ message: error.details[0].message });
  }

  try {
    const { name, location, price, description, available_types, developer, image_url } = req.body; // Extract data from req.body
    const apartments = await addApartment(name, location, price, description, available_types, developer, image_url); // Await the result for the specific apartment

    if (apartments.rowCount === 0) {
      return res.status(404).json({ message: 'Apartment not created' });
    }

    res.json({ message: 'Apartment created successfully' }); // Send the confirmation as JSON
  } catch (error) {
    res.status(500).send('Error creating apartment');
  }
});


// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
