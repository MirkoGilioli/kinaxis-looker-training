view: order_facts {

  derived_table: {
    sql: SELECT
            order_items.order_id as order_id,
            order_items.user_id as user_id,
            COUNT(*) as order_item_count,
            SUM(order_items.sale_price) as order_revenue
          FROM
            order_items
          GROUP BY
            order_id, user_id;;
  }

  dimension: order_id {

    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: user_id {
    type: number
    primary_key:  yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: order_item_count {
    description: ""
    type: number
    sql: ${TABLE}.order_item_count ;;
  }

  dimension: total_revenue {
    description: ""
    type: number
    value_format: "$#,##0.00"
    sql: ${TABLE}.order_revenue ;;
  }

}
