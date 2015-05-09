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
      selectors = of_wordchain(selectors, '.')
      selectors = of_wordchain(selectors, '#')
      points = 0
      selectors.each do |selector|
        points += points_of_selector(selector)
      end
      points
    end

    def of_wordchain(selectors, splitter)
      result = []
      selectors.each do |word|
        classes = word.split(splitter)
        first_word = classes.shift
        result << first_word unless first_word.empty?
        result << classes.map {|c| "#{splitter}#{c}"}
      end
      result.flatten
    end

    def points_of_selector(selector)
      beginning = selector.chars.first
      return 100 if beginning == '#'
      return 10 if beginning == '.'
      return 0 if beginning == '*'
      1
    end
  end
end
