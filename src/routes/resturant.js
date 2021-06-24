require("dotenv").config({ path: "../../.env" });
const express = require("express");
const router = express.Router();
const passport = require("../config/passport");

//imporing controllers
const {add_resro,add_restro_tables,update_restro_tables,delete_restro_tables,book_table} = require("../controller/restro");

//public routes

//proected routes
  router.post(
    "/add_resro",
    passport.authenticate("jwt", { session: false }),
    add_resro
  );

  router.post(
    "/add_restro_tables",
    passport.authenticate("jwt", { session: false }),
    add_restro_tables
  );  

  router.put(
    "/update_restro_tables",
    passport.authenticate("jwt", { session: false }),
    update_restro_tables
  ); 

  router.delete(
    "/delete_restro_tables",
    passport.authenticate("jwt", { session: false }),
    delete_restro_tables
  ); 

  router.post(
    "/book_table",
    passport.authenticate("jwt", { session: false }),
    book_table
  );

module.exports = router;
