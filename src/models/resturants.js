const db = require('../database/db');

const resturants = db.Model.extend({
    tableName: "resturants",
  }); 

const resturant_closed = db.Model.extend({
    tableName: "resturant_closed",
  });

const resturant_tables = db.Model.extend({
    tableName: "resturant_tables",
  });  
  
const resturant_tables_booking = db.Model.extend({
    tableName: "resturant_tables_booking",
  });

  

  module.exports = {
    resturants,
    resturant_closed,
    resturant_tables_booking,
    resturant_tables
  };