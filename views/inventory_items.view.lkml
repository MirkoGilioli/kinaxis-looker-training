view: inventory_items {
  sql_table_name: `look_ecommerce.inventory_items` ;;

   dimension: id {

    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Foreign Key
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  # Attributes
  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: uri {
    type: string
    sql: ${TABLE}.uri ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: sequence_number {
    type: number
    sql: ${TABLE}.sequence_number ;;
  }

  # Timestamps
  dimension_group: created_at {
    type: time
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.created_at ;;
  }

  measure: distinct_users {
    type: count_distinct
    sql: ${user_id} ;;
  }
}
