(*
open Core
open Async
*)
module Tree = struct
  type 'a tree =
    | Leaf
    | Node of { value : 'a; parents : 'a tree list option; children : 'a tree list }

  let rec get_layer_of_tree (t : 'a tree) : int =
    match t with
    | Leaf -> 0
    | Node { parents; _ } -> (
        match parents with
         | None -> 1
         | Some p ->
            1 + List.fold_left max 0 (List.map get_layer_of_tree p))

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

  let add_child (p : 'a tree) (c : 'a tree) : 'a tree =
    match p with
     | Leaf -> failwith "You are attempting to add a child to a leaf node."
     | Node { value; parents; children } ->
         match parents with
          | None ->
              Node { value; parents = parents; children = children @ [c] }
          | Some _ ->
              Node { value; parents = parents;  children = children @ [c] }

  let add_parent (c : 'a tree) (p : 'a tree) : 'a tree =
    match c with
     | Leaf -> failwith "You are attempting to add a parent to leaf node."
     | Node { value; parents; children } ->
        match parents with
         | None ->
            Node { value; parents = Some [p]; children = children }
         | Some ps ->
            Node { value; parents = Some (p :: ps); children = children}

  let print_int_tree (t : int tree) : unit =
    let rec print_int_node (node : int tree) (indentation : int) : unit =
      let spaces = String.make (indentation * 2) ' ' in
      match node with
      | Leaf -> ()
      | Node { value; parents; children } ->
          (match parents with
           | None ->
              print_endline (spaces ^ string_of_int value);
              List.iter (fun child -> print_int_node child (indentation + 1)) children
           | Some p ->
              (match p with
               | [] ->
                  print_endline (spaces ^ string_of_int value);
                  List.iter (fun child -> print_int_node child (indentation + 1)) children
               | _ :: _ ->
                  print_endline (spaces ^ "|__" ^ string_of_int value);
                  List.iter (fun child ->  print_int_node child (indentation + 1)) children))
    in
    let indentation = get_layer_of_tree t in
    print_int_node t indentation

  let print_tree (t : 'a tree) : unit =
    let rec print_node (node : 'a tree) (indentation : int) : unit =
        let spaces = String.make (indentation * 2) ' ' in
        match node with
        | Leaf -> ()
        | Node { value; parents; children } ->
            (match parents with
            | None ->
                print_endline (spaces ^ value);
                List.iter (fun child -> print_node child (indentation + 1)) children
            | Some p ->
                (match p with
                 | [] ->
                    print_endline (spaces ^ value);
                    List.iter (fun child -> print_node child (indentation + 1)) children
                 | _ :: _ ->
                    print_endline (spaces ^ "|__" ^ value);
                    List.iter (fun child -> print_node child (indentation + 1)) children))
    in
    let indentation = get_layer_of_tree t in
    print_node t indentation

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

  let multiple_parent_tree : int tree =
    Node
      {
        value = 0;
        parents =
          Some
            ([
            (* dad *)
            Node { value = 1; parents = None; children = [] };
            (* mom *)
            Node { value = 2; parents = Some ([Node { value = 3; parents = None; children = []}]); children = [] };
            ]);
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
                                value = 4;
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
                        value = 3;
                        parents =
                          Some
                            ([Node { value = 1; parents = None; children = [] }]);
                        children =
                          [
                            (* grandkid 2 1 kid *)
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
                                children =
                                  [
                                    (* great grand kid *)
                                    Node
                                      {
                                        value = 6;
                                        parents =
                                          Some
                                            ([Node
                                               {
                                                 value = 5;
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
