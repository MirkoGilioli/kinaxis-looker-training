view: order_items {
  sql_table_name: `look_ecommerce.order_items` ;;

  # Primary Key
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Foreign Keys
  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
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
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  # Attributes
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  # Time Dimension Groups
  dimension_group: created_at {
    type: time
    datatype: timestamp
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: shipped_at {
    type: time
    datatype: timestamp
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_at ;;
  }

  dimension_group: delivered_at {
    type: time
    datatype: timestamp
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_at ;;
  }

  dimension_group: returned_at {
    type: time
    datatype: timestamp
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }

  # Measures
  measure: count {
    type: count
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
  }

  measure: avg_sale_price {
    type: average
    sql: ${sale_price} ;;
  }

  measure: max_sale_price {
    type: max
    sql: ${sale_price} ;;
  }

  measure: min_sale_price {
    type: min
    sql: ${sale_price} ;;
  }
}
