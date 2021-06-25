require("dotenv").config({ path: "../../.env" });
const express = require("express");
const router = express.Router();
const passport = require("../config/passport");

//imporing controllers
const {login,signup,get_user_booking_data} = require("../controller/user")

//public roues

router.post("/login", login);
router.post("/signup", signup);

//protected routes
router.post(
    "/get_user_booking_data",
    passport.authenticate("jwt", { session: false }),
    get_user_booking_data
  );


module.exports = router;
