module Node = struct
    type ('a, 'b) node =
        { node_id : int;
          node_name : string;
          node_data : ('a * 'b) list;
        }

    let to_string_int_string_node ( n : (int, string) node) : string =
      let node_data_str = List.map (fun (x, y) -> "(" ^ string_of_int x ^ ", " ^ "\"" ^ y ^ "\"" ^ ")") n.node_data in
      let node_data_str = String.concat "; " node_data_str in
      "{ node_id = " ^ string_of_int n.node_id ^
      "; node_name = " ^ n.node_name ^
      "; node_data = [" ^ node_data_str ^ "] }"

    let to_string_string_string_node ( n : (string, string) node) : string =
      let node_data_str = List.map (fun (x, y) -> "(" ^ "\"" ^ x ^ "\"" ^ ", " ^ "\"" ^ y ^ "\"" ^ ")") n.node_data in
      let node_data_str = String.concat "; " node_data_str in
      "{ node_id = " ^ string_of_int n.node_id ^
      "; node_name = " ^ n.node_name ^
      "; node_data = [" ^ node_data_str ^ "] }"

    let to_string_string_int_node ( n : (string, int) node) : string =
      let node_data_str = List.map (fun (x, y) -> "(" ^ "\"" ^ x ^ "\"" ^ ", " ^ "\"" ^ string_of_int y ^ "\"" ^ ")") n.node_data in
      let node_data_str = String.concat "; " node_data_str in
      "{ node_id = " ^ string_of_int n.node_id ^
      "; node_name = " ^ n.node_name ^
      "; node_data = [" ^ node_data_str ^ "] }"

    let to_string_int_int_node ( n : (int, int) node) : string =
      let node_data_str = List.map (fun (x, y) -> "(" ^ "\"" ^ string_of_int x ^ "\"" ^ ", " ^ "\"" ^ string_of_int y ^ "\"" ^ ")") n.node_data in
      let node_data_str = String.concat "; " node_data_str in
      "{ node_id = " ^ string_of_int n.node_id ^
      "; node_name = " ^ n.node_name ^
      "; node_data = [" ^ node_data_str ^ "] }"


    let node_int_string : (int, string) node = { node_id = 0; node_name = "july_jackson"; node_data = [(0, "wife"); (1, "kids")] }

    let node_string_string : (string, string) node = { node_id = 1; node_name = "tom_turkey"; node_data = [("low", "down"); ("your", "friend")] }

    let node_string_int : (string, int) node = { node_id = 2; node_name = "lily_my_dear"; node_data = [("gambled in texas", 0); ("sure use me", 5)] }

    let node_int_int : (int, int) node = { node_id = 3; node_name = "moving_too_fast"; node_data = [(5, 18); (51, 8)] }
end
