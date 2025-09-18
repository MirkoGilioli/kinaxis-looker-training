view: users_summary {
  derived_table: {
    sql:
      SELECT
          order_items.user_id  AS user_id,
          sum(order_items.sale_price)  AS total_price,
          count(order_items.order_id)  AS total_orders
      FROM `look_ecommerce.order_items`  AS order_items
      --LEFT JOIN `look_ecommerce.users`  AS users ON order_items.user_id = users.id
      GROUP BY
        1
      ORDER BY
    1 ;;
  }
  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }
  dimension: total_orders {
    type: number
    value_format: "0.00"
    sql: ${TABLE}.total_orders ;;
  }
  dimension: total_price {
    type: number
    value_format: "0.00"
    sql: ${TABLE}.total_price ;;
  }
}
