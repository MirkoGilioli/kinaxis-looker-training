view: user_order_details {
  derived_table: {
    sql:
      SELECT
          o.user_id AS user_id,
          SUM(oi.sale_price) AS total_revenue,
          COUNT(DISTINCT o.order_id) AS total_orders
      FROM `look_ecommerce.order_items` oi
      GROUP BY o.user_id
      ;;
  }

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.total_revenue ;;
    value_format_name: usd
  }

  measure: total_orders {
    type: sum
    sql: ${TABLE}.total_orders ;;
  }
}
