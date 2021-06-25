const jwt_decode = require("jwt-decode");
//importing models
const {
  resturants,
  resturant_closed,
  resturant_tables,
  resturant_tables_booking,
} = require("../models/resturants");

//add_restro
const add_resro = async (req, res, next) => {
  let jwtlength = req.get("Authorization").length;
  let decoded = jwt_decode(req.get("Authorization").slice(7, jwtlength));

  //checking if the fields are none
  if (
    !req.body.name ||
    !req.body.contact_number ||
    !req.body.cuisines ||
    !req.body.country_id ||
    !req.body.city_id ||
    !req.body.state_id ||
    !req.body.resturant_closed ||
    !req.body.opens_at ||
    !req.body.closes_at
  ) {
    return res.status(200).json({
      resp_code: 400,
      resp_message: "Fields Empty!",
    });
  }

  const new_restro = new resturants({
    user_id: decoded.sub,
    name: req.body.name,
    logo: req.body.logo,
    contant_number: req.body.contact_number,
    cuisines: req.body.cuisines,
    country_id: req.body.country_id,
    state_id: req.body.state_id,
    city_id: req.body.city_id,
    opens_at: req.body.opens_at,
    closes_at: req.body.closes_at,
    rating: 0,
  });

  new_restro
    .save()
    .then((data) => {
      const closed_days = req.body.resturant_closed.split(",");

      let i = 0;
      closed_days.forEach((j) => {
        const new_closed_day = new resturant_closed({
          res_id: data.id,
          day_code: j,
        });
        new_closed_day
          .save()
          .then(() => {
            i++;

            if (i === closed_days.length) {
              return res.json({
                resp_code: 200,
                resp_message: "Restro registered Successfully !",
              });
            }
          })
          .catch((err) => {
            console.log(err);
          });
      });
    })
    .catch((err) => {
      console.log(err);
      return res.status(400).json({
        resp_code: 400,
        resp_message: err,
      });
    });
};

//add_restro_tables
const add_restro_tables = async (req, res, next) => {
  let jwtlength = req.get("Authorization").length;
  let decoded = jwt_decode(req.get("Authorization").slice(7, jwtlength));

  //checking if the fields are none
  if (!req.body.res_id || !req.body.spl_id || !req.body.chairs) {
    return res.status(200).json({
      resp_code: 400,
      resp_message: "Fields Empty !",
    });
  }

  resturants
    .where({ id: req.body.res_id, user_id: decoded.sub })
    .fetch()
    .then((data) => {
      const add_tables = new resturant_tables({
        res_id: req.body.res_id,
        spl_id: req.body.spl_id,
        chairs:req.body.chairs
      });

      add_tables
        .save()
        .then(() => {
          return res.status(200).json({
            status: 200,
            message: "Table added successfully !",
          });
        })
        .catch((err) => {
          return res.status(400).json({
            status: 400,
            message: err,
          });
        });
    })
    .catch(() => {
      return res.status(403).json({
        status: 403,
        message: "Forbidden acion!",
      });
    });
};

//edit_restro_tables
const update_restro_tables = async (req, res, next) => {
  let jwtlength = req.get("Authorization").length;
  let decoded = jwt_decode(req.get("Authorization").slice(7, jwtlength));

  //checking if the fields are none
  if (!req.body.res_id || !req.body.spl_id || !req.body.table_id) {
    return res.status(200).json({
      resp_code: 400,
      resp_message: "Fields Empty !",
    });
  }

  resturants
    .where({ id: req.body.res_id, user_id: decoded.sub })
    .fetch()
    .then((data) => {
      resturant_tables
        .where({ id: req.body.table_id, res_id: req.body.res_id })
        .save(
          {
            spl_id: req.body.spl_id,
            chairs:req.body.chairs,
            updated_at: `now()`,
          },
          { patch: true }
        )
        .then(() => {
          return res.status(200).json({
            status: 200,
            message: "Table updated successfully !",
          });
        })
        .catch((err) => {
          return res.status(400).json({
            status: 400,
            message: err,
          });
        });
    })
    .catch(() => {
      return res.status(403).json({
        status: 403,
        message: "Forbidden acion!",
      });
    });
};

//delete_restro_tables
const delete_restro_tables = async (req, res, next) => {
  let jwtlength = req.get("Authorization").length;
  let decoded = jwt_decode(req.get("Authorization").slice(7, jwtlength));

  //checking if the fields are none
  if (!req.body.res_id || !req.body.table_id) {
    return res.status(200).json({
      resp_code: 400,
      resp_message: "Fields Empty !",
    });
  }

  resturants
    .where({ id: req.body.res_id, user_id: decoded.sub })
    .fetch()
    .then((data) => {
      resturant_tables
        .where({ id: req.body.table_id, res_id: req.body.res_id })
        .destroy()
        .then(() => {
          return res.status(200).json({
            status: 200,
            message: "Table deleted successfully !",
          });
        })
        .catch((err) => {
          return res.status(400).json({
            status: 400,
            message: err,
          });
        });
    })
    .catch(() => {
      return res.status(403).json({
        status: 403,
        message: "Forbidden acion!",
      });
    });
};

//resturant book table
const book_table = async (req, res, next) => {
  let jwtlength = req.get("Authorization").length;
  let decoded = jwt_decode(req.get("Authorization").slice(7, jwtlength));

  //checking if the fields are none
  if (
    !req.body.res_id ||
    !req.body.table_id ||
    !req.body.reserved_at 
  ) {
    return res.status(400).json({
      resp_code: 400,
      resp_message: "Fields Empty !",
    });
  }

  const { res_id, table_id, reserved_at, special_req } = req.body;

  const converted_reserver_time = new Date(`${new Date(reserved_at).toISOString().slice(0,13)}:00:00${new Date(reserved_at).toISOString().slice(19)}`).toISOString()

  console.log(converted_reserver_time)
  resturant_tables_booking
    .where({
      table_id: table_id,
      res_id: res_id,
      status_code: 1,
      reserved_at: converted_reserver_time,
    })
    .fetch()
    .then(() => {
      //if confirmed booking for that table is available
      return res.status(403).json({
        resp_code: 403,
        resp_message: "Table already occupied !",
      });
    })
    .catch(() => {
      resturants
        .where({ id: res_id })
        .fetch({
          withRelated: ["closed_days"],
        })
        .then((data) => {
         // console.log(JSON.stringify(data), 250);
         let open = true;

          const resturant_closed_days = JSON.parse(
            JSON.stringify(data)
          ).closed_days;

          const resturant_opens_at = JSON.parse(JSON.stringify(data)).opens_at
          const resturant_closes_at = JSON.parse(JSON.stringify(data)).closes_at

          //checking if the booking date is in closed days
          resturant_closed_days.forEach((j) => {
              //console.log(22,j.day_code,new Date(reserved_at).getDay)
            if (j.day_code === new Date(converted_reserver_time).getDay()) {
             open = false;
            }
          });

          //resturant might not be operating under that hours
          const open_time_mil = new Date(`${new Date(reserved_at).toISOString().slice(0,10)}T${resturant_opens_at}`).getTime();
          const closed_time_mil = new Date(`${new Date(reserved_at).toISOString().slice(0,10)}T${resturant_closes_at}`).getTime();
          const reservation_time_mil = new Date(`${new Date(converted_reserver_time).toISOString().slice(0,19)}`).getTime();

          //checking operation hours
          if(open_time_mil > reservation_time_mil || closed_time_mil < reservation_time_mil){
              open = false
          }
          //console.log(open_time_mil,closed_time_mil,reservation_time_mil)

         
          //console.log(`${new Date(reserved_at).toISOString().slice(0,13)}:00:00${new Date(reserved_at).toISOString().slice(19)}`,converted_reserver_time);

          if(open){
          //table not occupied
          const new_table_booking = new resturant_tables_booking({
            res_id: res_id,
            table_id: table_id,
            booked_by: decoded.sub,
            status_code: 1,
            reserved_at: converted_reserver_time,
            special_req: special_req
          });

          new_table_booking
            .save()
            .then((data) => {
              return res.status(200).json({
                status: 200,
                message:
                  "Congratulations your Table booking was confirmed, enjoy !",
                booking_id:data.id  
              });
            })
            .catch((err) => {
              console.log(err);
            });
          }else{
            return res.status(400).json({
                status: 400,
                message:
                  "Sorry , resturant is closed !",
              });
          }

        })
        .catch((err) => {
          console.log(err);
         });
    });
};

//resturant cancel booked tables
const cancel_booked_table = async (req, res, next) => {
  let jwtlength = req.get("Authorization").length;
  let decoded = jwt_decode(req.get("Authorization").slice(7, jwtlength));

  //checking if the fields are none
  if (
    !req.body.booking_id
  ) {
    return res.status(400).json({
      resp_code: 400,
      resp_message: "Fields Empty !",
    });
  }

  const { booking_id} = req.body;

  resturant_tables_booking
    .where({
      id: booking_id,
      booked_by:decoded.sub
    })
    .save(
      {
        status_code: 2,
        updated_at: `now()`,
      },
      { patch: true }
    )
    .then(() => {
      //if confirmed booking for that table is available
      return res.status(403).json({
        resp_code: 403,
        resp_message: "Table booking cancelled !",
      });
    })
    .catch(() => {
      return res.status(400).json({
        resp_code: 400,
        resp_message: "Invalid booking id !",
      });
    });
};

//get restros
const get_restros_by_city = async (req, res, next) => {
  
  const {city_id,page_size,page} = req.body;

  //checking if the fields are none
  if (!city_id) {
    return res.status(200).json({
      resp_code: 400,
      resp_message: "Fields Empty !",
    });
  }

  resturants
    .where({ city_id: city_id })
    .fetchPage({
      pageSize: page_size, // Defaults to 10 if not specified
      page: page, // Defaults to 1 if not specified
      withRelated: ['closed_days'], // Passed to Model#fetchAll
      columns: ['id','name','logo','cuisines','opens_at','closes_at']
    })
    .then((data) => {
      return res.status(200).json({
        status: 200,
        message:'Resturants fetched successfully!' ,
        data:data
      });
    })
    .catch((err) => {
      return res.status(400).json({
        status: 400,
        message:err ,
      });
    });
};

//get_resurant_details 
const get_restros_details = async (req, res, next) => {
  
  const {res_id} = req.body;

  //checking if the fields are none
  if (!res_id) {
    return res.status(200).json({
      resp_code: 400,
      resp_message: "Fields Empty !",
    });
  }

  resturants
    .where({ id: res_id })
    .fetch({
      withRelated: ['closed_days'], // Passed to Model#fetchAll
      columns: ['id','name','logo','cuisines','contant_number','opens_at','closes_at','city_id','state_id','country_id']
    })
    .then((data) => {
      return res.status(200).json({
        status: 200,
        message:'Resturant fetched successfully!' ,
        data:data
      });
    })
    .catch(() => {
      return res.status(404).json({
        status: 404,
        message:"Not found" ,
      });
    });
};

//get resurant tables details
const get_restros_table_details = async (req, res, next) => {
  
  const {res_id,date_time} = req.body;

  //checking if the fields are none
  if (!res_id || !date_time) {
    return res.status(200).json({
      resp_code: 400,
      resp_message: "Fields Empty !",
    });
  }

  resturants.where({id:res_id})
  .fetch({
    columns:['opens_at','closes_at']
  }).then(data => {

    const converted_reserver_time = new Date(`${new Date(date_time).toISOString().slice(0,13)}:00:00${new Date(date_time).toISOString().slice(19)}`).toISOString()

  resturant_tables
    .where({ res_id: res_id })
    .fetchAll({columns:['id','chairs','spl_id']})
    .then((data) => {
      let restro_table_data = JSON.parse(JSON.stringify(data));

      //fetching table booking that specific date
      resturant_tables_booking
      .where({res_id:res_id,status_code:1,reserved_at:converted_reserver_time})
      .fetchAll({
        columns:['table_id']
      })
      .then(table_booking_data => {
        let booked_tables_data = JSON.parse(JSON.stringify(table_booking_data))
        //console.log(restro_table_data ,"56565656", booked_tables_data,1000000);

        let booked_tables= [];

        //searating out booked tables
        booked_tables_data.forEach(j => {
          restro_table_data.forEach(k =>{
            if(j.table_id ==k.id ){
              //console.log('matched',k)
              booked_tables.push(k);
            }
          })
        })
        //finding empty tables
        let empty_tables = restro_table_data.filter( x => !booked_tables.includes(x));

        //console.log(4711,booked_tables,8989898989,empty_tables);
        return res.status(200).json({
          status: 200,
          message:"Resturant table details" ,
          empty_tables:empty_tables,
          booked_tables:booked_tables
        });

      })
      .catch(err => {
        console.log(err)
      })
      
    })
    .catch((err)=>{
      console.log(err)
      return res.status(404).json({
        status: 404,
        message:"Resturant have'nt listed tables till now !" ,
      });
    })
  })
    .catch((err) => {
      console.log(err);
      return res.status(404).json({
        status: 404,
        message:"Resurant no found" ,
      });
    });
};

module.exports = {
  add_resro,
  add_restro_tables,
  update_restro_tables,
  delete_restro_tables,
  book_table,
  get_restros_by_city,
  get_restros_details,
  get_restros_table_details,
  cancel_booked_table
};
