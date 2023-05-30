(*
open Core
open Async
*)

let (x : int) = 5

type node = {
    name: string;
    parent: string;
}

let first_node: node = {
    name = "son";
    parent = "dad";
}
