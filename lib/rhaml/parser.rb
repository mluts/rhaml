
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
	11, 1, 12, 1, 14, 1, 16, 1, 
	18, 1, 19, 1, 20, 2, 13, 14, 
	2, 14, 18, 2, 15, 16, 2, 16, 
	18, 2, 17, 18, 2, 18, 14, 2, 
	18, 16, 2, 18, 17, 2, 18, 19, 
	3, 13, 14, 18, 3, 15, 16, 18, 
	3, 18, 13, 14, 3, 18, 15, 16
]

class << self
	attr_accessor :_rhaml_parser_key_offsets
	private :_rhaml_parser_key_offsets, :_rhaml_parser_key_offsets=
end
self._rhaml_parser_key_offsets = [
	0, 0, 6, 7, 8, 9, 18, 27, 
	31, 38, 45, 52, 59, 66, 73, 86, 
	90, 100, 102, 106, 116, 129, 133, 143, 
	145, 147, 153, 165, 180, 186, 197, 200, 
	206, 208, 210, 222, 237, 243, 254, 265, 
	274, 277, 284, 297, 313, 320, 331, 343, 
	353, 364, 373, 382, 389, 391, 397, 409, 
	424, 430, 441, 444, 447, 454, 467, 483, 
	490, 501, 513, 523, 534, 543, 545, 547, 
	553, 565, 580, 586, 597, 600, 603, 610, 
	623, 639, 646, 657, 669, 679, 690, 699, 
	706, 710, 711, 724, 741, 758, 762, 779, 
	784, 797, 799, 802, 804, 804, 807, 809, 
	812
]

class << self
	attr_accessor :_rhaml_parser_trans_keys
	private :_rhaml_parser_trans_keys, :_rhaml_parser_trans_keys=
end
self._rhaml_parser_trans_keys = [
	9, 32, 33, 35, 37, 46, 33, 33, 
	10, 9, 10, 32, 33, 35, 37, 46, 
	11, 13, 9, 10, 32, 33, 35, 37, 
	46, 11, 13, 10, 32, 9, 13, 95, 
	48, 57, 65, 90, 97, 122, 95, 48, 
	57, 65, 90, 97, 122, 95, 48, 57, 
	65, 90, 97, 122, 95, 48, 57, 65, 
	90, 97, 122, 95, 48, 57, 65, 90, 
	97, 122, 95, 48, 57, 65, 90, 97, 
	122, 32, 45, 58, 61, 95, 9, 13, 
	48, 57, 65, 90, 97, 122, 32, 61, 
	9, 13, 32, 34, 39, 95, 9, 13, 
	65, 90, 97, 122, 34, 92, 32, 41, 
	9, 13, 32, 95, 9, 13, 48, 57, 
	65, 90, 97, 122, 32, 45, 58, 61, 
	95, 9, 13, 48, 57, 65, 90, 97, 
	122, 32, 61, 9, 13, 32, 34, 39, 
	95, 9, 13, 65, 90, 97, 122, 34, 
	92, 34, 92, 32, 34, 41, 92, 9, 
	13, 32, 34, 92, 95, 9, 13, 48, 
	57, 65, 90, 97, 122, 32, 34, 45, 
	58, 61, 92, 95, 9, 13, 48, 57, 
	65, 90, 97, 122, 32, 34, 61, 92, 
	9, 13, 32, 34, 39, 92, 95, 9, 
	13, 65, 90, 97, 122, 34, 39, 92, 
	32, 39, 41, 92, 9, 13, 39, 92, 
	39, 92, 32, 39, 92, 95, 9, 13, 
	48, 57, 65, 90, 97, 122, 32, 39, 
	45, 58, 61, 92, 95, 9, 13, 48, 
	57, 65, 90, 97, 122, 32, 39, 61, 
	92, 9, 13, 32, 34, 39, 92, 95, 
	9, 13, 65, 90, 97, 122, 32, 39, 
	41, 92, 95, 9, 13, 65, 90, 97, 
	122, 39, 92, 95, 48, 57, 65, 90, 
	97, 122, 34, 39, 92, 32, 34, 39, 
	41, 92, 9, 13, 32, 34, 39, 92, 
	95, 9, 13, 48, 57, 65, 90, 97, 
	122, 32, 34, 39, 45, 58, 61, 92, 
	95, 9, 13, 48, 57, 65, 90, 97, 
	122, 32, 34, 39, 61, 92, 9, 13, 
	32, 34, 39, 92, 95, 9, 13, 65, 
	90, 97, 122, 32, 34, 39, 41, 92, 
	95, 9, 13, 65, 90, 97, 122, 34, 
	39, 92, 95, 48, 57, 65, 90, 97, 
	122, 32, 34, 41, 92, 95, 9, 13, 
	65, 90, 97, 122, 34, 92, 95, 48, 
	57, 65, 90, 97, 122, 32, 41, 95, 
	9, 13, 65, 90, 97, 122, 95, 48, 
	57, 65, 90, 97, 122, 34, 92, 32, 
	34, 41, 92, 9, 13, 32, 34, 92, 
	95, 9, 13, 48, 57, 65, 90, 97, 
	122, 32, 34, 45, 58, 61, 92, 95, 
	9, 13, 48, 57, 65, 90, 97, 122, 
	32, 34, 61, 92, 9, 13, 32, 34, 
	39, 92, 95, 9, 13, 65, 90, 97, 
	122, 34, 39, 92, 34, 39, 92, 32, 
	34, 39, 41, 92, 9, 13, 32, 34, 
	39, 92, 95, 9, 13, 48, 57, 65, 
	90, 97, 122, 32, 34, 39, 45, 58, 
	61, 92, 95, 9, 13, 48, 57, 65, 
	90, 97, 122, 32, 34, 39, 61, 92, 
	9, 13, 32, 34, 39, 92, 95, 9, 
	13, 65, 90, 97, 122, 32, 34, 39, 
	41, 92, 95, 9, 13, 65, 90, 97, 
	122, 34, 39, 92, 95, 48, 57, 65, 
	90, 97, 122, 32, 34, 41, 92, 95, 
	9, 13, 65, 90, 97, 122, 34, 92, 
	95, 48, 57, 65, 90, 97, 122, 39, 
	92, 39, 92, 32, 39, 41, 92, 9, 
	13, 32, 39, 92, 95, 9, 13, 48, 
	57, 65, 90, 97, 122, 32, 39, 45, 
	58, 61, 92, 95, 9, 13, 48, 57, 
	65, 90, 97, 122, 32, 39, 61, 92, 
	9, 13, 32, 34, 39, 92, 95, 9, 
	13, 65, 90, 97, 122, 34, 39, 92, 
	34, 39, 92, 32, 34, 39, 41, 92, 
	9, 13, 32, 34, 39, 92, 95, 9, 
	13, 48, 57, 65, 90, 97, 122, 32, 
	34, 39, 45, 58, 61, 92, 95, 9, 
	13, 48, 57, 65, 90, 97, 122, 32, 
	34, 39, 61, 92, 9, 13, 32, 34, 
	39, 92, 95, 9, 13, 65, 90, 97, 
	122, 32, 34, 39, 41, 92, 95, 9, 
	13, 65, 90, 97, 122, 34, 39, 92, 
	95, 48, 57, 65, 90, 97, 122, 32, 
	39, 41, 92, 95, 9, 13, 65, 90, 
	97, 122, 39, 92, 95, 48, 57, 65, 
	90, 97, 122, 95, 48, 57, 65, 90, 
	97, 122, 10, 32, 9, 13, 10, 10, 
	32, 45, 58, 95, 9, 13, 48, 57, 
	65, 90, 97, 122, 10, 32, 35, 40, 
	45, 46, 47, 58, 95, 9, 13, 48, 
	57, 65, 90, 97, 122, 10, 32, 35, 
	40, 45, 46, 47, 58, 95, 9, 13, 
	48, 57, 65, 90, 97, 122, 10, 32, 
	9, 13, 10, 32, 35, 40, 45, 46, 
	47, 58, 95, 9, 13, 48, 57, 65, 
	90, 97, 122, 10, 32, 40, 9, 13, 
	10, 32, 45, 58, 95, 9, 13, 48, 
	57, 65, 90, 97, 122, 39, 92, 34, 
	39, 92, 34, 92, 34, 39, 92, 34, 
	92, 34, 39, 92, 39, 92, 0
]

class << self
	attr_accessor :_rhaml_parser_single_lengths
	private :_rhaml_parser_single_lengths, :_rhaml_parser_single_lengths=
end
self._rhaml_parser_single_lengths = [
	0, 6, 1, 1, 1, 7, 7, 2, 
	1, 1, 1, 1, 1, 1, 5, 2, 
	4, 2, 2, 2, 5, 2, 4, 2, 
	2, 4, 4, 7, 4, 5, 3, 4, 
	2, 2, 4, 7, 4, 5, 5, 3, 
	3, 5, 5, 8, 5, 5, 6, 4, 
	5, 3, 3, 1, 2, 4, 4, 7, 
	4, 5, 3, 3, 5, 5, 8, 5, 
	5, 6, 4, 5, 3, 2, 2, 4, 
	4, 7, 4, 5, 3, 3, 5, 5, 
	8, 5, 5, 6, 4, 5, 3, 1, 
	2, 1, 5, 9, 9, 2, 9, 3, 
	5, 2, 3, 2, 0, 3, 2, 3, 
	2
]

class << self
	attr_accessor :_rhaml_parser_range_lengths
	private :_rhaml_parser_range_lengths, :_rhaml_parser_range_lengths=
end
self._rhaml_parser_range_lengths = [
	0, 0, 0, 0, 0, 1, 1, 1, 
	3, 3, 3, 3, 3, 3, 4, 1, 
	3, 0, 1, 4, 4, 1, 3, 0, 
	0, 1, 4, 4, 1, 3, 0, 1, 
	0, 0, 4, 4, 1, 3, 3, 3, 
	0, 1, 4, 4, 1, 3, 3, 3, 
	3, 3, 3, 3, 0, 1, 4, 4, 
	1, 3, 0, 0, 1, 4, 4, 1, 
	3, 3, 3, 3, 3, 0, 0, 1, 
	4, 4, 1, 3, 0, 0, 1, 4, 
	4, 1, 3, 3, 3, 3, 3, 3, 
	1, 0, 4, 4, 4, 1, 4, 1, 
	4, 0, 0, 0, 0, 0, 0, 0, 
	0
]

class << self
	attr_accessor :_rhaml_parser_index_offsets
	private :_rhaml_parser_index_offsets, :_rhaml_parser_index_offsets=
end
self._rhaml_parser_index_offsets = [
	0, 0, 7, 9, 11, 13, 22, 31, 
	35, 40, 45, 50, 55, 60, 65, 75, 
	79, 87, 90, 94, 101, 111, 115, 123, 
	126, 129, 135, 144, 156, 162, 171, 175, 
	181, 184, 187, 196, 208, 214, 223, 232, 
	239, 243, 250, 260, 273, 280, 289, 299, 
	307, 316, 323, 330, 335, 338, 344, 353, 
	365, 371, 380, 384, 388, 395, 405, 418, 
	425, 434, 444, 452, 461, 468, 471, 474, 
	480, 489, 501, 507, 516, 520, 524, 531, 
	541, 554, 561, 570, 580, 588, 597, 604, 
	609, 613, 615, 625, 639, 653, 657, 671, 
	676, 686, 689, 693, 696, 697, 701, 704, 
	708
]

class << self
	attr_accessor :_rhaml_parser_trans_targs
	private :_rhaml_parser_trans_targs, :_rhaml_parser_trans_targs=
end
self._rhaml_parser_trans_targs = [
	1, 1, 2, 8, 9, 12, 0, 3, 
	0, 88, 0, 5, 89, 6, 5, 6, 
	2, 8, 9, 12, 5, 0, 6, 5, 
	6, 2, 8, 9, 12, 7, 0, 5, 
	7, 7, 0, 90, 90, 90, 90, 0, 
	91, 91, 91, 91, 0, 92, 92, 92, 
	92, 0, 94, 94, 94, 94, 0, 96, 
	96, 96, 96, 0, 14, 14, 14, 14, 
	0, 15, 87, 87, 16, 14, 15, 14, 
	14, 14, 0, 15, 16, 15, 0, 16, 
	17, 69, 50, 16, 50, 50, 0, 18, 
	52, 17, 19, 100, 19, 0, 19, 20, 
	19, 20, 20, 20, 0, 21, 51, 51, 
	22, 20, 21, 20, 20, 20, 0, 21, 
	22, 21, 0, 22, 23, 32, 50, 22, 
	50, 50, 0, 18, 24, 23, 25, 24, 
	23, 26, 18, 99, 24, 26, 23, 26, 
	18, 24, 27, 26, 27, 27, 27, 23, 
	28, 18, 49, 49, 29, 24, 27, 28, 
	27, 27, 27, 23, 28, 18, 29, 24, 
	28, 23, 29, 25, 30, 24, 48, 29, 
	48, 48, 23, 31, 25, 40, 30, 34, 
	18, 97, 33, 34, 32, 18, 33, 32, 
	31, 33, 32, 34, 18, 33, 35, 34, 
	35, 35, 35, 32, 36, 18, 39, 39, 
	37, 33, 35, 36, 35, 35, 35, 32, 
	36, 18, 37, 33, 36, 32, 37, 30, 
	31, 33, 38, 37, 38, 38, 32, 34, 
	18, 97, 33, 38, 34, 38, 38, 32, 
	18, 33, 35, 35, 35, 35, 32, 41, 
	41, 40, 30, 42, 31, 25, 98, 40, 
	42, 30, 42, 31, 25, 40, 43, 42, 
	43, 43, 43, 30, 44, 31, 25, 47, 
	47, 45, 40, 43, 44, 43, 43, 43, 
	30, 44, 31, 25, 45, 40, 44, 30, 
	45, 41, 41, 40, 46, 45, 46, 46, 
	30, 42, 31, 25, 98, 40, 46, 42, 
	46, 46, 30, 31, 25, 40, 43, 43, 
	43, 43, 30, 26, 18, 99, 24, 48, 
	26, 48, 48, 23, 18, 24, 27, 27, 
	27, 27, 23, 19, 100, 50, 19, 50, 
	50, 0, 20, 20, 20, 20, 0, 53, 
	52, 17, 54, 18, 102, 52, 54, 17, 
	54, 18, 52, 55, 54, 55, 55, 55, 
	17, 56, 18, 68, 68, 57, 52, 55, 
	56, 55, 55, 55, 17, 56, 18, 57, 
	52, 56, 17, 57, 25, 58, 52, 67, 
	57, 67, 67, 17, 31, 53, 59, 58, 
	60, 60, 59, 58, 61, 31, 53, 101, 
	59, 61, 58, 61, 31, 53, 59, 62, 
	61, 62, 62, 62, 58, 63, 31, 53, 
	66, 66, 64, 59, 62, 63, 62, 62, 
	62, 58, 63, 31, 53, 64, 59, 63, 
	58, 64, 41, 60, 59, 65, 64, 65, 
	65, 58, 61, 31, 53, 101, 59, 65, 
	61, 65, 65, 58, 31, 53, 59, 62, 
	62, 62, 62, 58, 54, 18, 102, 52, 
	67, 54, 67, 67, 17, 18, 52, 55, 
	55, 55, 55, 17, 18, 70, 69, 71, 
	70, 69, 72, 18, 104, 70, 72, 69, 
	72, 18, 70, 73, 72, 73, 73, 73, 
	69, 74, 18, 86, 86, 75, 70, 73, 
	74, 73, 73, 73, 69, 74, 18, 75, 
	70, 74, 69, 75, 76, 31, 70, 85, 
	75, 85, 85, 69, 71, 25, 77, 76, 
	78, 78, 77, 76, 79, 71, 25, 103, 
	77, 79, 76, 79, 71, 25, 77, 80, 
	79, 80, 80, 80, 76, 81, 71, 25, 
	84, 84, 82, 77, 80, 81, 80, 80, 
	80, 76, 81, 71, 25, 82, 77, 81, 
	76, 82, 78, 41, 77, 83, 82, 83, 
	83, 76, 79, 71, 25, 103, 77, 83, 
	79, 83, 83, 76, 71, 25, 77, 80, 
	80, 80, 80, 76, 72, 18, 104, 70, 
	85, 72, 85, 85, 69, 18, 70, 73, 
	73, 73, 73, 69, 14, 14, 14, 14, 
	0, 5, 4, 4, 0, 5, 89, 5, 
	7, 8, 8, 90, 7, 90, 90, 90, 
	0, 5, 7, 10, 93, 9, 11, 95, 
	9, 91, 7, 91, 91, 91, 0, 5, 
	7, 10, 93, 10, 11, 95, 10, 92, 
	7, 92, 92, 92, 0, 5, 7, 7, 
	0, 5, 7, 10, 93, 11, 11, 95, 
	11, 94, 7, 94, 94, 94, 0, 5, 
	7, 93, 7, 0, 5, 7, 12, 12, 
	96, 7, 96, 96, 96, 0, 18, 33, 
	32, 31, 25, 40, 30, 18, 24, 23, 
	0, 31, 53, 59, 58, 18, 52, 17, 
	71, 25, 77, 76, 18, 70, 69, 0
]

class << self
	attr_accessor :_rhaml_parser_trans_actions
	private :_rhaml_parser_trans_actions, :_rhaml_parser_trans_actions=
end
self._rhaml_parser_trans_actions = [
	1, 3, 9, 15, 5, 15, 0, 0, 
	0, 0, 0, 13, 11, 1, 13, 3, 
	9, 15, 5, 15, 0, 0, 1, 13, 
	3, 9, 15, 5, 15, 0, 0, 13, 
	0, 0, 0, 17, 17, 17, 17, 0, 
	7, 7, 7, 7, 0, 17, 17, 17, 
	17, 0, 19, 19, 19, 19, 0, 19, 
	19, 19, 19, 0, 37, 37, 37, 37, 
	0, 0, 27, 27, 0, 27, 0, 27, 
	27, 27, 0, 0, 0, 0, 0, 0, 
	49, 49, 43, 0, 43, 43, 0, 31, 
	31, 31, 0, 33, 0, 0, 0, 37, 
	0, 37, 37, 37, 0, 0, 27, 27, 
	0, 27, 0, 27, 27, 27, 0, 0, 
	0, 0, 0, 0, 49, 49, 43, 0, 
	43, 43, 0, 31, 31, 31, 31, 31, 
	31, 31, 31, 61, 31, 31, 31, 31, 
	31, 31, 64, 31, 64, 64, 64, 31, 
	31, 31, 40, 40, 31, 31, 40, 31, 
	40, 40, 40, 31, 31, 31, 31, 31, 
	31, 31, 31, 49, 49, 31, 68, 31, 
	68, 68, 31, 31, 31, 31, 31, 31, 
	31, 61, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 64, 31, 
	64, 64, 64, 31, 31, 31, 40, 40, 
	31, 31, 40, 31, 40, 40, 40, 31, 
	31, 31, 31, 31, 31, 31, 31, 49, 
	49, 31, 68, 31, 68, 68, 31, 31, 
	31, 61, 31, 46, 31, 46, 46, 31, 
	31, 31, 40, 40, 40, 40, 31, 31, 
	31, 31, 31, 31, 31, 31, 61, 31, 
	31, 31, 31, 31, 31, 31, 64, 31, 
	64, 64, 64, 31, 31, 31, 31, 40, 
	40, 31, 31, 40, 31, 40, 40, 40, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	31, 49, 49, 31, 68, 31, 68, 68, 
	31, 31, 31, 31, 61, 31, 46, 31, 
	46, 46, 31, 31, 31, 31, 40, 40, 
	40, 40, 31, 31, 31, 61, 31, 46, 
	31, 46, 46, 31, 31, 31, 40, 40, 
	40, 40, 31, 0, 33, 29, 0, 29, 
	29, 0, 27, 27, 27, 27, 0, 31, 
	31, 31, 31, 31, 61, 31, 31, 31, 
	31, 31, 31, 72, 31, 72, 72, 72, 
	31, 31, 31, 52, 52, 31, 31, 52, 
	31, 52, 52, 52, 31, 31, 31, 31, 
	31, 31, 31, 31, 58, 58, 31, 76, 
	31, 76, 76, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 61, 
	31, 31, 31, 31, 31, 31, 31, 72, 
	31, 72, 72, 72, 31, 31, 31, 31, 
	52, 52, 31, 31, 52, 31, 52, 52, 
	52, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 58, 58, 31, 76, 31, 76, 
	76, 31, 31, 31, 31, 61, 31, 55, 
	31, 55, 55, 31, 31, 31, 31, 52, 
	52, 52, 52, 31, 31, 31, 61, 31, 
	55, 31, 55, 55, 31, 31, 31, 52, 
	52, 52, 52, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 61, 31, 31, 31, 
	31, 31, 31, 72, 31, 72, 72, 72, 
	31, 31, 31, 52, 52, 31, 31, 52, 
	31, 52, 52, 52, 31, 31, 31, 31, 
	31, 31, 31, 31, 58, 58, 31, 76, 
	31, 76, 76, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 61, 
	31, 31, 31, 31, 31, 31, 31, 72, 
	31, 72, 72, 72, 31, 31, 31, 31, 
	52, 52, 31, 31, 52, 31, 52, 52, 
	52, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 58, 58, 31, 76, 31, 76, 
	76, 31, 31, 31, 31, 61, 31, 55, 
	31, 55, 55, 31, 31, 31, 31, 52, 
	52, 52, 52, 31, 31, 31, 61, 31, 
	55, 31, 55, 55, 31, 31, 31, 52, 
	52, 52, 52, 31, 27, 27, 27, 27, 
	0, 13, 0, 0, 0, 13, 11, 13, 
	0, 17, 17, 17, 0, 17, 17, 17, 
	0, 13, 0, 21, 35, 7, 23, 25, 
	7, 7, 0, 7, 7, 7, 0, 13, 
	0, 21, 35, 17, 23, 25, 17, 17, 
	0, 17, 17, 17, 0, 13, 0, 0, 
	0, 13, 0, 21, 35, 19, 23, 25, 
	19, 19, 0, 19, 19, 19, 0, 13, 
	0, 35, 0, 0, 13, 0, 19, 19, 
	19, 0, 19, 19, 19, 0, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 31, 
	0, 31, 31, 31, 31, 31, 31, 31, 
	31, 31, 31, 31, 31, 31, 31, 0
]

class << self
	attr_accessor :rhaml_parser_start
end
self.rhaml_parser_start = 1;
class << self
	attr_accessor :rhaml_parser_first_final
end
self.rhaml_parser_first_final = 88;
class << self
	attr_accessor :rhaml_parser_error
end
self.rhaml_parser_error = 0;

class << self
	attr_accessor :rhaml_parser_en_attributes
end
self.rhaml_parser_en_attributes = 13;
class << self
	attr_accessor :rhaml_parser_en_main
end
self.rhaml_parser_en_main = 1;


# line 451 "lib/rhaml/parser.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = rhaml_parser_start
	top = 0
end

# line 459 "lib/rhaml/parser.rb"
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
# line 36 "lib/rhaml/parser.rl"
		begin
 document.auto_close 		end
when 13 then
# line 38 "lib/rhaml/parser.rl"
		begin

          #tag.attributes << Attribute.new
        		end
when 14 then
# line 42 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.name << data[fpc]
        		end
when 15 then
# line 46 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = Variable.new
        		end
when 16 then
# line 50 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value.name << data[fpc]
        		end
when 17 then
# line 54 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = ""
        		end
when 18 then
# line 58 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value << data[fpc]
        		end
when 19 then
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
when 20 then
# line 6 "lib/rhaml/parser_common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 13
		_trigger_goto = true
		_goto_level = _again
		break
	end
 		end
# line 650 "lib/rhaml/parser.rb"
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

# line 66 "lib/rhaml/parser.rl"


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
