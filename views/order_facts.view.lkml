view: order_facts {

  derived_table: {
    sql:
      SELECT
        oi.user_id,
        COUNT(DISTINCT oi.order_id) AS total_orders,
        SUM(oi.sale_price) AS total_revenue
      FROM order_items AS oi
      GROUP BY oi.user_id
        ;;
  }

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
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
