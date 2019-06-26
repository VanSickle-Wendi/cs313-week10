var express = require('express');
var app = express();

const { Pool } = require('pg');

const connectionString = process.env.DATABASE_URL;
const pool = new Pool({connectionString: connectionString});

app.set('port', (process.env.PORT || 5000));

//:id is a RESTful way and works with req.params
//app.get('/getPerson/:id', getPerson);
app.get('/getPerson', getPerson);

app.listen(app.get('port'), function() {
   console.log("Listening on port: ", app.get('port'));
});

function getPerson(req, res) {
   console.log("Getting person information.");
   
   //re.params in a RESTful way and works with :id
   //var id = req.params.id;
   var id = req.query.id;
   console.log("Retrieving person with id: ", id);
   
   getPersonFromDb(id, function(error, result) {
      console.log("Back from the getPersonFromBb function: ", result);
   })
   
   var result = {id: 2, first_name: "Wendi", last_name: "Van Sickle", dob: "1969-06-28"};
   
   res.json(result);
}

function getPersonFromDb(id, callback) {
   console.log("getPersonFromDb called with id ", id);
   
   var sql = "SELECT id, first, last, birthdate From person WHERE ID = $1::int";
   var params = [id];
   
   pool.query(sql, params, function(err, result) {
      if (err) {
         console.log("An error with the DB occurred");
         console.log(err);
         callback(err, null);
      }
      console.log("Found DB result: " + JSON.stringify(result.rows));
      
      callback(null, result.rows);
   });
}