const jwt_decode = require("jwt-decode");
//importing models
const { resturants,resturant_closed, resturant_tables } = require ("../models/resturants");

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
              user_id:decoded.sub,  
              name: req.body.name,
              logo: req.body.logo,
              contant_number: req.body.contact_number,
              cuisines: req.body.cuisines,
              country_id: req.body.country_id,
              state_id: req.body.state_id,
              city_id: req.body.city_id,
              opens_at:req.body.opens_at,
              closes_at:req.body.closes_at,
              rating: 0
            });
  
            new_restro
              .save()
              .then((data) => {

                const closed_days = req.body.resturant_closed.split(",");

                let i = 0;
                closed_days.forEach(j => {
                    const new_closed_day = new resturant_closed ({
                        res_id:data.id,
                        day_code:j
                    })
                    new_closed_day.save()
                    .then(()=>{
                        i++;

                        if(i === closed_days.length) {
                            return res.json({
                                resp_code: 200,
                                resp_message: "Restro registered Successfully !",
                              });
                        }
                    })
                    .catch(err => {
                        console.log(err)
                    })
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
        if (
          !req.body.res_id ||
          !req.body.spl_id 
        ) {
          return res.status(200).json({
            resp_code: 400,
            resp_message: "Fields Empty !",
          });
        }
        
        resturants
        .where({id:req.body.res_id , user_id : decoded.sub})
        .fetch()
         .then(data => {

            const add_tables = new resturant_tables ({
                res_id:req.body.res_id,
                spl_id:req.body.spl_id
            })

            add_tables
            .save()
            .then(()=>{
                return res
                .status(200)
                .json({
                    status:200,
                    message:"Table added successfully !"
                })
            })
            .catch(err => {
                return res
                .status(400)
                .json({
                    status:400,
                    message:err
                })
            })

         }).catch(()=>{
             return res.status(403).json({
                 status:403,
                 message:"Forbidden acion!"
             })
         })
  };

  //edit_restro_tables
const update_restro_tables = async (req, res, next) => {
    let jwtlength = req.get("Authorization").length;
    let decoded = jwt_decode(req.get("Authorization").slice(7, jwtlength));

            //checking if the fields are none
            if (
                !req.body.res_id ||
                !req.body.spl_id ||
                !req.body.table_id
              ) {
                return res.status(200).json({
                  resp_code: 400,
                  resp_message: "Fields Empty !",
                });
              }

              resturants
              .where({id:req.body.res_id , user_id : decoded.sub})
              .fetch()
               .then(data => {
      
      
                  resturant_tables.where({ id:req.body.table_id,res_id:req.body.res_id })
                  .save(
                    {
                      spl_id:req.body.spl_id,
                      updated_at: `now()`,
                    },
                    { patch: true }
                  )
                  .then(()=>{
                      return res
                      .status(200)
                      .json({
                          status:200,
                          message:"Table updated successfully !"
                      })
                  })
                  .catch(err => {
                      return res
                      .status(400)
                      .json({
                          status:400,
                          message:err
                      })
                  })
      
               }).catch(()=>{
                   return res.status(403).json({
                       status:403,
                       message:"Forbidden acion!"
                   })
               })

}

//delete_restro_tables
const delete_restro_tables = async (req, res, next) => {
        let jwtlength = req.get("Authorization").length;
        let decoded = jwt_decode(req.get("Authorization").slice(7, jwtlength));
    
                //checking if the fields are none
                if (
                    !req.body.res_id ||
                    !req.body.table_id
                  ) {
                    return res.status(200).json({
                      resp_code: 400,
                      resp_message: "Fields Empty !",
                    });
                  }
    
                  resturants
                  .where({id:req.body.res_id , user_id : decoded.sub})
                  .fetch()
                   .then(data => {
          
          
                      resturant_tables.where({ id:req.body.table_id,res_id:req.body.res_id })
                      .destroy()
                      .then(()=>{
                          return res
                          .status(200)
                          .json({
                              status:200,
                              message:"Table deleted successfully !"
                          })
                      })
                      .catch(err => {
                          return res
                          .status(400)
                          .json({
                              status:400,
                              message:err
                          })
                      })
          
                   }).catch(()=>{
                       return res.status(403).json({
                           status:403,
                           message:"Forbidden acion!"
                       })
                   })
    
    }
module.exports = {
add_resro,
add_restro_tables,
update_restro_tables,
delete_restro_tables
}  