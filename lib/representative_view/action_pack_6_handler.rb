require 'representative_view/view_helpers'

module RepresentativeView

  class ActionPack6Handler

    def self.call(template, source)
      <<-RUBY
      representative_view(formats.first) do |r|
        #{source}
      end
      RUBY
    end

  end

end

ActionView::Template.register_template_handler(:rep, RepresentativeView::ActionPack6Handler)
