open Core
open OUnit2
open Hierarchical_tree.Tree

let add x y = x + y

let test_addition _ =
  OUnit2.assert_equal 5 (add 2 3)

let test_get_lowest_layer_of_tree_on_tree4 _ =
  OUnit2.assert_equal 1 (Tree.get_lowest_layer_of_tree Tree.tree4)

let test_get_lowest_layer_of_tree_on_parent_tree _ =
  OUnit2.assert_equal 2 (Tree.get_lowest_layer_of_tree Tree.parent_tree)

let test_get_lowest_layer_of_tree_on_grand_parent_tree _ =
  OUnit2.assert_equal 3 (Tree.get_lowest_layer_of_tree Tree.grand_parent_tree)

let suite =
    "suite" >:::
        [
            "test_addition" >:: test_addition;
            "test_get_lowest_layer_of_tree_on_tree4" >:: test_get_lowest_layer_of_tree_on_tree4;
            "test_get_lowest_layer_of_tree_on_parent_tree" >:: test_get_lowest_layer_of_tree_on_parent_tree;
"test_get_lowest_layer_of_tree_on_grand_parent_tree" >:: test_get_lowest_layer_of_tree_on_grand_parent_tree;
        ]

let () =
  run_test_tt_main suite
