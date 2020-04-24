# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/react-rails/all/react-rails.rbi
#
# react-rails-2.6.1

module React
  def self.camelize_props(props); end
end
module React::JSX
  def self.transform(code); end
  def self.transform_options; end
  def self.transform_options=(obj); end
  def self.transformer; end
  def self.transformer=(obj); end
  def self.transformer_class; end
  def self.transformer_class=(obj); end
  def transform_options; end
  def transform_options=(obj); end
  def transformer; end
  def transformer=(obj); end
  def transformer_class; end
  def transformer_class=(obj); end
end
class React::JSX::Processor
  def self.call(input); end
end
class React::JSX::Template < Tilt::Template
  def evaluate(scope, locals, &block); end
  def prepare; end
end
class React::JSX::JSXTransformer
  def initialize(options); end
  def jsx_transform_code; end
  def transform(code); end
end
class React::JSX::BabelTransformer
  def initialize(options); end
  def transform(code); end
end
module React::JSX::SprocketsStrategy
  def attach_with_strategy(sprockets_env, strategy_or_nil); end
  def detect_strategy; end
  def register_engine(sprockets_env); end
  def register_engine_with_mime_type(sprockets_env); end
  def register_processors(sprockets_env); end
  def self.attach_with_strategy(sprockets_env, strategy_or_nil); end
  def self.detect_strategy; end
  def self.register_engine(sprockets_env); end
  def self.register_engine_with_mime_type(sprockets_env); end
  def self.register_processors(sprockets_env); end
end
module React::Rails
end
class React::Rails::AssetVariant
  def initialize(options = nil); end
  def jsx_directory; end
  def react_build; end
  def react_directory; end
end
class React::Rails::Railtie < Rails::Railtie
end
module React::Rails::ControllerLifecycle
  def per_request_react_rails_prerenderer; end
  def react_rails_prerenderer; end
  def use_react_component_helper; end
  extend ActiveSupport::Concern
end
module React::Rails::ControllerLifecycle::ClassMethods
  def per_request_react_rails_prerenderer; end
end
class React::Rails::ComponentMount
  def camelize_props_switch; end
  def camelize_props_switch=(obj); end
  def initialize; end
  def output_buffer; end
  def output_buffer=(arg0); end
  def prerender_component(component_name, props, prerender_options); end
  def react_component(name, props = nil, options = nil, &block); end
  def self.camelize_props_switch; end
  def self.camelize_props_switch=(obj); end
  def setup(controller); end
  def teardown(controller); end
  extend ActionView::Helpers::SanitizeHelper::ClassMethods
  include ActionView::Helpers::SanitizeHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
end
module React::Rails::ViewHelper
  def helper_implementation_class; end
  def helper_implementation_class=(obj); end
  def react_component(*args, &block); end
  def self.helper_implementation_class; end
  def self.helper_implementation_class=(obj); end
end
class React::Rails::ControllerRenderer
  def call(component_name, options, &block); end
  def default_options; end
  def initialize(options = nil); end
  def output_buffer; end
  def output_buffer=(arg0); end
  extend ActionView::Helpers::SanitizeHelper::ClassMethods
  include ActionView::Helpers::SanitizeHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include React::Rails::ViewHelper
end
module React::ServerRendering
  def pool_size; end
  def pool_size=(obj); end
  def pool_timeout; end
  def pool_timeout=(obj); end
  def renderer; end
  def renderer=(obj); end
  def renderer_options; end
  def renderer_options=(obj); end
  def self.pool_size; end
  def self.pool_size=(obj); end
  def self.pool_timeout; end
  def self.pool_timeout=(obj); end
  def self.render(component_name, props, prerender_options); end
  def self.renderer; end
  def self.renderer=(obj); end
  def self.renderer_options; end
  def self.renderer_options=(obj); end
  def self.reset_pool; end
  def self.with_renderer; end
end
class React::ServerRendering::ExecJSRenderer
  def after_render(component_name, props, prerender_options); end
  def before_render(component_name, props, prerender_options); end
  def compose_js(before, main, after); end
  def context; end
  def initialize(options = nil); end
  def main_render(component_name, props, prerender_options); end
  def render(component_name, props, prerender_options); end
  def render_from_parts(before, main, after); end
end
class React::ServerRendering::EnvironmentContainer
  def find_asset(logical_path); end
  def initialize; end
end
class React::ServerRendering::ManifestContainer
  def find_asset(logical_path); end
  def initialize; end
  def self.compatible?; end
end
class React::ServerRendering::WebpackerManifestContainer
  def config; end
  def file_path(path); end
  def find_asset(logical_path); end
  def manifest; end
  def output_path; end
  def self.compatible?; end
end
class React::ServerRendering::YamlManifestContainer
  def find_asset(logical_path); end
  def initialize; end
  def public_asset_path(asset_name); end
  def self.compatible?; end
end
class React::ServerRendering::BundleRenderer < React::ServerRendering::ExecJSRenderer
  def after_render(component_name, props, prerender_options); end
  def asset_container; end
  def asset_container_class; end
  def assets_precompiled?; end
  def before_render(component_name, props, prerender_options); end
  def initialize(options = nil); end
  def prepare_options(options); end
  def prepare_props(props); end
  def render(component_name, props, prerender_options); end
  def render_function(opts); end
  def self.asset_container_class; end
  def self.asset_container_class=(arg0); end
end
class React::ServerRendering::PrerenderError < RuntimeError
  def initialize(component_name, props, js_message); end
end
