connection: "dt_mirkosand_looker_ecommerce"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: kinaxis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kinaxis_default_datagroup

explore: order_items {
  from:  order_items

  join: orders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
  }

  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.order_id} = ${users.id} ;;
  }

  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.order_id} = ${products.id} ;;
  }

  join: inventory_items{
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.order_id} = ${inventory_items.id};;
  }

  join: order_by_user {
    type: left_outer
    sql_on: ${order_items.user_id} = ${order_by_user.user_id} ;;
    relationship: many_to_one
  }
}

explore: events {
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${events.user_id} = ${users.id} ;;
  }
}
