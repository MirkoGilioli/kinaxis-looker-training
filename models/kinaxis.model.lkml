connection: "dt_mirkosand_looker_ecommerce"

# include all the views
include: "/views/**/*.view.lkml"

datagroup: kinaxis_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kinaxis_default_datagroup

# explore: order_items {

#   join: orders {
#     type: left_outer
#     sql_on: ${order_items.id} = ${order_id} ;;
#     relationship: many_to_one
#   }

#   join: users {
#     type: left_outer
#     sql_on: ${order_items.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }

#   join: inventory_items {
#     type: left_outer
#     sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
#     relationship: many_to_one
#   }

#   join: products {
#     type: left_outer
#     sql_on: ${order_items.product_id} = ${products.id} ;;
#     relationship: many_to_one
#   }
# }
# explore: events {
#     from: events

#     join: users {
#       sql_on: ${events.user_id} = ${users.id} ;;
#       relationship: many_to_one
#     }
#   }

# explore: inventory_items {
#   from: inventory_items

#   join: distribution_centers {
#     sql_on: ${inventory_items.product_distribution_center_id} = ${distribution_centers.id} ;;
#     relationship: many_to_one
#   }
# }
# ---- Explores ---
# ---------- FACT: Order Items -------
explore: order_items {
  from: order_items
  label: "Order Items (Fact)"

  # Users (many order_items -> one user)
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.user_id} = ${users.id} ;;
  }

  # Orders (many order_items -> one order)
  join: orders {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
  }

  # Products (many order_items -> one product)
  join: products {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.product_id} = ${products.id} ;;
  }

  # Inventory Items (many order_items -> one inventory item)
  join: inventory_items {
    type: left_outer
    relationship: many_to_one
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
  }
}
# ---------- FACT: Events ----
explore: events {
  from: events
  label: "Events (Fact)"

  # Many events -> one user
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${events.user_id} = ${users.id} ;;
  }
}
