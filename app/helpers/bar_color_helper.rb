module BarColorHelper
  def bar_color
    @colors ||= %w(A B C D).cycle
    @colors.next
  end
end
