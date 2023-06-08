module Edge : sig
  (** Signatures for the Edge Module *)

  (** [('a, 'b) edge] is the representation type for edge *)
  type ('a, 'b) edge =
      { source_node_id : int;
        target_node_id : int;
        weight : int;
        edge_data : ('a * 'b) list;
      }

  (** [to_string_int_string_edge (int, string) edge] returns a string
   * representation of a (int, string) edge *)
  val to_string_int_string_edge : (int, string) edge -> string

  (** [to_string_string_string_edge (string, string) edge] returns a string
   * representation of a (string, string) edge *)
  val to_string_string_string_edge : (string, string) edge -> string

  (** [to_string_string_int_edge (string, int) edge] returns a string
   * representation of a (string, int) edge *)
  val to_string_string_int_edge : (string, int) edge -> string

  (** [to_string_int_int_edge (int, int) edge] returns a string
   * representation of a (int, int) edge *)
  val to_string_int_int_edge : (int, int) edge -> string

  (** [to_string_no_edge_data ('a, 'b) edge] returns a string
   * representation of a ('a, 'b) without edge data *)
  val to_string_no_edge_data : ('a, 'b) edge -> string

  (** test cases to remove after working *)
  val edge_int_string : (int, string) edge

  val edge_string_string : (string, string) edge

  val edge_string_int : (string, int) edge

  val edge_int_int : (int, int) edge
end

