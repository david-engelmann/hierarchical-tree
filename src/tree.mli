(** Signatures for the Tree Module *)

(** ['a tree] is the representation type for tree *)
type 'a tree

(** [get_layer_of_tree 'a tree] gets the number of generations above the
* current node, including the current nodes generation *)
val get_layer_of_tree : 'a tree -> int

(** [get_lowest_layer_of_tree 'a tree] gets the number of children generation
* below the current node, including the current nodes generation *)
val get_lowest_layer_of_tree : 'a tree -> int

(** [add_child p c] returns a new 'a tree with the c (child) node add into the
* p (parent) nodes children *)
val add_child : 'a tree -> 'a tree -> 'a tree

(** [add_parent c p] returns a new 'a tree with the p (parent) node add into the
* c (child) nodes parents *)
val add_parent : 'a tree -> 'a tree -> 'a tree

(** [print_tree 'a tree] prints a string representation of 'a tree *)
val print_tree : 'a tree -> unit

(** test cases to remove after working *)
val tree4 : int tree

val string_tree : string tree

val one_parent_tree : int tree

val two_parent_tree : int tree

val multiple_parent_tree : int tree

val parent_tree : int tree

val grand_parent_tree : int tree

val two_children_tree : int tree
