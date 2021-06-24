require("dotenv").config({ path: "../../.env" });
const passport = require("passport");
const passportJWT = require("passport-jwt");
const JwtStrategy = passportJWT.Strategy;
const ExtractJwt = passportJWT.ExtractJwt;

//importing user model
const user = require("../models/user");

const opts = {
    jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
    secretOrKey: process.env.secret_jwt_key,
  };

  const strategy = new JwtStrategy(opts, (payload, next) => {
    //getting user id from db
    //console.log(payload);
    
    user.forge({ id: payload.sub })
      .fetch()
      .then((res) => {
        next(null, res);
      });

  });
  
  passport.use(strategy);
  
  module.exports = passport;
