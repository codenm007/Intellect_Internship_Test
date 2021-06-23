exports.up = function (knex) {
    return knex.schema.createTable("city", (t) => {
      t.increments("id").unsigned().primary();
      t.string("title");
      t.integer("city_id").notNull();
      t.timestamp("created_at").notNullable().defaultTo(knex.raw("now()"));
      t.timestamp("updated_at").notNullable().defaultTo(knex.raw("now()"));
      t.foreign('city_id').references('id').inTable('country');
    });
  };
  
  exports.down = function (knex) {
    return knex.schema.dropTable("city");
  };
  