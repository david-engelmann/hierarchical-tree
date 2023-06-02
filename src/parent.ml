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
