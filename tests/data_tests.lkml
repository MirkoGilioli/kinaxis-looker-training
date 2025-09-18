test: unique_order_item_ids {
  explore_source: order_items {
    column: id {}
    column: count {}
    sorts: [order_items.id: desc]
    limit: 1
  }
assert: unique_order_item_ids {
  expression: ${order_items.count} = 1 ;;
}
}
