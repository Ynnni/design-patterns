require_relative 'osx_gui_toolkit'
require_relative 'linux_gui_toolkit'

class Application
  def initialize(gui_toolkit)
    button = gui_toolkit.button
    button.paint
  end
end

# this check is a very quick hack, not reliable.
if RUBY_PLATFORM =~ /darwin/
  Application.new(OSXGuiToolkit)
else
  Application.new(LinuxGuiToolkit)
end
