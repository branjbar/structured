D = [];

function main(V,E)  % this functions finds all the driver nodes of G = [V,E]
  while length(V) > 0
    sink = find_a_sink_node(V)
    [stem_nodes,driver_node] = find_stem(sink, [])
    D(end+1) = driver_node  
    % remove stem_nodes from V  
  end
end  

function [stem_nodes,driver_node] = find_stem(sink, selected_nodes)
  selected_nodes(end+1) = sink;
  
  parent_nodes = get_parent(sink, selected_nodes);
  if size(parents_nodes) == 0  % if we're at the end of stem and no parent exists.
    stem_nodes = sink;
    driver_node = sink;
    return
  end
  
  if size(parent_nodes) == 1  % if not more than one parent exists
    [stem_nodes,driver_node] = find_stem(parent_nodes[1], selected_nodes);
    stem_nodes(end+1) = sink
    return
  else
    stem_nodes_size = 0;
    for i = 1 : length(parent_nodes)  % here in a greedy way we use the parent who returns us the largest stem
      [stem_nodes_new,driver_node_new] = find_stem(parent_nodes[i], selected_nodes);
      if length(stem_nodes_new) > stem_nodes_size
        stem_nodes_size = length(stem_nodes_new);
        [stem_nodes,driver_node] = [stem_nodes_new,driver_node_new]
      end
    end
    return
  end
  
end

function parent_nodes = get_parent(sink, selected_nodes)

  % find all parents of the sink which are not selected in the same stem and put them in parents_nodes array

end

function = find_a_sink_node(V)
 % here we look into the graph to find a sink node.
end 

