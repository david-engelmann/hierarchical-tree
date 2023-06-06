(*
open Core
open Async
*)

module Tree = struct
  type 'a tree =
    | Leaf
    | Node of { value : 'a; parent : 'a tree option; children : 'a tree list }

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
              | Some (Node { parent = p_node; _ }) ->
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
    | Node { value; parent; children } -> (
        let spaces = String.make (get_layer_of_tree t * 2) ' ' in
        match parent with
        | Some _ -> print_endline (spaces ^ "|__" ^ string_of_int value)
        | None ->
            print_endline (spaces ^ string_of_int value);
            List.iter print_int_tree children)

  let rec print_tree (t : 'a tree) : unit =
    match t with
    | Leaf -> ()
    | Node { value; parent; children } -> (
        let spaces = String.make (get_layer_of_tree t * 2) ' ' in
        match parent with
        | Some _ -> print_endline (spaces ^ "|__" ^ value)
        | None ->
            print_endline (spaces ^ value);
            List.iter print_tree children)

  let tree4 : int tree = Node { value = 4; parent = None; children = [] }

  let string_tree : string tree =
    Node
      {
        value = "father";
        parent = None;
        children =
          [
            Node
              {
                value = "son";
                parent =
                  Some (Node { value = "father"; parent = None; children = [] });
                children = [];
              };
          ];
      }

  let one_parent_tree : int tree =
    Node
      {
        value = 1;
        parent = Some (Node { value = 0; parent = None; children = [] });
        children = [];
      }

  let two_parent_tree : int tree =
    Node
      {
        value = 2;
        parent =
          Some
            (Node
               {
                 value = 1;
                 parent =
                   Some (Node { value = 2; parent = None; children = [] });
                 children = [];
               });
        children = [];
      }

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
                          Some
                            (Node { value = 1; parent = None; children = [] });
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
        parent = None;
        children =
          [
            (* father *)
            Node
              {
                value = 1;
                parent = Some (Node { value = 0; parent = None; children = [] });
                children =
                  [
                    (* kid 1 *)
                    Node
                      {
                        value = 2;
                        parent =
                          Some
                            (Node { value = 1; parent = None; children = [] });
                        children =
                          [
                            (* grandkid 1 no kids *)
                            Node
                              {
                                value = 3;
                                parent =
                                  Some
                                    (Node
                                       {
                                         value = 2;
                                         parent = None;
                                         children = [];
                                       });
                                children = [];
                              };
                          ];
                      };
                    (* kid 2 *)
                    Node
                      {
                        value = 4;
                        parent =
                          Some
                            (Node { value = 1; parent = None; children = [] });
                        children =
                          [
                            (* grandkid 2 1 kid *)
                            Node
                              {
                                value = 3;
                                parent =
                                  Some
                                    (Node
                                       {
                                         value = 2;
                                         parent = None;
                                         children = [];
                                       });
                                children =
                                  [
                                    (* great grand kid *)
                                    Node
                                      {
                                        value = 5;
                                        parent =
                                          Some
                                            (Node
                                               {
                                                 value = 3;
                                                 parent = None;
                                                 children = [];
                                               });
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
