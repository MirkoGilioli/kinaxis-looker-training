view: order_by_user{
  derived_table: {
    sql:
      SELECT o.user_id as user_id,
       SUM(oi.sale_price) as total_revenue,
       COUNT(DISTINCT o.order_id) as total_num_orders
      FROM `look_ecommerce.order_items` oi
      LEFT JOIN `look_ecommerce.orders` o ON oi.order_id = o.order_id
      LEFT JOIN `look_ecommerce.users` u ON o.user_id = u.id
      GROUP BY o.user_id
    ;;
  }


dimension:  user_id{
  primary_key: yes
  type: number
  sql: ${TABLE}.user_id ;;
}

measure:  total_num_orders {
  type: number
  sql:${TABLE}.total_num_orders ;;
}

  measure:  total_revenue {
    type: number
    sql:${TABLE}.total_revenue ;;
  }

}
