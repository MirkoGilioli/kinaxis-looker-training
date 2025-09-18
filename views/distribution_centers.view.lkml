view: distribution_centers {
  sql_table_name: `look_ecommerce.distribution_centers` ;;

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    primary_key: yes
  }
  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }
  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
