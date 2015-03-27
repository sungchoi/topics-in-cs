module SymCalc

  class Expression

      def initialize(string)
        @tokens = string.split(" ")
        @btree = build_btree(@tokens)
      end

      #TODO
      # @return [BOOLEAN]
      def valid?
        # all tokens valid? right number of operators and tokens?
      end

      # @return [BTree::BTree]
      def build_btree(tokens)
        tokens.map do |token|
          case token
          when OPERATORS.include?(token)
            BTree::Node.new(token)
          when OPERANDS.include?(token)
            BTree::Leaf.new(token)
          end
        end

        # build btree
        btree = BTree::BTree.new(tokens.pop)
        current_node = btree.root

        while tokens.count > 0
          token = tokens.pop
          klass = token.class

          if !current_node.right
            current_node.right = token
          else
            current_node.left = token
            if klass == Leaf && tokens.count > 0
              current_node = find_upper_most_not_full_node(btree)
            end
          end

          if klass == Node
            current_node = token
          end

          # default current_node will stay the same so that it can fill the left side

          end

        end

        btree
      end

      def find_upper_most_not_full_node(btree) #lower most? closest to the root.
        # this only works because we always assign the right side first
        # TODO write a more generalized version of this inside of btree class
        current_node = btree.root
        while current_node.full? && current_node.left
          current_node = current_node.left
        end
        # what if there isn't one
        current_node
      end

    end

end
