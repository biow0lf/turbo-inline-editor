# frozen_string_literal: true

require "rails/engine"

module TurboInlineEditor
  class Engine < Rails::Engine
    initializer "turbo_inline_editor" do
      ActiveSupport.on_load(:action_view) { include TurboInlineEditor::Helper }
    end
  end
end
