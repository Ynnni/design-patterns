module Adapter
  module Example

    module Marky
      extend self

      def adapter
        return @adapter if @adapter
        self.adapter = :rdiscount
        @adapter
      end

      def adapter=(adapter)
        case adapter
        when Symbol, String
          @adapter = Marky::Adapters.const_get("#{adapter.to_s.capitalize}")
        when Module
          @adapter = adapter
        else
          raise "Missing adapter #{adapter}"
        end
      end

      def to_html(string)
        adapter.to_html(string)
      end

      module Adapters

        module Bluecloth
          extend self

          def to_html(string)
            ::BlueCloth.new(string).to_html
          end
        end

        module Rdiscount
          extend self

          def to_html(string)
            ::RDiscount.new(string).to_html
          end
        end
      end

    end

    Marky.adapter = :rdiscount
    puts Marky.adapter
  end
end
