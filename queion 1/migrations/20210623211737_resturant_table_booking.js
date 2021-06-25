exports.up = function (knex) {
    return knex.schema.createTable("resturant_tables_booking", (t) => {
      t.increments("id").unsigned().primary();
      t.integer("res_id");
      t.integer("table_id");
      t.integer("booked_by");
      t.integer("status_code");
      t.timestamp("reserved_at").notNullable();
      t.string("special_req");
      t.float("user_rating");
      t.timestamp("created_at").notNullable().defaultTo(knex.raw("now()"));
      t.timestamp("updated_at").notNullable().defaultTo(knex.raw("now()"));
      //foreign keys start here
      t.foreign('res_id').references('id').inTable('resturants');
      t.foreign('table_id').references('id').inTable('resturant_tables');
      t.foreign('booked_by').references('id').inTable('users');
      t.foreign('status_code').references('code').inTable('resturant_table_booking_status');
    });
  };
  
  exports.down = function (knex) {
    return knex.schema.dropTable("resturant_tables_booking");
  };
  