exports.up = function (knex) {
    return knex.schema.createTable("user_genders", (t) => {
      t.increments("id").unsigned().primary();
      t.string("title");
      t.integer("code").notNull();
      t.timestamp("created_at").notNullable().defaultTo(knex.raw("now()"));
    });
  };
  
  exports.down = function (knex) {
    return knex.schema.dropTable("user_genders");
  };
  