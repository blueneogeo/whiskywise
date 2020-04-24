# frozen_string_literal: true

# typed: strong

module SorbetRails::CustomParamsMethods
  extend T::Sig

  sig do
    type_parameters(:U)
      .params(key: Symbol, ta: ITypeAssert[T.type_parameter(:U)])
      .returns(T.type_parameter(:U))
  end
  def require_typed(key, ta); end

  # Note: when default value is a hash, it'll be converted into an ActionController::Parameters
  sig do
    type_parameters(:U)
      .params(
        key: Symbol,
        ta: ITypeAssert[T.type_parameter(:U)],
        args: T.untyped
      )
      .returns(T.type_parameter(:U))
  end
  def fetch_typed(key, ta, *args); end
end

class ActionController::Parameters
  include SorbetRails::CustomParamsMethods
end
