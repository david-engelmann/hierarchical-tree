type ('a, 'b) node =
    { node_id : int;
      node_name : string;
      node_data : ('a * 'b) list;
    }

let node_int_string : (int, string) node = { node_id = 0; node_name = "july_jackson"; node_data = [(0, "wife"); (1, "kids")] }

let node_string_string : (string, string) node = { node_id = 1; node_name = "tom_turkey"; node_data = [("low", "down"); ("your", "friend")] }

let node_string_int : (string, int) node = { node_id = 2; node_name = "lily_my_dear"; node_data = [("gambled in texas", 0); ("sure use me", 5)] }

let node_int_int : (int, int) node = { node_id = 2; node_name = "moving_too_fast"; node_data = [(5, 18); (51, 8)] }
