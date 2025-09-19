view: base {
  extension: required

  dimension: id {
    hidden:  yes
    primary_key: yes
    type:  number
    sql: ${TABLE}.id ;;
  }
}
