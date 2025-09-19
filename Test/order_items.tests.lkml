test: order_items_id_is_unique {
  explore_source: order_items {
    column: order_items_id {field:id}
    column: order_items_count {field:count}
    sorts: [order_items_count: desc]
    limit: 1
  }
  assert: order_items_id_is_unique {
    expression: $(order_items_count)=1;;
  }
}
