(*
open Core
open Async
*)

type 'a tree =
  | Leaf
  | Node of { value : 'a; parent : 'a tree option; children : 'a tree list; level: int }

let tree4 : int tree = Node { value = 4; parent = None; children = []; level = 0 }

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
              parent = Some (Node { value = 0; parent = None; children = []; level = 0 });
              children = [];
              level = 1;
            };
        ];
      level = 0;
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
              parent = Some (Node { value = 0; parent = None; children = []; level = 0 });
              children =
                [
                  Node
                    {
                      value = 2;
                      parent =
                          Some (Node { value = 1; parent = None; children = []; level = 1});
                      children = [];
                      level = 2;
                    };
                ];
              level = 1
            };
        ];
      level = 0;
    }
