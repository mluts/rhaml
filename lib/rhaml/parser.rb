
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
	11, 1, 12, 1, 14, 1, 15, 1, 
	17, 1, 19, 1, 21, 1, 22, 1, 
	23, 1, 24, 2, 0, 14, 2, 1, 
	14, 2, 2, 14, 2, 3, 14, 2, 
	4, 14, 2, 5, 14, 2, 7, 14, 
	2, 8, 14, 2, 9, 14, 2, 10, 
	14, 2, 11, 14, 2, 12, 14, 2, 
	13, 14, 2, 14, 0, 2, 14, 1, 
	2, 14, 2, 2, 14, 4, 2, 14, 
	6, 2, 14, 7, 2, 15, 14, 2, 
	16, 17, 2, 17, 21, 2, 18, 19, 
	2, 19, 21, 2, 20, 21, 2, 21, 
	17, 2, 21, 19, 2, 21, 20, 2, 
	23, 14, 2, 24, 14, 3, 6, 13, 
	14, 3, 13, 14, 6, 3, 16, 17, 
	21, 3, 18, 19, 21, 3, 21, 16, 
	17, 3, 21, 18, 19
]

class << self
	attr_accessor :_rhaml_parser_key_offsets
	private :_rhaml_parser_key_offsets, :_rhaml_parser_key_offsets=
end
self._rhaml_parser_key_offsets = [
	0, 0, 6, 7, 16, 22, 23, 24, 
	31, 32, 39, 46, 54, 62, 72, 86, 
	98, 112, 124, 134, 136, 140, 147, 149, 
	155, 164, 180, 194, 205, 208, 214, 216, 
	218, 227, 243, 257, 268, 281, 290, 293, 
	300, 310, 327, 342, 353, 367, 377, 390, 
	399, 410, 417, 427, 429, 431, 437, 446, 
	462, 476, 487, 490, 493, 500, 510, 527, 
	542, 553, 567, 577, 590, 599, 601, 603, 
	609, 618, 634, 648, 659, 662, 665, 672, 
	682, 699, 714, 725, 739, 749, 762, 771, 
	778, 786, 798, 802, 803, 813, 815, 817, 
	819, 821, 822, 831, 832, 841, 848, 850, 
	852, 856, 857, 865, 880, 881, 885, 893, 
	911, 919, 937, 946, 962, 968, 977, 991, 
	997, 999, 1001, 1005, 1006, 1021, 1022, 1026, 
	1044, 1062, 1078, 1084, 1098, 1106, 1114, 1123, 
	1123, 1123, 1125, 1127
]

class << self
	attr_accessor :_rhaml_parser_trans_keys
	private :_rhaml_parser_trans_keys, :_rhaml_parser_trans_keys=
end
self._rhaml_parser_trans_keys = [
	9, 32, 33, 35, 37, 46, 10, 9, 
	10, 32, 33, 35, 37, 46, 11, 13, 
	9, 32, 33, 35, 37, 46, 33, 33, 
	95, 48, 57, 65, 90, 97, 122, 10, 
	95, 48, 57, 65, 90, 97, 122, 95, 
	48, 57, 65, 90, 97, 122, 45, 95, 
	48, 58, 65, 90, 97, 122, 45, 95, 
	48, 58, 65, 90, 97, 122, 32, 95, 
	9, 13, 48, 57, 65, 90, 97, 122, 
	32, 41, 45, 58, 61, 95, 9, 13, 
	48, 57, 65, 90, 97, 122, 32, 41, 
	61, 95, 9, 13, 48, 57, 65, 90, 
	97, 122, 32, 41, 45, 58, 61, 95, 
	9, 13, 48, 57, 65, 90, 97, 122, 
	32, 41, 61, 95, 9, 13, 48, 57, 
	65, 90, 97, 122, 32, 34, 39, 95, 
	9, 13, 65, 90, 97, 122, 34, 92, 
	32, 41, 9, 13, 95, 48, 57, 65, 
	90, 97, 122, 34, 92, 32, 34, 41, 
	92, 9, 13, 34, 92, 95, 48, 57, 
	65, 90, 97, 122, 32, 34, 41, 45, 
	58, 61, 92, 95, 9, 13, 48, 57, 
	65, 90, 97, 122, 32, 34, 41, 61, 
	92, 95, 9, 13, 48, 57, 65, 90, 
	97, 122, 32, 34, 39, 92, 95, 9, 
	13, 65, 90, 97, 122, 34, 39, 92, 
	32, 39, 41, 92, 9, 13, 39, 92, 
	39, 92, 39, 92, 95, 48, 57, 65, 
	90, 97, 122, 32, 39, 41, 45, 58, 
	61, 92, 95, 9, 13, 48, 57, 65, 
	90, 97, 122, 32, 39, 41, 61, 92, 
	95, 9, 13, 48, 57, 65, 90, 97, 
	122, 32, 34, 39, 92, 95, 9, 13, 
	65, 90, 97, 122, 32, 39, 41, 92, 
	95, 9, 13, 48, 57, 65, 90, 97, 
	122, 39, 92, 95, 48, 57, 65, 90, 
	97, 122, 34, 39, 92, 32, 34, 39, 
	41, 92, 9, 13, 34, 39, 92, 95, 
	48, 57, 65, 90, 97, 122, 32, 34, 
	39, 41, 45, 58, 61, 92, 95, 9, 
	13, 48, 57, 65, 90, 97, 122, 32, 
	34, 39, 41, 61, 92, 95, 9, 13, 
	48, 57, 65, 90, 97, 122, 32, 34, 
	39, 92, 95, 9, 13, 65, 90, 97, 
	122, 32, 34, 39, 41, 92, 95, 9, 
	13, 48, 57, 65, 90, 97, 122, 34, 
	39, 92, 95, 48, 57, 65, 90, 97, 
	122, 32, 34, 41, 92, 95, 9, 13, 
	48, 57, 65, 90, 97, 122, 34, 92, 
	95, 48, 57, 65, 90, 97, 122, 32, 
	41, 95, 9, 13, 48, 57, 65, 90, 
	97, 122, 95, 48, 57, 65, 90, 97, 
	122, 32, 34, 39, 95, 9, 13, 65, 
	90, 97, 122, 34, 92, 34, 92, 32, 
	34, 41, 92, 9, 13, 34, 92, 95, 
	48, 57, 65, 90, 97, 122, 32, 34, 
	41, 45, 58, 61, 92, 95, 9, 13, 
	48, 57, 65, 90, 97, 122, 32, 34, 
	41, 61, 92, 95, 9, 13, 48, 57, 
	65, 90, 97, 122, 32, 34, 39, 92, 
	95, 9, 13, 65, 90, 97, 122, 34, 
	39, 92, 34, 39, 92, 32, 34, 39, 
	41, 92, 9, 13, 34, 39, 92, 95, 
	48, 57, 65, 90, 97, 122, 32, 34, 
	39, 41, 45, 58, 61, 92, 95, 9, 
	13, 48, 57, 65, 90, 97, 122, 32, 
	34, 39, 41, 61, 92, 95, 9, 13, 
	48, 57, 65, 90, 97, 122, 32, 34, 
	39, 92, 95, 9, 13, 65, 90, 97, 
	122, 32, 34, 39, 41, 92, 95, 9, 
	13, 48, 57, 65, 90, 97, 122, 34, 
	39, 92, 95, 48, 57, 65, 90, 97, 
	122, 32, 34, 41, 92, 95, 9, 13, 
	48, 57, 65, 90, 97, 122, 34, 92, 
	95, 48, 57, 65, 90, 97, 122, 39, 
	92, 39, 92, 32, 39, 41, 92, 9, 
	13, 39, 92, 95, 48, 57, 65, 90, 
	97, 122, 32, 39, 41, 45, 58, 61, 
	92, 95, 9, 13, 48, 57, 65, 90, 
	97, 122, 32, 39, 41, 61, 92, 95, 
	9, 13, 48, 57, 65, 90, 97, 122, 
	32, 34, 39, 92, 95, 9, 13, 65, 
	90, 97, 122, 34, 39, 92, 34, 39, 
	92, 32, 34, 39, 41, 92, 9, 13, 
	34, 39, 92, 95, 48, 57, 65, 90, 
	97, 122, 32, 34, 39, 41, 45, 58, 
	61, 92, 95, 9, 13, 48, 57, 65, 
	90, 97, 122, 32, 34, 39, 41, 61, 
	92, 95, 9, 13, 48, 57, 65, 90, 
	97, 122, 32, 34, 39, 92, 95, 9, 
	13, 65, 90, 97, 122, 32, 34, 39, 
	41, 92, 95, 9, 13, 48, 57, 65, 
	90, 97, 122, 34, 39, 92, 95, 48, 
	57, 65, 90, 97, 122, 32, 39, 41, 
	92, 95, 9, 13, 48, 57, 65, 90, 
	97, 122, 39, 92, 95, 48, 57, 65, 
	90, 97, 122, 95, 48, 57, 65, 90, 
	97, 122, 32, 95, 9, 13, 65, 90, 
	97, 122, 32, 58, 61, 95, 9, 13, 
	48, 57, 65, 90, 97, 122, 32, 61, 
	9, 13, 62, 32, 34, 39, 95, 9, 
	13, 65, 90, 97, 122, 34, 92, 34, 
	92, 39, 92, 39, 92, 10, 9, 10, 
	32, 33, 35, 37, 46, 11, 13, 10, 
	9, 10, 32, 33, 35, 37, 46, 11, 
	13, 9, 10, 32, 33, 35, 37, 46, 
	10, 33, 10, 33, 10, 32, 9, 13, 
	10, 10, 95, 48, 57, 65, 90, 97, 
	122, 10, 32, 40, 45, 58, 95, 123, 
	9, 13, 48, 57, 65, 90, 97, 122, 
	10, 10, 32, 9, 13, 10, 95, 48, 
	57, 65, 90, 97, 122, 10, 32, 35, 
	40, 45, 46, 47, 58, 95, 123, 9, 
	13, 48, 57, 65, 90, 97, 122, 10, 
	95, 48, 57, 65, 90, 97, 122, 10, 
	32, 35, 40, 45, 46, 47, 58, 95, 
	123, 9, 13, 48, 57, 65, 90, 97, 
	122, 10, 45, 95, 48, 58, 65, 90, 
	97, 122, 10, 32, 35, 40, 46, 47, 
	95, 123, 9, 13, 45, 58, 65, 90, 
	97, 122, 10, 32, 40, 123, 9, 13, 
	10, 45, 95, 48, 58, 65, 90, 97, 
	122, 10, 32, 40, 45, 95, 123, 9, 
	13, 48, 58, 65, 90, 97, 122, 9, 
	32, 33, 35, 37, 46, 10, 33, 10, 
	33, 10, 32, 9, 13, 10, 10, 32, 
	40, 45, 58, 95, 123, 9, 13, 48, 
	57, 65, 90, 97, 122, 10, 10, 32, 
	9, 13, 10, 32, 35, 40, 45, 46, 
	47, 58, 95, 123, 9, 13, 48, 57, 
	65, 90, 97, 122, 10, 32, 35, 40, 
	45, 46, 47, 58, 95, 123, 9, 13, 
	48, 57, 65, 90, 97, 122, 10, 32, 
	35, 40, 46, 47, 95, 123, 9, 13, 
	45, 58, 65, 90, 97, 122, 10, 32, 
	40, 123, 9, 13, 10, 32, 40, 45, 
	95, 123, 9, 13, 48, 58, 65, 90, 
	97, 122, 10, 95, 48, 57, 65, 90, 
	97, 122, 10, 95, 48, 57, 65, 90, 
	97, 122, 10, 45, 95, 48, 58, 65, 
	90, 97, 122, 34, 92, 39, 92, 95, 
	48, 57, 65, 90, 97, 122, 0
]

class << self
	attr_accessor :_rhaml_parser_single_lengths
	private :_rhaml_parser_single_lengths, :_rhaml_parser_single_lengths=
end
self._rhaml_parser_single_lengths = [
	0, 6, 1, 7, 6, 1, 1, 1, 
	1, 1, 1, 2, 2, 2, 6, 4, 
	6, 4, 4, 2, 2, 1, 2, 4, 
	3, 8, 6, 5, 3, 4, 2, 2, 
	3, 8, 6, 5, 5, 3, 3, 5, 
	4, 9, 7, 5, 6, 4, 5, 3, 
	3, 1, 4, 2, 2, 4, 3, 8, 
	6, 5, 3, 3, 5, 4, 9, 7, 
	5, 6, 4, 5, 3, 2, 2, 4, 
	3, 8, 6, 5, 3, 3, 5, 4, 
	9, 7, 5, 6, 4, 5, 3, 1, 
	2, 4, 2, 1, 4, 2, 2, 2, 
	2, 1, 7, 1, 7, 7, 2, 2, 
	2, 1, 2, 7, 1, 2, 2, 10, 
	2, 10, 3, 8, 4, 3, 6, 6, 
	2, 2, 2, 1, 7, 1, 2, 10, 
	10, 8, 4, 6, 2, 2, 3, 0, 
	0, 2, 2, 1
]

class << self
	attr_accessor :_rhaml_parser_range_lengths
	private :_rhaml_parser_range_lengths, :_rhaml_parser_range_lengths=
end
self._rhaml_parser_range_lengths = [
	0, 0, 0, 1, 0, 0, 0, 3, 
	0, 3, 3, 3, 3, 4, 4, 4, 
	4, 4, 3, 0, 1, 3, 0, 1, 
	3, 4, 4, 3, 0, 1, 0, 0, 
	3, 4, 4, 3, 4, 3, 0, 1, 
	3, 4, 4, 3, 4, 3, 4, 3, 
	4, 3, 3, 0, 0, 1, 3, 4, 
	4, 3, 0, 0, 1, 3, 4, 4, 
	3, 4, 3, 4, 3, 0, 0, 1, 
	3, 4, 4, 3, 0, 0, 1, 3, 
	4, 4, 3, 4, 3, 4, 3, 3, 
	3, 4, 1, 0, 3, 0, 0, 0, 
	0, 0, 1, 0, 1, 0, 0, 0, 
	1, 0, 3, 4, 0, 1, 3, 4, 
	3, 4, 3, 4, 1, 3, 4, 0, 
	0, 0, 1, 0, 4, 0, 1, 4, 
	4, 4, 1, 4, 3, 3, 3, 0, 
	0, 0, 0, 3
]

class << self
	attr_accessor :_rhaml_parser_index_offsets
	private :_rhaml_parser_index_offsets, :_rhaml_parser_index_offsets=
end
self._rhaml_parser_index_offsets = [
	0, 0, 7, 9, 18, 25, 27, 29, 
	34, 36, 41, 46, 52, 58, 65, 76, 
	85, 96, 105, 113, 116, 120, 125, 128, 
	134, 141, 154, 165, 174, 178, 184, 187, 
	190, 197, 210, 221, 230, 240, 247, 251, 
	258, 266, 280, 292, 301, 312, 320, 330, 
	337, 345, 350, 358, 361, 364, 370, 377, 
	390, 401, 410, 414, 418, 425, 433, 447, 
	459, 468, 479, 487, 497, 504, 507, 510, 
	516, 523, 536, 547, 556, 560, 564, 571, 
	579, 593, 605, 614, 625, 633, 643, 650, 
	655, 661, 670, 674, 676, 684, 687, 690, 
	693, 696, 698, 707, 709, 718, 726, 729, 
	732, 736, 738, 744, 756, 758, 762, 768, 
	783, 789, 804, 811, 824, 830, 837, 848, 
	855, 858, 861, 865, 867, 879, 881, 885, 
	900, 915, 928, 934, 945, 951, 957, 964, 
	965, 966, 969, 972
]

class << self
	attr_accessor :_rhaml_parser_indicies
	private :_rhaml_parser_indicies, :_rhaml_parser_indicies=
end
self._rhaml_parser_indicies = [
	1, 2, 3, 4, 5, 6, 0, 8, 
	7, 10, 11, 13, 3, 4, 5, 6, 
	12, 9, 10, 13, 3, 4, 5, 6, 
	9, 14, 8, 15, 8, 16, 16, 16, 
	16, 8, 8, 17, 18, 18, 18, 18, 
	8, 19, 19, 19, 19, 8, 20, 20, 
	20, 20, 20, 8, 21, 21, 21, 21, 
	21, 8, 22, 23, 22, 23, 23, 23, 
	8, 24, 25, 26, 26, 28, 27, 24, 
	27, 27, 27, 8, 24, 25, 28, 29, 
	24, 29, 29, 29, 8, 30, 25, 31, 
	31, 33, 32, 30, 32, 32, 32, 8, 
	30, 25, 33, 29, 30, 29, 29, 29, 
	8, 33, 34, 35, 36, 33, 36, 36, 
	8, 38, 39, 37, 40, 25, 40, 8, 
	29, 29, 29, 29, 8, 41, 39, 37, 
	42, 38, 25, 39, 42, 37, 38, 39, 
	43, 43, 43, 43, 37, 44, 38, 25, 
	45, 45, 47, 39, 46, 44, 46, 46, 
	46, 37, 44, 38, 25, 47, 39, 43, 
	44, 43, 43, 43, 37, 47, 48, 49, 
	39, 50, 47, 50, 50, 37, 52, 41, 
	53, 51, 55, 38, 25, 56, 55, 54, 
	38, 56, 54, 52, 56, 54, 38, 56, 
	57, 57, 57, 57, 54, 58, 38, 25, 
	59, 59, 61, 56, 60, 58, 60, 60, 
	60, 54, 58, 38, 25, 61, 56, 57, 
	58, 57, 57, 57, 54, 61, 49, 62, 
	56, 63, 61, 63, 63, 54, 55, 38, 
	25, 56, 64, 55, 64, 64, 64, 54, 
	38, 56, 60, 60, 60, 60, 54, 65, 
	65, 53, 51, 66, 52, 41, 25, 53, 
	66, 51, 52, 41, 53, 67, 67, 67, 
	67, 51, 68, 52, 41, 25, 69, 69, 
	71, 53, 70, 68, 70, 70, 70, 51, 
	68, 52, 41, 25, 71, 53, 67, 68, 
	67, 67, 67, 51, 71, 72, 72, 53, 
	73, 71, 73, 73, 51, 66, 52, 41, 
	25, 53, 74, 66, 74, 74, 74, 51, 
	52, 41, 53, 70, 70, 70, 70, 51, 
	42, 38, 25, 39, 75, 42, 75, 75, 
	75, 37, 38, 39, 46, 46, 46, 46, 
	37, 40, 25, 76, 40, 76, 76, 76, 
	8, 32, 32, 32, 32, 8, 28, 77, 
	78, 36, 28, 36, 36, 8, 38, 80, 
	79, 81, 80, 79, 82, 38, 25, 80, 
	82, 79, 38, 80, 83, 83, 83, 83, 
	79, 84, 38, 25, 85, 85, 87, 80, 
	86, 84, 86, 86, 86, 79, 84, 38, 
	25, 87, 80, 83, 84, 83, 83, 83, 
	79, 87, 88, 89, 80, 90, 87, 90, 
	90, 79, 52, 81, 92, 91, 93, 93, 
	92, 91, 94, 52, 81, 25, 92, 94, 
	91, 52, 81, 92, 95, 95, 95, 95, 
	91, 96, 52, 81, 25, 97, 97, 99, 
	92, 98, 96, 98, 98, 98, 91, 96, 
	52, 81, 25, 99, 92, 95, 96, 95, 
	95, 95, 91, 99, 100, 101, 92, 102, 
	99, 102, 102, 91, 94, 52, 81, 25, 
	92, 103, 94, 103, 103, 103, 91, 52, 
	81, 92, 98, 98, 98, 98, 91, 82, 
	38, 25, 80, 104, 82, 104, 104, 104, 
	79, 38, 80, 86, 86, 86, 86, 79, 
	38, 106, 105, 107, 106, 105, 108, 38, 
	25, 106, 108, 105, 38, 106, 109, 109, 
	109, 109, 105, 110, 38, 25, 111, 111, 
	113, 106, 112, 110, 112, 112, 112, 105, 
	110, 38, 25, 113, 106, 109, 110, 109, 
	109, 109, 105, 113, 114, 115, 106, 116, 
	113, 116, 116, 105, 107, 41, 118, 117, 
	119, 119, 118, 117, 120, 107, 41, 25, 
	118, 120, 117, 107, 41, 118, 121, 121, 
	121, 121, 117, 122, 107, 41, 25, 123, 
	123, 125, 118, 124, 122, 124, 124, 124, 
	117, 122, 107, 41, 25, 125, 118, 121, 
	122, 121, 121, 121, 117, 125, 126, 100, 
	118, 127, 125, 127, 127, 117, 120, 107, 
	41, 25, 118, 128, 120, 128, 128, 128, 
	117, 107, 41, 118, 124, 124, 124, 124, 
	117, 108, 38, 25, 106, 129, 108, 129, 
	129, 129, 105, 38, 106, 112, 112, 112, 
	112, 105, 27, 27, 27, 27, 8, 130, 
	131, 130, 131, 131, 8, 132, 134, 135, 
	133, 132, 133, 133, 133, 8, 132, 135, 
	132, 8, 134, 8, 134, 136, 137, 138, 
	134, 138, 138, 8, 140, 141, 139, 142, 
	141, 139, 140, 144, 143, 145, 144, 143, 
	147, 146, 148, 11, 149, 150, 151, 152, 
	153, 12, 9, 155, 154, 156, 11, 157, 
	158, 159, 160, 161, 12, 9, 156, 162, 
	157, 158, 159, 160, 161, 9, 155, 163, 
	154, 155, 164, 154, 155, 165, 165, 154, 
	155, 166, 155, 167, 167, 167, 167, 154, 
	155, 168, 169, 170, 170, 167, 171, 168, 
	167, 167, 167, 154, 155, 172, 155, 168, 
	168, 154, 155, 173, 173, 173, 173, 154, 
	155, 168, 174, 169, 175, 176, 177, 175, 
	173, 171, 168, 173, 173, 173, 154, 155, 
	178, 178, 178, 178, 154, 155, 168, 174, 
	169, 179, 176, 177, 179, 178, 171, 168, 
	178, 178, 178, 154, 155, 180, 180, 180, 
	180, 180, 154, 155, 168, 174, 169, 176, 
	177, 180, 171, 168, 180, 180, 180, 154, 
	155, 168, 169, 171, 168, 154, 155, 181, 
	181, 181, 181, 181, 154, 155, 168, 169, 
	181, 181, 171, 168, 181, 181, 181, 154, 
	148, 149, 150, 151, 152, 153, 9, 147, 
	182, 146, 147, 15, 146, 184, 183, 183, 
	8, 184, 7, 184, 185, 186, 187, 187, 
	16, 188, 185, 16, 16, 16, 8, 184, 
	17, 184, 185, 185, 8, 184, 185, 189, 
	186, 190, 191, 192, 190, 18, 188, 185, 
	18, 18, 18, 8, 184, 185, 189, 186, 
	193, 191, 192, 193, 19, 188, 185, 19, 
	19, 19, 8, 184, 185, 189, 186, 191, 
	192, 20, 188, 185, 20, 20, 20, 8, 
	184, 185, 186, 188, 185, 8, 184, 185, 
	186, 21, 21, 188, 185, 21, 21, 21, 
	8, 147, 16, 16, 16, 16, 146, 147, 
	18, 18, 18, 18, 146, 147, 21, 21, 
	21, 21, 21, 146, 8, 8, 140, 141, 
	139, 140, 144, 143, 194, 194, 194, 194, 
	8, 0
]

class << self
	attr_accessor :_rhaml_parser_trans_targs
	private :_rhaml_parser_trans_targs, :_rhaml_parser_trans_targs=
end
self._rhaml_parser_trans_targs = [
	97, 1, 1, 5, 7, 9, 12, 123, 
	0, 99, 4, 100, 100, 4, 6, 122, 
	124, 125, 127, 128, 129, 131, 13, 14, 
	15, 135, 87, 14, 50, 16, 17, 49, 
	16, 18, 19, 30, 48, 19, 20, 22, 
	21, 23, 24, 25, 26, 47, 25, 27, 
	23, 28, 46, 28, 29, 38, 30, 32, 
	31, 33, 34, 37, 33, 35, 29, 36, 
	36, 39, 40, 41, 42, 45, 41, 43, 
	39, 44, 44, 46, 48, 51, 69, 51, 
	52, 53, 54, 55, 56, 68, 55, 57, 
	23, 58, 67, 58, 59, 60, 61, 62, 
	63, 66, 62, 64, 39, 60, 65, 65, 
	67, 69, 70, 71, 72, 73, 74, 86, 
	73, 75, 76, 29, 85, 76, 77, 78, 
	79, 80, 81, 84, 80, 82, 78, 83, 
	83, 85, 88, 89, 90, 89, 92, 91, 
	93, 95, 139, 93, 136, 94, 137, 95, 
	96, 138, 97, 98, 119, 119, 120, 132, 
	133, 134, 99, 100, 101, 101, 102, 106, 
	110, 117, 100, 103, 104, 105, 105, 107, 
	108, 109, 106, 109, 108, 111, 112, 110, 
	114, 116, 113, 112, 115, 118, 121, 2, 
	3, 8, 126, 7, 126, 10, 9, 11, 
	130, 10, 139
]

class << self
	attr_accessor :_rhaml_parser_trans_actions
	private :_rhaml_parser_trans_actions, :_rhaml_parser_trans_actions=
end
self._rhaml_parser_trans_actions = [
	79, 1, 3, 9, 15, 5, 15, 11, 
	0, 79, 1, 133, 79, 3, 0, 0, 
	17, 29, 7, 17, 19, 19, 0, 103, 
	0, 37, 31, 31, 0, 103, 0, 31, 
	31, 0, 115, 115, 109, 35, 35, 35, 
	0, 35, 35, 141, 35, 106, 106, 35, 
	115, 115, 145, 35, 35, 35, 35, 35, 
	35, 141, 35, 106, 106, 35, 115, 145, 
	112, 35, 35, 141, 35, 106, 106, 35, 
	115, 145, 112, 112, 33, 115, 115, 35, 
	35, 35, 35, 149, 35, 118, 118, 35, 
	124, 124, 153, 35, 35, 35, 35, 149, 
	35, 118, 118, 35, 124, 124, 153, 121, 
	121, 35, 35, 35, 35, 149, 35, 118, 
	118, 35, 124, 124, 153, 35, 35, 35, 
	35, 149, 35, 118, 118, 35, 124, 153, 
	121, 121, 0, 103, 0, 31, 0, 0, 
	115, 115, 109, 35, 35, 35, 35, 35, 
	35, 35, 27, 94, 82, 85, 91, 97, 
	88, 97, 27, 94, 43, 46, 55, 61, 
	49, 61, 137, 27, 27, 27, 58, 64, 
	27, 127, 64, 130, 100, 52, 70, 52, 
	73, 76, 64, 64, 67, 67, 27, 0, 
	13, 0, 39, 17, 41, 21, 7, 23, 
	25, 17, 33
]

class << self
	attr_accessor :rhaml_parser_start
end
self.rhaml_parser_start = 1;
class << self
	attr_accessor :rhaml_parser_first_final
end
self.rhaml_parser_first_final = 97;
class << self
	attr_accessor :rhaml_parser_error
end
self.rhaml_parser_error = 0;

class << self
	attr_accessor :rhaml_parser_en_html_attributes
end
self.rhaml_parser_en_html_attributes = 13;
class << self
	attr_accessor :rhaml_parser_en_ruby_attributes
end
self.rhaml_parser_en_ruby_attributes = 88;
class << self
	attr_accessor :rhaml_parser_en_main
end
self.rhaml_parser_en_main = 1;


# line 523 "lib/rhaml/parser.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = rhaml_parser_start
	top = 0
end

# line 531 "lib/rhaml/parser.rb"
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
	_trans = _rhaml_parser_indicies[_trans]
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
# line 37 "lib/rhaml/parser.rl"
		begin
 document.new_text 		end
when 14 then
# line 38 "lib/rhaml/parser.rl"
		begin
 document.text_char(data[p]) 		end
when 15 then
# line 39 "lib/rhaml/parser.rl"
		begin
 document.inline_text_char(data[p]) 		end
when 16 then
# line 40 "lib/rhaml/parser.rl"
		begin
 document.new_attribute 		end
when 17 then
# line 41 "lib/rhaml/parser.rl"
		begin
 document.attribute_name(data[p]) 		end
when 18 then
# line 43 "lib/rhaml/parser.rl"
		begin
 document.new_attribute_var 		end
when 19 then
# line 45 "lib/rhaml/parser.rl"
		begin
 document.attribute_var_name(data[p]) 		end
when 20 then
# line 47 "lib/rhaml/parser.rl"
		begin
 document.new_attribute_str 		end
when 21 then
# line 48 "lib/rhaml/parser.rl"
		begin
 document.attribute_str_char(data[p])		end
when 22 then
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
when 23 then
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
when 24 then
# line 8 "lib/rhaml/parser_common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 88
		_trigger_goto = true
		_goto_level = _again
		break
	end
 		end
# line 735 "lib/rhaml/parser.rb"
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

# line 54 "lib/rhaml/parser.rl"


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
