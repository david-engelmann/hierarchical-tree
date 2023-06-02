(*
open Core
open Async
*)

type 'a tree =
  | Leaf
  | Node of { value : 'a; parent : 'a tree option; children : 'a tree list }

let tree4 : int tree = Node { value = 4; parent = None; children = [] }

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
              parent = Some (Node { value = 0; parent = None; children = [] });
              children = [];
            };
        ];
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
              parent = Some (Node { value = 0; parent = None; children = [] });
              children =
                [
                  Node
                    {
                      value = 2;
                      parent =
                        Some (Node { value = 1; parent = None; children = [] });
                      children = [];
                    };
                ];
            };
        ];
    }
