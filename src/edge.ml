module Edge = struct
  type ('a, 'b) edge = {
    source_node_id : int;
    target_node_id : int;
    weight : int;
    edge_data : ('a * 'b) list;
  }

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
