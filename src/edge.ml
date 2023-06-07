module Edge = struct
  type ('a, 'b) edge =
      { source_node_id: int;
        target_node_id: int;
        weight: int;
        edge_data : ('a * 'b);
      }
end
