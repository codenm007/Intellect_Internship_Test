exports.up = function (knex) {
    return knex.schema.createTable("resturants", (t) => {
      t.increments("id").unsigned().primary();
      t.integer("user_id");
      t.string("name");
      t.string("logo");
      t.string("contant_number").unique();
      t.string("cuisines");
      t.integer("city_id").notNull();
      t.integer("state_id").notNull();
      t.integer("country_id").notNull();
      t.time("opens_at").notNull();
      t.time("closes_at").notNull();
      t.float("rating");
      t.timestamp("created_at").notNullable().defaultTo(knex.raw("now()"));
      t.datetime("updated_at").notNullable().defaultTo(knex.raw("now()"));
      //foreign keys start here
      t.foreign('user_id').references('id').inTable('users');
      t.foreign('state_id').references('id').inTable('state');
      t.foreign('country_id').references('id').inTable('country');
      t.foreign('city_id').references('id').inTable('city');
    });
  };
  
  exports.down = function (knex) {
    return knex.schema.dropTable("resturants");
  };
  