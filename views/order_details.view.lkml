view: order_details {

  derived_table: {
    sql:
      SELECT
        user_id,
        COUNT(DISTINCT order_id) AS total_orders,
        SUM(sale_price) AS total_revenue
      FROM
        order_items
      GROUP BY
        user_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    primary_key: yes
  }

  measure: total_orders {
    type: sum
    sql: ${TABLE}.total_orders ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.total_revenue ;;
  }
}
