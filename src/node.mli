module Node : sig
  (** Signatures for the Node Module *)

  (** [('a, 'b) node] is the representation type for node *)
  type ('a, 'b) node =
      { node_id : int;
        node_name : string;
        node_data : ('a * 'b) list;
      }

  (** [to_string_int_string_node (int, string) node] returns a string
   * representation of a (int, string) node *)
  val to_string_int_string_node : (int, string) node -> string

  (** [to_string_string_string_node (string, string) node] returns a string
   * representation of a (string, string) node *)
  val to_string_string_string_node : (string, string) node -> string

  (** [to_string_string_int_node (string, int) node] returns a string
   * representation of a (string, int) node *)
  val to_string_string_int_node : (string, int) node -> string

  (** [to_string_int_int_node (int, int) node] returns a string
   * representation of a (int, int) node *)
  val to_string_int_int_node : (int, int) node -> string

  (** test cases to remove after working *)
  val node_int_string : (int, string) node

  val node_string_string : (string, string) node

  val node_string_int : (string, int) node

  val node_int_int : (int, int) node
end

