view: order_items {
  sql_table_name: `look_ecommerce.order_items` ;;

  dimension: id
  {
    primary_key:  yes
    type:  number
    sql:${TABLE}.id ;;
  }

  dimension: order_id {
    type:  number
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
    sql: ${TABLE}.inventory_item_id  ;;
  }

  dimension: status {
    type:  string
    sql: ${TABLE}.status ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: shipped_at {
    type: date
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: delivered_at {
    type: date
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: returned_at {
    type: date
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: total_sale_price {
    sql:  ${sale_price} ;;
    type: sum
    value_format_name:usd_0
  }

  measure: total_orders_count {
    type: count_distinct
    sql:  ${order_id} ;;
  }

  measure: count {
    type:  count
  }
}
