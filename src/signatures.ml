module type Tree = sig
  val get_layer_of_tree : 'a tree -> int
  val get_lowest_layer_of_tree : 'a tree -> int
  val add_child : 'a tree 'a tree -> 'a tree
  val add_parent : 'a tree 'a tree -> 'a tree
  val print_tree : 'a tree -> unit
end
