module AbstractFactory
  module Example

    module OSXGuiToolkit
      extend self

      def button
        Button.new
      end

      class Button
        def paint
          puts "I'm an OSX Button"
        end
      end
    end

    module LinuxGuiToolkit
      extend self

      def button
        Button.new
      end

      class Button
        def paint
          puts "I'm an Linux Button"
        end
      end
    end

    class Application
      def initialize(gui_toolkit)
        button = gui_toolkit.button
        button.paint
      end
    end

    if RUBY_PLATFORM =~ /darwin/
      Application.new(OSXGuiToolkit)
    else
      Application.new(LinuxGuiToolkit)
    end

  end
end
