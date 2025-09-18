view: order_by_user {
  derived_table: {
    sql:
      SELECT
        o.user_id AS user,
        SUM(oi.sale_price) AS total_revenue,
        COUNT(DISTINCT o.order_id) AS total_orders
      FROM `look_ecommerce.order_items` oi
      LEFT JOIN `look_ecommerce.orders` o ON oi.order_id = o.order_id
      LEFT JOIN `look_ecommerce.users` u ON o.user_id = u.id
      GROUP BY o.user_id ;;

  }

  dimension: user {
    type: string
    sql: ${TABLE}.user ;;
  }

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.total_revenue ;;
  }

  dimension: total_orders {
    type: number
    sql: ${TABLE}.total_orders ;;
  }
}
