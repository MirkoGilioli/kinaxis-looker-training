view: order_items {
  sql_table_name: `look_ecommerce.order_items` ;;

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }
  dimension: order_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: created_at {
    type: date
    sql: ${TABLE}.created_at ;;
  }
  dimension: shipped_at {
    type: date
    sql: ${TABLE}.shipped_at ;;
  }
  dimension: delivered_at {
    type: date
    sql: ${TABLE}.delivered_at ;;
  }
  dimension: returned_at {
    type: date
    sql: ${TABLE}.returned_at ;;
  }
  dimension: sales_price {
    type: number
    sql:  ${TABLE}.sales_price ;;
  }



}
