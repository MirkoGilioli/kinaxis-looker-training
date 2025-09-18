view: order_items {
  sql_table_name: `look_ecommerce.order_items` ;;

  # Dimensions
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

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

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
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

  dimension_group: returned_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
  }


}
