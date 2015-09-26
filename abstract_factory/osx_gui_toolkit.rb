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
