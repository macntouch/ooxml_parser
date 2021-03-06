# Class for hold ThemeColors list
module OoxmlParser
  class ThemeColors
    class << self
      # @return [Hash] list of colors
      attr_accessor :list

      def parse_color_theme(color_theme_node)
        themes_array = ThemeColors.list.to_a
        # TODO: if no swap performed - incorrect color parsing. But don't know why it needed
        themes_array[0], themes_array[1] = themes_array[1], themes_array[0]
        themes_array[2], themes_array[3] = themes_array[3], themes_array[2]
        hls = HSLColor.rgb_to_hsl(themes_array[color_theme_node.attribute('theme').value.to_i][1])
        tint = 0
        unless color_theme_node.attribute('tint').nil?
          tint = color_theme_node.attribute('tint').value.to_f
        end
        hls.calculate_rgb_with_tint(tint)
      end
    end
  end
end
