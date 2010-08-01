# encoding: utf-8
module Mongoid
  module Sortable
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def has_many_sortable(*args)
        #树型collection无法使用embed结构
        options = { :embed => true }.merge(args.extract_options!)
        parent_associations = options[:embed] ? :embeds_many : :references_many
        
        args.each do |children_name|
          #parent
          parent_name = self.name.singularize
          send parent_associations, children_name, :dependent => :destroy

          define_method "sorted_#{children_name}" do
            send(children_name).sort {|x, y| x.pos <=> y.pos}
          end
        end
      end

      def sortable_belong_to(*args)
        options = { :embed => true }.merge(args.extract_options!)
        child_associations = options[:embed] ? :embedded_in : :referenced_in
        parent_name = args.first
        send :include, ActsAsList::Mongoid

        #排序
        field :pos, :type => Integer
        acts_as_list :column => :pos
        #页面传递的参数，用于新增时指明其所在的参照数哪个位置(前或后)
        attr_accessor :neighbor, :direct

        send child_associations, parent_name, :inverse_of => collection_name

        #一定要初始化pos
        after_create :init_pos

        class_eval do
          define_method :init_pos do
            direct_parent = send(parent_name) ? send(parent_name) : send(:parent)
            direct_children_name = send(parent_name) ? collection_name : :children
            direct_parent.send(direct_children_name).init_list!
            if direct
              move(direct.to_sym => direct_parent.send(direct_children_name).find(neighbor))
              direct_parent.save
            end
          end
        end
      end
    end

  end
end
