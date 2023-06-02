(*
open Core
open Async
*)

type 'a tree =
  | Leaf
  | Node of {
      value : 'a;
      parent : 'a tree option;
      children : 'a tree list;
      layer : int;
    }

let rec print_int_tree (t : int tree) : unit =
  match t with
  | Leaf -> ()
  | Node { value; children; layer; _ } ->
      let indentation = String.make (layer * 2) ' ' in
      print_endline (indentation ^ "Value: " ^ string_of_int value);
      List.iter print_int_tree children

let get_layer_of_tree (t : 'a tree) : int =
  match t with
  | Leaf -> 0
  | Node { parent; _ } ->
      let l = ref 0 in
      let current_node = ref (Some parent) in
      while !current_node <> None do
        l := !l + 1;
        match !current_node with
        | Some p -> (
            match p with
            | Some (Node { parent = p_node; _ }) -> current_node := Some p_node
            | _ -> current_node := None)
        | None -> ()
      done;
      !l

let get_lowest_layer_of_tree (t: 'a tree) : int =
    match t with
    | Leaf -> 0
    | Node _ -> 1

let tree4 : int tree =
  Node { value = 4; parent = None; children = []; layer = 0 }

let parent_tree : int tree =
  Node
    {
      value = 0;
      parent = None;
      children =
        [
          Node
            {
              value = 1;
              parent =
                Some
                  (Node { value = 0; parent = None; children = []; layer = 0 });
              children = [];
              layer = 1;
            };
        ];
      layer = 0;
    }

let grand_parent_tree : int tree =
  Node
    {
      value = 0;
      parent = None;
      children =
        [
          Node
            {
              value = 1;
              parent =
                Some
                  (Node { value = 0; parent = None; children = []; layer = 0 });
              children =
                [
                  Node
                    {
                      value = 2;
                      parent =
                        Some
                          (Node
                             {
                               value = 1;
                               parent = None;
                               children = [];
                               layer = 1;
                             });
                      children = [];
                      layer = 2;
                    };
                ];
              layer = 1;
            };
        ];
      layer = 0;
    }
