module CSS
  class Comparer
    def compare(selector_1, selector_2)
      selector_point_1 = points_from_selectors(selector_1.split(' '))
      selector_point_2 = points_from_selectors(selector_2.split(' '))
      return selector_1 if selector_point_1 > selector_point_2
      selector_2
    end

    private

    def points_from_selectors(selectors)
      points = 0
      selectors.each do |selector|
        points += points_of_selector(selector)
      end
      points
    end

    def points_of_selector(selector)
      beginning = selector.chars.first
      return 100 if beginning == '#'
      return 10 if beginning == '.'
      1
    end
  end
end
