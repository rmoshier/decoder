# Create a class that can decode the cryptic string below using the following table:
#
# 'Hello%20%22World%22%20%2D%201%20is%20%3E0%2E'
# # => 'Hello "World" - 1 is > 0.'

# Symbol	Code
# " " (space)	%20
# """ (double quote)	%22
# "%" (percent)	%25
# "-" (hyphen)	%2D
# "." (period)	%2E
# "<" (less than)	%3C
# ">" (greater than)	%3E
# "\" (backslash)	%5C
# "_" (underscore)

# after refactor:

class Decoder
  attr_accessor :string, :legend

  def initialize(string)
    @string = string
    @legend = {
      "%20" => " ",
      "%22" => """",
      "%25" => "%",
      "%2D" => "-",
      "%2E" => ".",
      "%3C" => "<",
      "%3E" => ">",
      "%5C" => "\\",
      "%5F" => "_"
    }
  end

  def decode
    # @string.each { |string| puts string }
    @legend.each { |key, value| @string.gsub!(/#{key}/, value) }
    @string
  end
end

Decoder.new("Hello%20%22World%22%20%2D%201%20is%20%3E0%2E").decode


# before refactor:

#   class Decoder
#     attr_accessor :string
#
#     def initialize(string)
#       @string = string
#       analyze
#     end
#
#     def analyze
#       string.gsub!(/%20/, " ")
#       string.gsub!(/%22/, "\"")
#       string.gsub!(/%25/, "%")
#       string.gsub!(/%2D/, "-")
#       string.gsub!(/%2E/, ".")
#       string.gsub!(/%3C/, "<")
#       string.gsub!(/%3E/, ">")
#       string.gsub!(/%5C/, "\\")
#       string.gsub!(/%5F/, "_")
#     end
#   end
#
# d = Decoder.new("Hello%20%22World%22%20%2D%201%20is%20%3E0%2E")
# d.analyze
# puts d.string
