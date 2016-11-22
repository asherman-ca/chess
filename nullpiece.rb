require 'singleton'

class NullPiece
  include Singleton

  def initialize
    @name = " "
  end

  def to_s
    " "
  end
end
