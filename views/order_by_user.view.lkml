view: order_by_user {
  derived_table: {
    sql:
      select
        user_id AS user_id
        , COUNT(*) AS total_num_orders
        , SUM(order_items.sale_price) AS total_revenue
      FROM order_items
      GROUP BY user_id
      ;;
  }

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: total_num_orders {
    type: number
    sql: ${TABLE}.total_num_orders ;;
  }

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.total_revenue ;;
  }
}
