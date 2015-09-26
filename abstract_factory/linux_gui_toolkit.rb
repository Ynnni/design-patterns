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
