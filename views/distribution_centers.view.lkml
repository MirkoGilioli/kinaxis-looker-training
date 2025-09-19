include: "base.view"
view: distribution_centers {
  extends: [base]
  sql_table_name: `look_ecommerce.distribution_centers` ;;

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
