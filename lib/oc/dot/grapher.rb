require_relative "indented_out"

module Oc
  module DOT
    class Grapher
      def initialize(out)
        @out = Oc::DOT::IndentedOut.new(out)
      end

      def graph_config(config)
        config.each do |thing,value|
          if value.kind_of?(Hash)
            values = value.map { |k,v|
              "#{k}=#{v}"
            }.join(" ")
            @out.puts "#{thing}[#{values}]"
          else
            @out.puts "#{thing}=#{value}"
          end
        end
      end

      def node(name,nodes_pointed_at: [])
        dependent_nodes = if nodes_pointed_at.size > 0
                            "-> {#{nodes_pointed_at.join(',')}}"
                          else
                            ""
                          end
        @out.puts "#{name} #{dependent_nodes}"
      end

      def mrecord(name,label_parts)
        label = label_parts.each_with_index.map { |part,i|
          "<f#{i}> #{part}"
        }.join(" | ")
        @out.puts "#{name} [ label=\"{#{label}}\" shape=Mrecord ];"
      end

      def digraph(name,&block)
        @out.puts "digraph #{parameterize(name)} {"
        @out.indent do
          block.()
        end
        @out.puts "}"
      end

      def label(value)
        @out.puts "label = \"#{value}\";"
      end

      def subgraph(name,label=nil,render_if: true, &block)
        subgraph_name = if render_if
                          "cluster_#{parameterize(name)}"
                        else
                          parameterize(name)
                        end
        subgraph_label = if label && render_if
                           label
                         else
                           nil
                         end
        @out.puts "subgraph #{subgraph_name} {"
        @out.indent do
          label(subgraph_label) if subgraph_label
          block.()
        end
        @out.puts "}"
      end

      private

      def parameterize(value)
        value.downcase.gsub(/\s/,'_')
      end

    end
  end
end
