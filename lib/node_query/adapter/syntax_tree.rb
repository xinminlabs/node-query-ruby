# frozen_string_literal: true

require 'syntax_tree'
require 'syntax_tree_ext'

class NodeQuery::SyntaxTreeAdapter
  def is_node?(node)
    node.is_a?(SyntaxTree::Node)
  end

  def get_node_type(node)
    node.class.name.split('::').last.to_sym
  end

  def get_source(node)
    node.to_source
  end

  def get_children(node)
    node.deconstruct_keys([]).filter { |key, _value| ![:location, :comments].include?(key) }
        .values
  end

  def get_siblings(node)
    child_nodes = get_children(node.parent_node)
    if child_nodes.is_a?(Array) && child_nodes.size == 1 && child_nodes.first.is_a?(Array)
      index = child_nodes.first.index(node)
      return child_nodes.first[index + 1...]
    end

    index = child_nodes.index(node)
    child_nodes[index + 1...]
  end
end
