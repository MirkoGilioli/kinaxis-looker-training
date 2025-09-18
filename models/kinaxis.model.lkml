connection: "dt_mirkosand_looker_ecommerce"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: kinaxis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kinaxis_default_datagroup

explore: order_items  {
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} =  ${users.id};;
  }
}
