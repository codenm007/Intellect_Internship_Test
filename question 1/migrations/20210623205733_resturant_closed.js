exports.up = function (knex) {
    return knex.schema.createTable("resturant_closed", (t) => {
      t.increments("id").unsigned().primary();
      t.integer("res_id");
      t.integer("day_code");
      t.timestamp("created_at").notNullable().defaultTo(knex.raw("now()"));
      t.datetime("updated_at").notNullable().defaultTo(knex.raw("now()"));
      //foreign keys start here
      t.foreign('res_id').references('id').inTable('resturants');
    });
  };
  
  exports.down = function (knex) {
    return knex.schema.dropTable("resturant_closed");
  };
  