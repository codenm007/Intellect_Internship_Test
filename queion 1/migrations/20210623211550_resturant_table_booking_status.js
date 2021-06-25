exports.up = function (knex) {
    return knex.schema.createTable("resturant_table_booking_status", (t) => {
      t.increments("id").unsigned().primary();
      t.string("desc");
      t.integer("code").unique();
      t.timestamp("created_at").notNullable().defaultTo(knex.raw("now()"));
    });
  };
  
  exports.down = function (knex) {
    return knex.schema.dropTable("resturant_table_booking_status");
  };
  