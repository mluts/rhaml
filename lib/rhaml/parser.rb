
# line 1 "lib/rhaml/parser.rl"
require 'rhaml/document'

module RHaml
  class Parser
    Error = Class.new(RHaml::Error)

    def initialize(options = {})
      @options = options
    end

    def call(text)
      cs = 0
      data = text
      p = 0
      pe = text.length
      top = 0
      stack = []

      document = Document.new(@options)

      
# line 25 "lib/rhaml/parser.rb"
class << self
	attr_accessor :_rhaml_parser_actions
	private :_rhaml_parser_actions, :_rhaml_parser_actions=
end
self._rhaml_parser_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4, 1, 5, 1, 6, 1, 
	7, 1, 8, 1, 9, 1, 10, 1, 
	11, 1, 13, 1, 15, 1, 17, 1, 
	18, 1, 19, 2, 12, 13, 2, 13, 
	17, 2, 14, 15, 2, 15, 17, 2, 
	16, 17, 2, 17, 13, 2, 17, 15, 
	2, 17, 16, 2, 17, 18, 3, 12, 
	13, 17, 3, 14, 15, 17, 3, 17, 
	12, 13, 3, 17, 14, 15
]

class << self
	attr_accessor :_rhaml_parser_key_offsets
	private :_rhaml_parser_key_offsets, :_rhaml_parser_key_offsets=
end
self._rhaml_parser_key_offsets = [
	0, 0, 6, 7, 8, 12, 21, 30, 
	31, 32, 33, 39, 45, 51, 57, 63, 
	69, 80, 84, 94, 96, 100, 109, 120, 
	124, 134, 136, 138, 144, 155, 168, 174, 
	185, 188, 194, 196, 198, 209, 222, 228, 
	239, 250, 258, 261, 268, 280, 294, 301, 
	312, 324, 333, 344, 352, 361, 367, 369, 
	375, 386, 399, 405, 416, 419, 422, 429, 
	441, 455, 462, 473, 485, 494, 505, 513, 
	515, 517, 523, 534, 547, 553, 564, 567, 
	570, 577, 589, 603, 610, 621, 633, 642, 
	653, 661, 667, 671, 675, 676, 687, 701, 
	715, 729, 740, 742, 745, 747, 747, 750, 
	752, 755
]

class << self
	attr_accessor :_rhaml_parser_trans_keys
	private :_rhaml_parser_trans_keys, :_rhaml_parser_trans_keys=
end
self._rhaml_parser_trans_keys = [
	9, 32, 33, 35, 37, 46, 33, 33, 
	10, 32, 9, 13, 9, 10, 32, 33, 
	35, 37, 46, 11, 13, 9, 10, 32, 
	33, 35, 37, 46, 11, 13, 33, 33, 
	10, 48, 57, 65, 90, 97, 122, 48, 
	57, 65, 90, 97, 122, 48, 57, 65, 
	90, 97, 122, 48, 57, 65, 90, 97, 
	122, 48, 57, 65, 90, 97, 122, 48, 
	57, 65, 90, 97, 122, 32, 45, 61, 
	9, 13, 48, 57, 65, 90, 97, 122, 
	32, 61, 9, 13, 32, 34, 39, 95, 
	9, 13, 65, 90, 97, 122, 34, 92, 
	32, 41, 9, 13, 32, 9, 13, 48, 
	57, 65, 90, 97, 122, 32, 45, 61, 
	9, 13, 48, 57, 65, 90, 97, 122, 
	32, 61, 9, 13, 32, 34, 39, 95, 
	9, 13, 65, 90, 97, 122, 34, 92, 
	34, 92, 32, 34, 41, 92, 9, 13, 
	32, 34, 92, 9, 13, 48, 57, 65, 
	90, 97, 122, 32, 34, 45, 61, 92, 
	9, 13, 48, 57, 65, 90, 97, 122, 
	32, 34, 61, 92, 9, 13, 32, 34, 
	39, 92, 95, 9, 13, 65, 90, 97, 
	122, 34, 39, 92, 32, 39, 41, 92, 
	9, 13, 39, 92, 39, 92, 32, 39, 
	92, 9, 13, 48, 57, 65, 90, 97, 
	122, 32, 39, 45, 61, 92, 9, 13, 
	48, 57, 65, 90, 97, 122, 32, 39, 
	61, 92, 9, 13, 32, 34, 39, 92, 
	95, 9, 13, 65, 90, 97, 122, 32, 
	39, 41, 92, 95, 9, 13, 65, 90, 
	97, 122, 39, 92, 48, 57, 65, 90, 
	97, 122, 34, 39, 92, 32, 34, 39, 
	41, 92, 9, 13, 32, 34, 39, 92, 
	9, 13, 48, 57, 65, 90, 97, 122, 
	32, 34, 39, 45, 61, 92, 9, 13, 
	48, 57, 65, 90, 97, 122, 32, 34, 
	39, 61, 92, 9, 13, 32, 34, 39, 
	92, 95, 9, 13, 65, 90, 97, 122, 
	32, 34, 39, 41, 92, 95, 9, 13, 
	65, 90, 97, 122, 34, 39, 92, 48, 
	57, 65, 90, 97, 122, 32, 34, 41, 
	92, 95, 9, 13, 65, 90, 97, 122, 
	34, 92, 48, 57, 65, 90, 97, 122, 
	32, 41, 95, 9, 13, 65, 90, 97, 
	122, 48, 57, 65, 90, 97, 122, 34, 
	92, 32, 34, 41, 92, 9, 13, 32, 
	34, 92, 9, 13, 48, 57, 65, 90, 
	97, 122, 32, 34, 45, 61, 92, 9, 
	13, 48, 57, 65, 90, 97, 122, 32, 
	34, 61, 92, 9, 13, 32, 34, 39, 
	92, 95, 9, 13, 65, 90, 97, 122, 
	34, 39, 92, 34, 39, 92, 32, 34, 
	39, 41, 92, 9, 13, 32, 34, 39, 
	92, 9, 13, 48, 57, 65, 90, 97, 
	122, 32, 34, 39, 45, 61, 92, 9, 
	13, 48, 57, 65, 90, 97, 122, 32, 
	34, 39, 61, 92, 9, 13, 32, 34, 
	39, 92, 95, 9, 13, 65, 90, 97, 
	122, 32, 34, 39, 41, 92, 95, 9, 
	13, 65, 90, 97, 122, 34, 39, 92, 
	48, 57, 65, 90, 97, 122, 32, 34, 
	41, 92, 95, 9, 13, 65, 90, 97, 
	122, 34, 92, 48, 57, 65, 90, 97, 
	122, 39, 92, 39, 92, 32, 39, 41, 
	92, 9, 13, 32, 39, 92, 9, 13, 
	48, 57, 65, 90, 97, 122, 32, 39, 
	45, 61, 92, 9, 13, 48, 57, 65, 
	90, 97, 122, 32, 39, 61, 92, 9, 
	13, 32, 34, 39, 92, 95, 9, 13, 
	65, 90, 97, 122, 34, 39, 92, 34, 
	39, 92, 32, 34, 39, 41, 92, 9, 
	13, 32, 34, 39, 92, 9, 13, 48, 
	57, 65, 90, 97, 122, 32, 34, 39, 
	45, 61, 92, 9, 13, 48, 57, 65, 
	90, 97, 122, 32, 34, 39, 61, 92, 
	9, 13, 32, 34, 39, 92, 95, 9, 
	13, 65, 90, 97, 122, 32, 34, 39, 
	41, 92, 95, 9, 13, 65, 90, 97, 
	122, 34, 39, 92, 48, 57, 65, 90, 
	97, 122, 32, 39, 41, 92, 95, 9, 
	13, 65, 90, 97, 122, 39, 92, 48, 
	57, 65, 90, 97, 122, 48, 57, 65, 
	90, 97, 122, 10, 32, 9, 13, 10, 
	32, 9, 13, 10, 10, 32, 45, 9, 
	13, 48, 57, 65, 90, 97, 122, 10, 
	32, 35, 40, 45, 46, 9, 13, 48, 
	57, 65, 90, 97, 122, 10, 32, 35, 
	40, 45, 46, 9, 13, 48, 57, 65, 
	90, 97, 122, 10, 32, 35, 40, 45, 
	46, 9, 13, 48, 57, 65, 90, 97, 
	122, 10, 32, 45, 9, 13, 48, 57, 
	65, 90, 97, 122, 39, 92, 34, 39, 
	92, 34, 92, 34, 39, 92, 34, 92, 
	34, 39, 92, 39, 92, 0
]

class << self
	attr_accessor :_rhaml_parser_single_lengths
	private :_rhaml_parser_single_lengths, :_rhaml_parser_single_lengths=
end
self._rhaml_parser_single_lengths = [
	0, 6, 1, 1, 2, 7, 7, 1, 
	1, 1, 0, 0, 0, 0, 0, 0, 
	3, 2, 4, 2, 2, 1, 3, 2, 
	4, 2, 2, 4, 3, 5, 4, 5, 
	3, 4, 2, 2, 3, 5, 4, 5, 
	5, 2, 3, 5, 4, 6, 5, 5, 
	6, 3, 5, 2, 3, 0, 2, 4, 
	3, 5, 4, 5, 3, 3, 5, 4, 
	6, 5, 5, 6, 3, 5, 2, 2, 
	2, 4, 3, 5, 4, 5, 3, 3, 
	5, 4, 6, 5, 5, 6, 3, 5, 
	2, 0, 2, 2, 1, 3, 6, 6, 
	6, 3, 2, 3, 2, 0, 3, 2, 
	3, 2
]

class << self
	attr_accessor :_rhaml_parser_range_lengths
	private :_rhaml_parser_range_lengths, :_rhaml_parser_range_lengths=
end
self._rhaml_parser_range_lengths = [
	0, 0, 0, 0, 1, 1, 1, 0, 
	0, 0, 3, 3, 3, 3, 3, 3, 
	4, 1, 3, 0, 1, 4, 4, 1, 
	3, 0, 0, 1, 4, 4, 1, 3, 
	0, 1, 0, 0, 4, 4, 1, 3, 
	3, 3, 0, 1, 4, 4, 1, 3, 
	3, 3, 3, 3, 3, 3, 0, 1, 
	4, 4, 1, 3, 0, 0, 1, 4, 
	4, 1, 3, 3, 3, 3, 3, 0, 
	0, 1, 4, 4, 1, 3, 0, 0, 
	1, 4, 4, 1, 3, 3, 3, 3, 
	3, 3, 1, 1, 0, 4, 4, 4, 
	4, 4, 0, 0, 0, 0, 0, 0, 
	0, 0
]

class << self
	attr_accessor :_rhaml_parser_index_offsets
	private :_rhaml_parser_index_offsets, :_rhaml_parser_index_offsets=
end
self._rhaml_parser_index_offsets = [
	0, 0, 7, 9, 11, 15, 24, 33, 
	35, 37, 39, 43, 47, 51, 55, 59, 
	63, 71, 75, 83, 86, 90, 96, 104, 
	108, 116, 119, 122, 128, 136, 146, 152, 
	161, 165, 171, 174, 177, 185, 195, 201, 
	210, 219, 225, 229, 236, 245, 256, 263, 
	272, 282, 289, 298, 304, 311, 315, 318, 
	324, 332, 342, 348, 357, 361, 365, 372, 
	381, 392, 399, 408, 418, 425, 434, 440, 
	443, 446, 452, 460, 470, 476, 485, 489, 
	493, 500, 509, 520, 527, 536, 546, 553, 
	562, 568, 572, 576, 580, 582, 590, 601, 
	612, 623, 631, 634, 638, 641, 642, 646, 
	649, 653
]

class << self
	attr_accessor :_rhaml_parser_trans_targs
	private :_rhaml_parser_trans_targs, :_rhaml_parser_trans_targs=
end
self._rhaml_parser_trans_targs = [
	1, 1, 2, 10, 11, 14, 0, 3, 
	0, 90, 0, 5, 4, 4, 0, 6, 
	5, 6, 7, 10, 11, 14, 5, 0, 
	6, 5, 6, 7, 10, 11, 14, 4, 
	0, 8, 0, 91, 0, 5, 92, 93, 
	93, 93, 0, 94, 94, 94, 0, 95, 
	95, 95, 0, 96, 96, 96, 0, 97, 
	97, 97, 0, 16, 16, 16, 0, 17, 
	89, 18, 17, 16, 16, 16, 0, 17, 
	18, 17, 0, 18, 19, 71, 52, 18, 
	52, 52, 0, 20, 54, 19, 21, 101, 
	21, 0, 21, 21, 22, 22, 22, 0, 
	23, 53, 24, 23, 22, 22, 22, 0, 
	23, 24, 23, 0, 24, 25, 34, 52, 
	24, 52, 52, 0, 20, 26, 25, 27, 
	26, 25, 28, 20, 100, 26, 28, 25, 
	28, 20, 26, 28, 29, 29, 29, 25, 
	30, 20, 51, 31, 26, 30, 29, 29, 
	29, 25, 30, 20, 31, 26, 30, 25, 
	31, 27, 32, 26, 50, 31, 50, 50, 
	25, 33, 27, 42, 32, 36, 20, 98, 
	35, 36, 34, 20, 35, 34, 33, 35, 
	34, 36, 20, 35, 36, 37, 37, 37, 
	34, 38, 20, 41, 39, 35, 38, 37, 
	37, 37, 34, 38, 20, 39, 35, 38, 
	34, 39, 32, 33, 35, 40, 39, 40, 
	40, 34, 36, 20, 98, 35, 40, 36, 
	40, 40, 34, 20, 35, 37, 37, 37, 
	34, 43, 43, 42, 32, 44, 33, 27, 
	99, 42, 44, 32, 44, 33, 27, 42, 
	44, 45, 45, 45, 32, 46, 33, 27, 
	49, 47, 42, 46, 45, 45, 45, 32, 
	46, 33, 27, 47, 42, 46, 32, 47, 
	43, 43, 42, 48, 47, 48, 48, 32, 
	44, 33, 27, 99, 42, 48, 44, 48, 
	48, 32, 33, 27, 42, 45, 45, 45, 
	32, 28, 20, 100, 26, 50, 28, 50, 
	50, 25, 20, 26, 29, 29, 29, 25, 
	21, 101, 52, 21, 52, 52, 0, 22, 
	22, 22, 0, 55, 54, 19, 56, 20, 
	103, 54, 56, 19, 56, 20, 54, 56, 
	57, 57, 57, 19, 58, 20, 70, 59, 
	54, 58, 57, 57, 57, 19, 58, 20, 
	59, 54, 58, 19, 59, 27, 60, 54, 
	69, 59, 69, 69, 19, 33, 55, 61, 
	60, 62, 62, 61, 60, 63, 33, 55, 
	102, 61, 63, 60, 63, 33, 55, 61, 
	63, 64, 64, 64, 60, 65, 33, 55, 
	68, 66, 61, 65, 64, 64, 64, 60, 
	65, 33, 55, 66, 61, 65, 60, 66, 
	43, 62, 61, 67, 66, 67, 67, 60, 
	63, 33, 55, 102, 61, 67, 63, 67, 
	67, 60, 33, 55, 61, 64, 64, 64, 
	60, 56, 20, 103, 54, 69, 56, 69, 
	69, 19, 20, 54, 57, 57, 57, 19, 
	20, 72, 71, 73, 72, 71, 74, 20, 
	105, 72, 74, 71, 74, 20, 72, 74, 
	75, 75, 75, 71, 76, 20, 88, 77, 
	72, 76, 75, 75, 75, 71, 76, 20, 
	77, 72, 76, 71, 77, 78, 33, 72, 
	87, 77, 87, 87, 71, 73, 27, 79, 
	78, 80, 80, 79, 78, 81, 73, 27, 
	104, 79, 81, 78, 81, 73, 27, 79, 
	81, 82, 82, 82, 78, 83, 73, 27, 
	86, 84, 79, 83, 82, 82, 82, 78, 
	83, 73, 27, 84, 79, 83, 78, 84, 
	80, 43, 79, 85, 84, 85, 85, 78, 
	81, 73, 27, 104, 79, 85, 81, 85, 
	85, 78, 73, 27, 79, 82, 82, 82, 
	78, 74, 20, 105, 72, 87, 74, 87, 
	87, 71, 20, 72, 75, 75, 75, 71, 
	16, 16, 16, 0, 5, 4, 4, 0, 
	5, 9, 9, 0, 5, 92, 5, 4, 
	10, 4, 93, 93, 93, 0, 5, 4, 
	12, 90, 11, 13, 4, 94, 94, 94, 
	0, 5, 4, 12, 90, 12, 13, 4, 
	95, 95, 95, 0, 5, 4, 12, 90, 
	13, 13, 4, 96, 96, 96, 0, 5, 
	4, 14, 4, 97, 97, 97, 0, 20, 
	35, 34, 33, 27, 42, 32, 20, 26, 
	25, 0, 33, 55, 61, 60, 20, 54, 
	19, 73, 27, 79, 78, 20, 72, 71, 
	0
]

class << self
	attr_accessor :_rhaml_parser_trans_actions
	private :_rhaml_parser_trans_actions, :_rhaml_parser_trans_actions=
end
self._rhaml_parser_trans_actions = [
	1, 3, 9, 15, 5, 15, 0, 0, 
	0, 0, 0, 13, 0, 0, 0, 1, 
	13, 3, 9, 15, 5, 15, 0, 0, 
	1, 13, 3, 9, 15, 5, 15, 0, 
	0, 0, 0, 0, 0, 13, 11, 17, 
	17, 17, 0, 7, 7, 7, 0, 17, 
	17, 17, 0, 19, 19, 19, 0, 19, 
	19, 19, 0, 35, 35, 35, 0, 0, 
	25, 0, 0, 25, 25, 25, 0, 0, 
	0, 0, 0, 0, 47, 47, 41, 0, 
	41, 41, 0, 29, 29, 29, 0, 31, 
	0, 0, 0, 0, 35, 35, 35, 0, 
	0, 25, 0, 0, 25, 25, 25, 0, 
	0, 0, 0, 0, 0, 47, 47, 41, 
	0, 41, 41, 0, 29, 29, 29, 29, 
	29, 29, 29, 29, 59, 29, 29, 29, 
	29, 29, 29, 29, 62, 62, 62, 29, 
	29, 29, 38, 29, 29, 29, 38, 38, 
	38, 29, 29, 29, 29, 29, 29, 29, 
	29, 47, 47, 29, 66, 29, 66, 66, 
	29, 29, 29, 29, 29, 29, 29, 59, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 62, 62, 62, 
	29, 29, 29, 38, 29, 29, 29, 38, 
	38, 38, 29, 29, 29, 29, 29, 29, 
	29, 29, 47, 47, 29, 66, 29, 66, 
	66, 29, 29, 29, 59, 29, 44, 29, 
	44, 44, 29, 29, 29, 38, 38, 38, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	59, 29, 29, 29, 29, 29, 29, 29, 
	29, 62, 62, 62, 29, 29, 29, 29, 
	38, 29, 29, 29, 38, 38, 38, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	47, 47, 29, 66, 29, 66, 66, 29, 
	29, 29, 29, 59, 29, 44, 29, 44, 
	44, 29, 29, 29, 29, 38, 38, 38, 
	29, 29, 29, 59, 29, 44, 29, 44, 
	44, 29, 29, 29, 38, 38, 38, 29, 
	0, 31, 27, 0, 27, 27, 0, 25, 
	25, 25, 0, 29, 29, 29, 29, 29, 
	59, 29, 29, 29, 29, 29, 29, 29, 
	70, 70, 70, 29, 29, 29, 50, 29, 
	29, 29, 50, 50, 50, 29, 29, 29, 
	29, 29, 29, 29, 29, 56, 56, 29, 
	74, 29, 74, 74, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	59, 29, 29, 29, 29, 29, 29, 29, 
	29, 70, 70, 70, 29, 29, 29, 29, 
	50, 29, 29, 29, 50, 50, 50, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	56, 56, 29, 74, 29, 74, 74, 29, 
	29, 29, 29, 59, 29, 53, 29, 53, 
	53, 29, 29, 29, 29, 50, 50, 50, 
	29, 29, 29, 59, 29, 53, 29, 53, 
	53, 29, 29, 29, 50, 50, 50, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	59, 29, 29, 29, 29, 29, 29, 29, 
	70, 70, 70, 29, 29, 29, 50, 29, 
	29, 29, 50, 50, 50, 29, 29, 29, 
	29, 29, 29, 29, 29, 56, 56, 29, 
	74, 29, 74, 74, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	59, 29, 29, 29, 29, 29, 29, 29, 
	29, 70, 70, 70, 29, 29, 29, 29, 
	50, 29, 29, 29, 50, 50, 50, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	56, 56, 29, 74, 29, 74, 74, 29, 
	29, 29, 29, 59, 29, 53, 29, 53, 
	53, 29, 29, 29, 29, 50, 50, 50, 
	29, 29, 29, 59, 29, 53, 29, 53, 
	53, 29, 29, 29, 50, 50, 50, 29, 
	25, 25, 25, 0, 13, 0, 0, 0, 
	13, 0, 0, 0, 13, 11, 13, 0, 
	17, 0, 17, 17, 17, 0, 13, 0, 
	21, 33, 7, 23, 0, 7, 7, 7, 
	0, 13, 0, 21, 33, 17, 23, 0, 
	17, 17, 17, 0, 13, 0, 21, 33, 
	19, 23, 0, 19, 19, 19, 0, 13, 
	0, 19, 0, 19, 19, 19, 0, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	29, 0, 29, 29, 29, 29, 29, 29, 
	29, 29, 29, 29, 29, 29, 29, 29, 
	0
]

class << self
	attr_accessor :rhaml_parser_start
end
self.rhaml_parser_start = 1;
class << self
	attr_accessor :rhaml_parser_first_final
end
self.rhaml_parser_first_final = 90;
class << self
	attr_accessor :rhaml_parser_error
end
self.rhaml_parser_error = 0;

class << self
	attr_accessor :rhaml_parser_en_attributes
end
self.rhaml_parser_en_attributes = 15;
class << self
	attr_accessor :rhaml_parser_en_main
end
self.rhaml_parser_en_main = 1;


# line 432 "lib/rhaml/parser.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = rhaml_parser_start
	top = 0
end

# line 440 "lib/rhaml/parser.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = _rhaml_parser_key_offsets[cs]
	_trans = _rhaml_parser_index_offsets[cs]
	_klen = _rhaml_parser_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _rhaml_parser_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _rhaml_parser_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _rhaml_parser_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _rhaml_parser_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _rhaml_parser_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	cs = _rhaml_parser_trans_targs[_trans]
	if _rhaml_parser_trans_actions[_trans] != 0
		_acts = _rhaml_parser_trans_actions[_trans]
		_nacts = _rhaml_parser_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _rhaml_parser_actions[_acts - 1]
when 0 then
# line 24 "lib/rhaml/parser.rl"
		begin
 document.indent_tab 		end
when 1 then
# line 25 "lib/rhaml/parser.rl"
		begin
 document.indent_space 		end
when 2 then
# line 26 "lib/rhaml/parser.rl"
		begin
 document.new_tag 		end
when 3 then
# line 27 "lib/rhaml/parser.rl"
		begin
 document.append_to_tag_name(data[p]) 		end
when 4 then
# line 28 "lib/rhaml/parser.rl"
		begin
 document.header 		end
when 5 then
# line 29 "lib/rhaml/parser.rl"
		begin
 document.header_char(data[p]) 		end
when 6 then
# line 30 "lib/rhaml/parser.rl"
		begin
 document.newline 		end
when 7 then
# line 31 "lib/rhaml/parser.rl"
		begin
 document.div 		end
when 8 then
# line 32 "lib/rhaml/parser.rl"
		begin
 document.id_char(data[p]) 		end
when 9 then
# line 33 "lib/rhaml/parser.rl"
		begin
 document.class_char(data[p]) 		end
when 10 then
# line 34 "lib/rhaml/parser.rl"
		begin
 document.start_id 		end
when 11 then
# line 35 "lib/rhaml/parser.rl"
		begin
 document.start_class 		end
when 12 then
# line 37 "lib/rhaml/parser.rl"
		begin

          #tag.attributes << Attribute.new
        		end
when 13 then
# line 41 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.name << data[fpc]
        		end
when 14 then
# line 45 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = Variable.new
        		end
when 15 then
# line 49 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value.name << data[fpc]
        		end
when 16 then
# line 53 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = ""
        		end
when 17 then
# line 57 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value << data[fpc]
        		end
when 18 then
# line 4 "lib/rhaml/parser_common.rl"
		begin
 	begin
		top -= 1
		cs = stack[top]
		_trigger_goto = true
		_goto_level = _again
		break
	end
 		end
when 19 then
# line 6 "lib/rhaml/parser_common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 15
		_trigger_goto = true
		_goto_level = _again
		break
	end
 		end
# line 627 "lib/rhaml/parser.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 65 "lib/rhaml/parser.rl"


      if cs == rhaml_parser_error
        raise self.class::Error.new(parse_error(text, p))
      end

      document.compile
    end

    def parse_error(text, p)
      coords = linecol(text, p)
      buf = "At #{coords.join(':')}:#{p}\n"

      lines = text.lines

      start, finish = coords[0]-3, coords[0]+3
      start = 0 if start < 0

      (start..finish).each do |line|
        l = lines[line]
        unless l.nil?
          buf << "#{line}: #{l.inspect}\n"
        end
      end
      buf
    end

    def linecol(text, p)
      line = 0
      col = 0
      text.chars.each_with_index do |c, i|
        if i == p
          col += 1
          break
        elsif c == "\n"
          line += 1
          col = 0
        else
          col += 1
        end
      end
      [line, col]
    end
  end
end
