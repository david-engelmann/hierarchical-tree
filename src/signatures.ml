module type Tree = sig
  (** [get_layer_of_tree 'a tree] gets the number of generations above the
   * current node, including the current nodes generation *)
  val get_layer_of_tree : 'a tree -> int

  (** [get_lowest_layer_of_tree 'a tree] gets the number of children generation
   * below the current node, including the current nodes generation *)
  val get_lowest_layer_of_tree : 'a tree -> int

  (** [add_child p c] returns a new 'a tree with the c (child) node add into the
   * p (parent) nodes children *)
  val add_child : 'a tree 'a tree -> 'a tree

  (** [add_parent c p] returns a new 'a tree with the p (parent) node add into the
   * c (child) nodes parents *)
  val add_parent : 'a tree 'a tree -> 'a tree

  (** [print_tree 'a tree] prints a string representation of 'a tree *)
  val print_tree : 'a tree -> unit
end
