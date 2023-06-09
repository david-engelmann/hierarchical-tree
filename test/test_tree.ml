open OUnit2
open Hierarchical_tree.Tree

let test_get_lowest_layer_of_tree_on_tree4 _ =
  OUnit2.assert_equal 1 (Tree.get_lowest_layer_of_tree Tree.tree4)

let test_get_lowest_layer_of_tree_on_parent_tree _ =
  OUnit2.assert_equal 2 (Tree.get_lowest_layer_of_tree Tree.parent_tree)

let test_get_lowest_layer_of_tree_on_grand_parent_tree _ =
  OUnit2.assert_equal 3 (Tree.get_lowest_layer_of_tree Tree.grand_parent_tree)

let test_get_lowest_layer_of_tree_on_two_children_tree _ =
  OUnit2.assert_equal 5 (Tree.get_lowest_layer_of_tree Tree.two_children_tree)

let test_get_layer_of_tree_on_one_parent_tree _ =
  OUnit2.assert_equal 2 (Tree.get_layer_of_tree Tree.one_parent_tree)

let test_get_layer_of_tree_on_two_parent_tree _ =
  OUnit2.assert_equal 3 (Tree.get_layer_of_tree Tree.two_parent_tree)

let test_get_layer_of_tree_on_multiple_parent_tree _ =
  OUnit2.assert_equal 3 (Tree.get_layer_of_tree Tree.multiple_parent_tree)

let test_add_child _ =
  OUnit2.assert_equal 2 (Tree.get_lowest_layer_of_tree (Tree.add_child Tree.tree4 Tree.one_parent_tree))

let test_add_child_on_two_children_tree _ =
  OUnit2.assert_equal 6 (Tree.get_lowest_layer_of_tree (Tree.add_child Tree.two_children_tree Tree.two_children_tree))

let test_add_child_on_two_trees _ =
  OUnit2.assert_equal 7 (Tree.get_lowest_layer_of_tree (Tree.add_child Tree.tree4 (Tree.add_child Tree.one_parent_tree Tree.two_children_tree)))

let test_add_parent _ =
  OUnit2.assert_equal 2 (Tree.get_layer_of_tree (Tree.add_parent Tree.tree4 Tree.parent_tree))

let test_add_parent_on_two_parent_tree _ =
  OUnit2.assert_equal 4 (Tree.get_layer_of_tree (Tree.add_parent Tree.tree4 Tree.two_parent_tree))

let test_add_parent_on_two_trees _ =
  OUnit2.assert_equal 3 (Tree.get_layer_of_tree (Tree.add_parent Tree.tree4 (Tree.add_parent Tree.one_parent_tree Tree.two_children_tree)))

let suite =
  "suite"
  >::: [
         "test_get_lowest_layer_of_tree_on_tree4"
         >:: test_get_lowest_layer_of_tree_on_tree4;
         "test_get_lowest_layer_of_tree_on_parent_tree"
         >:: test_get_lowest_layer_of_tree_on_parent_tree;
         "test_get_lowest_layer_of_tree_on_grand_parent_tree"
         >:: test_get_lowest_layer_of_tree_on_grand_parent_tree;
         "test_get_lowest_layer_of_tree_on_two_children_tree"
         >:: test_get_lowest_layer_of_tree_on_two_children_tree;
         "test_get_layer_of_tree_on_one_parent_tree"
         >:: test_get_layer_of_tree_on_one_parent_tree;
         "test_get_layer_of_tree_on_two_parent_tree"
         >:: test_get_layer_of_tree_on_two_parent_tree;
         "test_get_layer_of_tree_on_multiple_parent_tree"
         >:: test_get_layer_of_tree_on_multiple_parent_tree;
         "test_add_child"
         >:: test_add_child;
         "test_add_child_on_two_children_tree"
         >:: test_add_child_on_two_children_tree;
         "test_add_child_on_two_trees"
         >:: test_add_child_on_two_trees;
         "test_add_parent"
         >:: test_add_parent;
         "test_add_parent_on_two_parent_tree"
         >:: test_add_parent_on_two_parent_tree;
         "test_add_parent_on_two_trees"
         >:: test_add_parent_on_two_trees;
       ]

let () = run_test_tt_main suite
