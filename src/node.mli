module Node : sig
  (** Signatures for the Node Module *)

  (** [('a, 'b) node] is the representation type for node *)
  type ('a, 'b) node =
      { node_id : int;
        node_name : string;
        node_data : ('a * 'b) list;
      }


  val to_string_int_string_node : (int, string) node -> string
  val to_string_string_string_node : (string, string) node -> string
  val to_string_string_int_node : (string, int) node -> string
  val to_string_int_int_node : (int, int) node -> string

  val node_int_string : (int, string) node
  val node_string_string : (string, string) node
  val node_string_int : (string, int) node
  val node_int_int : (int, int) node
end

