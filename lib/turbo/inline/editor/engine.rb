# frozen_string_literal: true

module Turbo
  module Inline
    module Editor
      class Engine < Rails::Engine
        initializer "turbo_inline_editor" do
          ActiveSupport.on_load(:action_view) { include Turbo::Inline::Editor::Helper }
        end
      end
    end
  end
end
