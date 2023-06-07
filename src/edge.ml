module Edge = struct
  type ('a, 'b) edge = {
    source_node_id : int;
    target_node_id : int;
    weight : int;
    edge_data : ('a * 'b) list;
  }

  let to_string_int_string_edge (t : (int, string) edge) : string =
    let edge_data_str = List.map (fun (x, y) -> "(" ^ string_of_int x ^ ", " ^ "\"" ^ y ^ "\"" ^ ")") t.edge_data in
    let edge_data_str = String.concat "; " edge_data_str in
    "{ source_node_id = " ^ string_of_int t.source_node_id ^
    "; target_node_id = " ^ string_of_int t.target_node_id ^
    "; weight = " ^ string_of_int t.weight ^
    "; edge_data = [" ^ edge_data_str ^ "] }"

  let to_string_string_string_edge (t : (string, string) edge) : string =
    let edge_data_str = List.map (fun (x, y) -> "(" ^ "\"" ^ x ^ "\"" ^ ", " ^ "\"" ^ y ^ "\"" ^ ")") t.edge_data in
    let edge_data_str = String.concat "; " edge_data_str in
    "{ source_node_id = " ^ string_of_int t.source_node_id ^
    "; target_node_id = " ^ string_of_int t.target_node_id ^
    "; weight = " ^ string_of_int t.weight ^
    "; edge_data = [" ^ edge_data_str ^ "] }"

  let edge_int_string : (int, string) edge =
    {
      source_node_id = 0;
      target_node_id = 1;
      weight = 100;
      edge_data = [ (1997, "graduate"); (2002, "teacher") ];
    }

  let edge_string_string : (string, string) edge =
    {
      source_node_id = 0;
      target_node_id = 1;
      weight = 100;
      edge_data = [ ("relation", "dependent") ];
    }

  let edge_string_int : (string, int) edge =
    {
      source_node_id = 0;
      target_node_id = 1;
      weight = 100;
      edge_data = [ ("start_year", 1997); ("end_year", 2002) ];
    }

  let edge_int_int : (int, int) edge =
    {
      source_node_id = 0;
      target_node_id = 1;
      weight = 100;
      edge_data = [ (5, 18); (5, 18) ];
    }
end
