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

  dimension: total_orders {
    type: number
    sql: ${TABLE}.total_orders ;;
  }

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.total_revenue ;;
  }
}
