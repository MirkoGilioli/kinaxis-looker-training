view: order_items {
  sql_table_name: `look_ecommerce.order_items` ;;

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension: inventory_item_id {
    type: string
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension_group: shipped_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }
  dimension_group: delivered_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }
  dimension_group: created_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: returned_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${sale_price} ;;
  }

}

test: sale_price_non_negative{
  explore_source: order_items {
    column: sale_price {field: order_items.sale_price}
  }
  assert: positive_count {
    expression: ${order_items.sale_price} >=0 ;;
  }
}

test: count_orders_positive  {
  explore_source: order_items {
    column: total_num_orders {field: order_by_user.total_num_orders}
  }
  assert: count_orders_positive {
    expression: ${order_by_user.total_num_orders} >= 0 ;;
    }
}
