connection: "dt_mirkosand_looker_ecommerce"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: kinaxis_default_datagroup {
  max_cache_age: "1 hour"
}

persist_with: kinaxis_default_datagroup

explore: order_items  {
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} =  ${users.id};;
  }

  join: inventory_items {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.inventory_item_id} =  ${inventory_items.id};;
  }

  join: orders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.order_id} =  ${orders.order_id};;
  }

  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.product_id} =  ${products.id};;
  }
}

explore: events  {
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${events.user_id} =  ${users.id};;
  }

}
