exports.up = function (knex) {
    return knex.schema.createTable("resturant_tables", (t) => {
      t.increments("id").unsigned().primary();
      t.integer("res_id");
      t.integer("spl_id");
      t.integer("chairs").notNullable();
      t.timestamp("created_at").notNullable().defaultTo(knex.raw("now()"));
      t.datetime("updated_at").notNullable().defaultTo(knex.raw("now()"));
      //foreign keys start here
      t.foreign('res_id').references('id').inTable('resturants');
      t.foreign('spl_id').references('code').inTable('resturant_table_speciality');
    });
  };
  
  exports.down = function (knex) {
    return knex.schema.dropTable("resturant_tables");
  };
  