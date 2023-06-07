
open OUnit2
open Hierarchical_tree.Edge

let test_edge_int_string_source_node_id _ =
  match Edge.edge_int_string with
   | { source_node_id; _ } ->
        OUnit2.assert_equal 0 source_node_id

let test_edge_int_string_target_node_id _ =
  match Edge.edge_int_string with
   | { target_node_id; _ } ->
        OUnit2.assert_equal 1 target_node_id

let test_edge_int_string_weight _ =
  match Edge.edge_int_string with
   | { weight; _ } ->
        OUnit2.assert_equal 1 weight

let test_edge_string_string_source_node_id _ =
  match Edge.edge_string_string with
   | { source_node_id; _ } ->
        OUnit2.assert_equal 0 source_node_id

let test_edge_string_string_target_node_id _ =
  match Edge.edge_string_string with
   | { target_node_id; _ } ->
        OUnit2.assert_equal 1 target_node_id

let test_edge_string_string_weight _ =
  match Edge.edge_string_string with
   | { weight; _ } ->
        OUnit2.assert_equal 1 weight

let test_edge_string_int_source_node_id _ =
  match Edge.edge_string_int with
   | { source_node_id; _ } ->
        OUnit2.assert_equal 0 source_node_id

let test_edge_string_int_target_node_id _ =
  match Edge.edge_string_int with
   | { target_node_id; _ } ->
        OUnit2.assert_equal 1 target_node_id

let test_edge_string_int_weight _ =
  match Edge.edge_string_int with
   | { weight; _ } ->
        OUnit2.assert_equal 1 weight

let test_edge_int_int_source_node_id _ =
  match Edge.edge_int_int with
   | { source_node_id; _ } ->
        OUnit2.assert_equal 0 source_node_id

let test_edge_int_int_target_node_id _ =
  match Edge.edge_int_int with
   | { target_node_id; _ } ->
        OUnit2.assert_equal 1 target_node_id

let test_edge_int_int_weight _ =
  match Edge.edge_int_int with
   | { weight; _ } ->
        OUnit2.assert_equal 1 weight

let suite =
  "suite"
  >::: [
         "test_edge_int_string_source_node_id"
         >:: test_edge_int_string_source_node_id;
         "test_edge_int_string_target_node_id"
         >:: test_edge_int_string_target_node_id;
         "test_edge_int_string_weight"
         >:: test_edge_int_string_weight;

         "test_edge_string_string_source_node_id"
         >:: test_edge_string_string_source_node_id;
         "test_edge_string_string_target_node_id"
         >:: test_edge_string_string_target_node_id;
         "test_edge_string_string_weight"
         >:: test_edge_string_string_weight;

         "test_edge_string_int_source_node_id"
         >:: test_edge_string_int_source_node_id;
         "test_edge_string_int_target_node_id"
         >:: test_edge_string_int_target_node_id;
         "test_edge_string_int_weight"
         >:: test_edge_string_int_weight;

         "test_edge_int_int_source_node_id"
         >:: test_edge_int_int_source_node_id;
         "test_edge_int_int_target_node_id"
         >:: test_edge_int_int_target_node_id;
         "test_edge_int_int_weight"
         >:: test_edge_int_int_weight;
       ]

let () = run_test_tt_main suite
