(*
open Core
open Async
*)

module Tree = struct
  type 'a tree =
    | Leaf
    | Node of { value : 'a; parents : 'a tree list option; children : 'a tree list }

  let get_layer_of_tree (t : 'a tree) : int =
    match t with
    | Leaf -> 0
    | Node { parents; _ } ->
        let l = ref 0 in
        let current_node = ref (Some parents) in
        while !current_node <> None do
          l := !l + 1;
          match !current_node with
          | Some p -> (
              match p with
              | Some ([Node { parents = p_node; _ }]) ->
                  current_node := Some p_node
              | _ -> current_node := None)
          | None -> ()
        done;
        !l

  let rec get_lowest_layer_of_tree (t : 'a tree) : int =
    match t with
    | Leaf -> 0
    | Node { children; _ } -> (
        match children with
        | [] -> 1
        | hd :: res ->
            1
            + List.fold_left max
                (get_lowest_layer_of_tree hd)
                (List.map get_lowest_layer_of_tree res))

  let rec print_int_tree (t : int tree) : unit =
    match t with
    | Leaf -> ()
    | Node { value; parents; children } -> (
        let spaces = String.make (get_layer_of_tree t * 2) ' ' in
        match parents with
        | Some _ -> print_endline (spaces ^ "|__" ^ string_of_int value)
        | None ->
            print_endline (spaces ^ string_of_int value);
            List.iter print_int_tree children)

  let rec print_tree (t : 'a tree) : unit =
    match t with
    | Leaf -> ()
    | Node { value; parents; children } -> (
        let spaces = String.make (get_layer_of_tree t * 2) ' ' in
        match parents with
        | Some _ -> print_endline (spaces ^ "|__" ^ value)
        | None ->
            print_endline (spaces ^ value);
            List.iter print_tree children)

  let tree4 : int tree = Node { value = 4; parents = None; children = [] }

  let string_tree : string tree =
    Node
      {
        value = "father";
        parents = None;
        children =
          [
            Node
              {
                value = "son";
                parents =
                  Some ([Node { value = "father"; parents = None; children = [] }]);
                children = [];
              };
          ];
      }

  let one_parent_tree : int tree =
    Node
      {
        value = 1;
        parents = Some ([Node { value = 0; parents = None; children = [] }]);
        children = [];
      }

  let two_parent_tree : int tree =
    Node
      {
        value = 2;
        parents =
          Some
            ([Node
               {
                 value = 1;
                 parents =
                     Some ([Node { value = 2; parents = None; children = [] }]);
                 children = [];
               }]);
        children = [];
      }

  let parent_tree : int tree =
    Node
      {
        value = 0;
        parents = None;
        children =
          [
            Node
              {
                value = 1;
                parents = Some ([Node { value = 0; parents = None; children = [] }]);
                children = [];
              };
          ];
      }

  let grand_parent_tree : int tree =
    Node
      {
        value = 0;
        parents = None;
        children =
          [
            Node
              {
                value = 1;
                parents = Some ([Node { value = 0; parents = None; children = [] }]);
                children =
                  [
                    Node
                      {
                        value = 2;
                        parents =
                          Some
                            ([Node { value = 1; parents = None; children = [] }]);
                        children = [];
                      };
                  ];
              };
          ];
      }

  let two_children_tree : int tree =
    (* grandpa *)
    Node
      {
        value = 0;
        parents = None;
        children =
          [
            (* father *)
            Node
              {
                value = 1;
                parents = Some ([Node { value = 0; parents = None; children = [] }]);
                children =
                  [
                    (* kid 1 *)
                    Node
                      {
                        value = 2;
                        parents =
                          Some
                            ([Node { value = 1; parents = None; children = [] }]);
                        children =
                          [
                            (* grandkid 1 no kids *)
                            Node
                              {
                                value = 3;
                                parents =
                                  Some
                                    ([Node
                                       {
                                         value = 2;
                                         parents = None;
                                         children = [];
                                       }]);
                                children = [];
                              };
                          ];
                      };
                    (* kid 2 *)
                    Node
                      {
                        value = 4;
                        parents =
                          Some
                            ([Node { value = 1; parents = None; children = [] }]);
                        children =
                          [
                            (* grandkid 2 1 kid *)
                            Node
                              {
                                value = 3;
                                parents =
                                  Some
                                    ([Node
                                       {
                                         value = 2;
                                         parents = None;
                                         children = [];
                                       }]);
                                children =
                                  [
                                    (* great grand kid *)
                                    Node
                                      {
                                        value = 5;
                                        parents =
                                          Some
                                            ([Node
                                               {
                                                 value = 3;
                                                 parents = None;
                                                 children = [];
                                               }]);
                                        children = [];
                                      };
                                  ];
                              };
                          ];
                      };
                  ];
              };
          ];
      }
end
