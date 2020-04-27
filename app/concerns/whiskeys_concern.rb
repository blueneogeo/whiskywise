# typed: true

module WhiskeysConcern
  extend T::Sig
  extend ActiveSupport::Concern

  class_methods do
    # find all whiskeys given some parameters
    # FIX: can not get this to work yet
    # sig do
    #   params(
    #     user: User,
    #     contains: T.nilable(String),
    #     taste: T.nilable(Integer),
    #     color: T.nilable(Integer),
    #     smokey: T.nilable(Integer)
    #   )
    #     .returns(T.nilable(Whiskey::ActiveRecord_Relation))
    # end
    # def search(user, contains: nil, taste: nil, color: nil, smokey: nil)
    #   whiskeys = Whiskey.where user_id: user.id
    #   whiskeys = whiskeys.where 'name LIKE :name', name: contains if contains
    #   whiskeys = whiskeys.where 'rate_taste >= :taste', taste: taste if taste
    #   whiskeys = whiskeys.where 'rate_color >= :color', color: color if color
    #   whiskeys = whiskeys.where 'rate_smokey >= :smokey', smokey: smokey if smokey
    #   whiskeys
    # end
  end
end
