require("dotenv").config({ path: "../../.env" });
const express = require("express");
const router = express.Router();
const passport = require("../config/passport");

//imporing controllers
const {
  add_resro,
  add_restro_tables,
  update_restro_tables,
  delete_restro_tables,
  book_table,
  get_restros_by_city,
  get_restros_details,
  get_restros_table_details,
  cancel_booked_table
} = require("../controller/restro");

//public routes
router.post(
  "/get_restros_by_city",
  get_restros_by_city
);

router.post(
  "/get_restros_details",
  get_restros_details
);

router.post(
  "/get_restros_table_details",
  get_restros_table_details
);

//proected routes
router.post(
  "/add_resro",
  passport.authenticate("jwt", { session: false }),
  add_resro
);

router.post(
  "/cancel_booked_table",
  passport.authenticate("jwt", { session: false }),
  cancel_booked_table
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
