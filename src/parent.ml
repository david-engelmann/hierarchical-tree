(*
open Core
open Async
*)


type 'a node =
    | Leaf
    | Node of { value: 'a; parent: 'a node option; children: 'a node list }


(*{
    name: string;
    parent: string;
    children:
}*)

(*let son_node: node = {
    name = "son";
    parent = "dad";
}

let parent_node: node = {
    name = "dad";
    parent = "gp";
}*)
