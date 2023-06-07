open OUnit2
open Hierarchical_tree.Node

let test_node_int_string _ =
  match Node.node_int_string with
   | { node_id; node_name; _; } ->
        OUnit2.assert_equal 0 node_id
        OUnit2.assert_equal "july_jackson" node_name

let test_node_string_string _ =
  match Node.node_string_string with
   | { node_id; node_name; _; } ->
        OUnit2.assert_equal 1 node_id
        OUnit2.assert_equal "tom_turkey" node_name

let test_node_string_int _ =
  match Node.node_string_int with
   | { node_id; node_name; _; }  ->
        OUnit2.assert_equal 2 node_id
        OUnit2.assert_equal "lily_my_dear" node_name

let test_node_int_int _ =
  match Node.node_int_int with
   | { node_id; node_name; _; } ->
        OUnit2.assert_equal 3 node_id
        OUnit2.assert_equal "moving_too_fast" node_name

let suite =
  "suite"
  >::: [
         "test_node_int_string"
         >:: test_node_int_string;
         "test_node_string_string"
         >:: test_node_string_string;
         "test_node_string_int"
         >:: test_node_string_int;
         "test_node_int_int"
         >:: test_node_int_int;
       ]

let () = run_test_tt_main suite
