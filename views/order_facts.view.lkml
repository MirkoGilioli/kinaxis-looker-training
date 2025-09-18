view: order_facts {
  derived_table: {
    sql: SELECT
          user_id,
          count(distinct order_id) as total_orders,
          sum(sale_price) as total_revenue
         FROM
         order_items
        GROUP BY
          user_id;;
  }

  # Define your dimensions and measures here, like this:
  dimension: user_id {

    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: total_orders {

    type: count
    sql:  ${TABLE}.total_orders ;;
  }

  measure: total_revenue {

    type: sum
    sql: ${TABLE}.total_revenue;;
  }
}
