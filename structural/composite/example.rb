module Composite
  module Example
    # [Description]
    # In software engineering, the composite pattern is a partitioning
    # design pattern. The composite pattern describes that a group of
    # objects are to be treated in the same way as a single instance of an object.
    # The intent of a composite is to “compose” objects into tree structures
    # to represent part-whole hierarchies. Implementing the composite pattern
    # lets clients treat individual objects and compositions uniformly.
    #
    # [Collaborators]
    # Component:: {Task}
    # Leaf::      {MakeHardware}, {UploadSoftware}
    # Composite:: {Composite}, {MakePhone}

    # [Role] Component
    # Common interface
    class Task
      attr_reader :name

      def initialize(name)
        @name = name
      end

      def required_time
        fail "#{self.class.name} does not implement required_time"
      end
    end

    # [Role] Leaf
    # These are the simple, indivisible building blocks of the process.
    # If we were making a pizza, you could consider each ingredient (i.e. cheese,
    # tomato sauce and flour) as a simple enough division to be considered a building block.
    # These indivisible leaf classes should implement the component interface.
    # For instance, a higher level component could be ingredients, preparation,
    # creation, packaging, and delivery.
    class MakeHardware < Task
      def initialize
        super 'Make hardware'
      end

      def required_time
        3.0
      end
    end

    class UploadSoftware < Task
      def initialize
        super 'Upload software'
      end

      def required_time
        1.0
      end
    end

    # [Role] Composite
    # It makes sense to factor out the details of managing
    # the child tasks into another base class
    class Composite < Task
      attr_reader :subtasks

      def initialize(name)
        super
        @subtasks = []
      end

      def required_time
        @subtasks.inject(0) { |time, task| time + task.required_time }
      end
    end

    # [Role] Composite
    # The composite is a component, but its also a higher-level object
    # that is built from subcomponents in a manner consistent with the law of demeter.
    # Worded a little differently, composites are just complex tasks made up of subtasks.

    # Obie says that the key point to remember about composite objects
    # is that the tree may be arbitrarily deep.
    class MakePhone < Composite
      def initialize
        super 'Make Phone'
        @subtasks << MakeHardware.new
        @subtasks << UploadSoftware.new
      end
    end

  end
end
