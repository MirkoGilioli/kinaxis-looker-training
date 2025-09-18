connection: "dt_mirkosand_looker_ecommerce"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: kinaxis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

explore: order_items {
  from: order_items

  join: orders {
    type: inner
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: products  {
    type: left_outer
    sql_on: ${order_items.product_id} = ${products.id};;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type:  left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one

  }
}

explore: user_order_summary {
  from:  user_order_summary

  join: users {
    type:  inner
    sql_on: ${user_order_summary.user_id} = ${users.id} ;;
    relationship: one_to_one
  }
}

explore: events {
  from:  events

  join: users {
    type:  inner
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: user_order_summary {
    type:  left_outer
    sql_on: ${events.user_id} = ${user_order_summary.user_id} ;;
    relationship: many_to_one
  }
}
persist_with: kinaxis_default_datagroup
