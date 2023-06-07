open OUnit2
open Hierarchical_tree.Node

let test_node_int_string_id _ =
  match Node.node_int_string with
   | { node_id; _ } ->
        OUnit2.assert_equal 0 node_id

let test_node_int_string_name _ =
  match Node.node_int_string with
   | { node_name; _ } ->
        OUnit2.assert_equal "july_jackson" node_name

let test_node_string_string_id _ =
  match Node.node_string_string with
   | { node_id; _ } ->
        OUnit2.assert_equal 1 node_id

let test_node_string_string_name _ =
  match Node.node_string_string with
   | { node_name; _ } ->
        OUnit2.assert_equal "tom_turkey" node_name

let test_node_string_int_id _ =
  match Node.node_string_int with
   | { node_id; _ }  ->
        OUnit2.assert_equal 2 node_id

let test_node_string_int_name _ =
  match Node.node_string_int with
   | { node_name; _ }  ->
        OUnit2.assert_equal "lily_my_dear" node_name

let test_node_int_int_id _ =
  match Node.node_int_int with
   | { node_id; _ } ->
        OUnit2.assert_equal 3 node_id

let test_node_int_int_name _ =
  match Node.node_int_int with
   | { node_name; _ } ->
        OUnit2.assert_equal "moving_too_fast" node_name

let suite =
  "suite"
  >::: [
         "test_node_int_string_id"
         >:: test_node_int_string_id;
         "test_node_int_string_name"
         >:: test_node_int_string_name;
         "test_node_string_string_id"
         >:: test_node_string_string_id;
         "test_node_string_string_name"
         >:: test_node_string_string_name;
         "test_node_string_int_id"
         >:: test_node_string_int_id;
         "test_node_string_int_name"
         >:: test_node_string_int_name;
         "test_node_int_int_id"
         >:: test_node_int_int_id;
         "test_node_int_int_name"
         >:: test_node_int_int_name;
       ]

let () = run_test_tt_main suite
