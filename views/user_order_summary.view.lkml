view: user_order_summary {
  derived_table: {
    sql: select
  user_id,
  count(order_id) as order_count,
  sum(sale_price) as total_sale_price

from look_ecommerce.order_items
group by
  user_id ;;
  }

  dimension: user_id {
    primary_key:yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: order_count {
    type:  number
    sql: ${TABLE}.order_count ;;
  }

  dimension: total_sale_price {
    type:  number
    sql:${TABLE}.total_sale_price ;;
    value_format_name: usd_0
  }

  measure: total_sales_amount {
    sql: ${total_sale_price} ;;
    type: sum
    value_format_name: usd_0
  }

  measure: total_order_count {
    sql: ${order_count} ;;
    type:  sum

  }

}
