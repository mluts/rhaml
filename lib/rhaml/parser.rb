
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
	23, 2, 0, 14, 2, 1, 14, 2, 
	2, 14, 2, 3, 14, 2, 4, 14, 
	2, 5, 14, 2, 7, 14, 2, 8, 
	14, 2, 9, 14, 2, 10, 14, 2, 
	11, 14, 2, 12, 14, 2, 13, 14, 
	2, 14, 0, 2, 14, 1, 2, 14, 
	2, 2, 14, 4, 2, 14, 6, 2, 
	14, 7, 2, 15, 14, 2, 16, 17, 
	2, 17, 21, 2, 18, 19, 2, 19, 
	21, 2, 20, 21, 2, 21, 17, 2, 
	21, 19, 2, 21, 20, 2, 21, 22, 
	2, 23, 14, 3, 6, 13, 14, 3, 
	13, 14, 6, 3, 16, 17, 21, 3, 
	18, 19, 21, 3, 21, 16, 17, 3, 
	21, 18, 19
]

class << self
	attr_accessor :_rhaml_parser_key_offsets
	private :_rhaml_parser_key_offsets, :_rhaml_parser_key_offsets=
end
self._rhaml_parser_key_offsets = [
	0, 0, 6, 7, 16, 22, 23, 24, 
	31, 32, 39, 46, 54, 62, 69, 82, 
	86, 96, 98, 102, 112, 125, 129, 139, 
	141, 143, 149, 161, 176, 182, 193, 196, 
	202, 204, 206, 218, 233, 239, 250, 261, 
	270, 273, 280, 293, 309, 316, 327, 339, 
	349, 360, 369, 378, 385, 387, 393, 405, 
	420, 426, 437, 440, 443, 450, 463, 479, 
	486, 497, 509, 519, 530, 539, 541, 543, 
	549, 561, 576, 582, 593, 596, 599, 606, 
	619, 635, 642, 653, 665, 675, 686, 695, 
	702, 703, 712, 713, 722, 729, 731, 733, 
	737, 738, 746, 759, 760, 768, 785, 793, 
	810, 814, 823, 838, 843, 852, 864, 870, 
	872, 874, 878, 879, 892, 893, 910, 927, 
	931, 946, 951, 963, 971, 979, 988, 990, 
	993, 995, 995, 998, 1000, 1003
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
	48, 58, 65, 90, 97, 122, 95, 48, 
	57, 65, 90, 97, 122, 32, 45, 58, 
	61, 95, 9, 13, 48, 57, 65, 90, 
	97, 122, 32, 61, 9, 13, 32, 34, 
	39, 95, 9, 13, 65, 90, 97, 122, 
	34, 92, 32, 41, 9, 13, 32, 95, 
	9, 13, 48, 57, 65, 90, 97, 122, 
	32, 45, 58, 61, 95, 9, 13, 48, 
	57, 65, 90, 97, 122, 32, 61, 9, 
	13, 32, 34, 39, 95, 9, 13, 65, 
	90, 97, 122, 34, 92, 34, 92, 32, 
	34, 41, 92, 9, 13, 32, 34, 92, 
	95, 9, 13, 48, 57, 65, 90, 97, 
	122, 32, 34, 45, 58, 61, 92, 95, 
	9, 13, 48, 57, 65, 90, 97, 122, 
	32, 34, 61, 92, 9, 13, 32, 34, 
	39, 92, 95, 9, 13, 65, 90, 97, 
	122, 34, 39, 92, 32, 39, 41, 92, 
	9, 13, 39, 92, 39, 92, 32, 39, 
	92, 95, 9, 13, 48, 57, 65, 90, 
	97, 122, 32, 39, 45, 58, 61, 92, 
	95, 9, 13, 48, 57, 65, 90, 97, 
	122, 32, 39, 61, 92, 9, 13, 32, 
	34, 39, 92, 95, 9, 13, 65, 90, 
	97, 122, 32, 39, 41, 92, 95, 9, 
	13, 65, 90, 97, 122, 39, 92, 95, 
	48, 57, 65, 90, 97, 122, 34, 39, 
	92, 32, 34, 39, 41, 92, 9, 13, 
	32, 34, 39, 92, 95, 9, 13, 48, 
	57, 65, 90, 97, 122, 32, 34, 39, 
	45, 58, 61, 92, 95, 9, 13, 48, 
	57, 65, 90, 97, 122, 32, 34, 39, 
	61, 92, 9, 13, 32, 34, 39, 92, 
	95, 9, 13, 65, 90, 97, 122, 32, 
	34, 39, 41, 92, 95, 9, 13, 65, 
	90, 97, 122, 34, 39, 92, 95, 48, 
	57, 65, 90, 97, 122, 32, 34, 41, 
	92, 95, 9, 13, 65, 90, 97, 122, 
	34, 92, 95, 48, 57, 65, 90, 97, 
	122, 32, 41, 95, 9, 13, 65, 90, 
	97, 122, 95, 48, 57, 65, 90, 97, 
	122, 34, 92, 32, 34, 41, 92, 9, 
	13, 32, 34, 92, 95, 9, 13, 48, 
	57, 65, 90, 97, 122, 32, 34, 45, 
	58, 61, 92, 95, 9, 13, 48, 57, 
	65, 90, 97, 122, 32, 34, 61, 92, 
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
	34, 41, 92, 95, 9, 13, 65, 90, 
	97, 122, 34, 92, 95, 48, 57, 65, 
	90, 97, 122, 39, 92, 39, 92, 32, 
	39, 41, 92, 9, 13, 32, 39, 92, 
	95, 9, 13, 48, 57, 65, 90, 97, 
	122, 32, 39, 45, 58, 61, 92, 95, 
	9, 13, 48, 57, 65, 90, 97, 122, 
	32, 39, 61, 92, 9, 13, 32, 34, 
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
	90, 97, 122, 32, 39, 41, 92, 95, 
	9, 13, 65, 90, 97, 122, 39, 92, 
	95, 48, 57, 65, 90, 97, 122, 95, 
	48, 57, 65, 90, 97, 122, 10, 9, 
	10, 32, 33, 35, 37, 46, 11, 13, 
	10, 9, 10, 32, 33, 35, 37, 46, 
	11, 13, 9, 10, 32, 33, 35, 37, 
	46, 10, 33, 10, 33, 10, 32, 9, 
	13, 10, 10, 95, 48, 57, 65, 90, 
	97, 122, 10, 32, 45, 58, 95, 9, 
	13, 48, 57, 65, 90, 97, 122, 10, 
	10, 95, 48, 57, 65, 90, 97, 122, 
	10, 32, 35, 40, 45, 46, 47, 58, 
	95, 9, 13, 48, 57, 65, 90, 97, 
	122, 10, 95, 48, 57, 65, 90, 97, 
	122, 10, 32, 35, 40, 45, 46, 47, 
	58, 95, 9, 13, 48, 57, 65, 90, 
	97, 122, 10, 32, 9, 13, 10, 45, 
	95, 48, 58, 65, 90, 97, 122, 10, 
	32, 35, 40, 46, 47, 95, 9, 13, 
	45, 58, 65, 90, 97, 122, 10, 32, 
	40, 9, 13, 10, 45, 95, 48, 58, 
	65, 90, 97, 122, 10, 32, 45, 95, 
	9, 13, 48, 58, 65, 90, 97, 122, 
	9, 32, 33, 35, 37, 46, 10, 33, 
	10, 33, 10, 32, 9, 13, 10, 10, 
	32, 45, 58, 95, 9, 13, 48, 57, 
	65, 90, 97, 122, 10, 10, 32, 35, 
	40, 45, 46, 47, 58, 95, 9, 13, 
	48, 57, 65, 90, 97, 122, 10, 32, 
	35, 40, 45, 46, 47, 58, 95, 9, 
	13, 48, 57, 65, 90, 97, 122, 10, 
	32, 9, 13, 10, 32, 35, 40, 46, 
	47, 95, 9, 13, 45, 58, 65, 90, 
	97, 122, 10, 32, 40, 9, 13, 10, 
	32, 45, 95, 9, 13, 48, 58, 65, 
	90, 97, 122, 10, 95, 48, 57, 65, 
	90, 97, 122, 10, 95, 48, 57, 65, 
	90, 97, 122, 10, 45, 95, 48, 58, 
	65, 90, 97, 122, 39, 92, 34, 39, 
	92, 34, 92, 34, 39, 92, 34, 92, 
	34, 39, 92, 39, 92, 0
]

class << self
	attr_accessor :_rhaml_parser_single_lengths
	private :_rhaml_parser_single_lengths, :_rhaml_parser_single_lengths=
end
self._rhaml_parser_single_lengths = [
	0, 6, 1, 7, 6, 1, 1, 1, 
	1, 1, 1, 2, 2, 1, 5, 2, 
	4, 2, 2, 2, 5, 2, 4, 2, 
	2, 4, 4, 7, 4, 5, 3, 4, 
	2, 2, 4, 7, 4, 5, 5, 3, 
	3, 5, 5, 8, 5, 5, 6, 4, 
	5, 3, 3, 1, 2, 4, 4, 7, 
	4, 5, 3, 3, 5, 5, 8, 5, 
	5, 6, 4, 5, 3, 2, 2, 4, 
	4, 7, 4, 5, 3, 3, 5, 5, 
	8, 5, 5, 6, 4, 5, 3, 1, 
	1, 7, 1, 7, 7, 2, 2, 2, 
	1, 2, 5, 1, 2, 9, 2, 9, 
	2, 3, 7, 3, 3, 4, 6, 2, 
	2, 2, 1, 5, 1, 9, 9, 2, 
	7, 3, 4, 2, 2, 3, 2, 3, 
	2, 0, 3, 2, 3, 2
]

class << self
	attr_accessor :_rhaml_parser_range_lengths
	private :_rhaml_parser_range_lengths, :_rhaml_parser_range_lengths=
end
self._rhaml_parser_range_lengths = [
	0, 0, 0, 1, 0, 0, 0, 3, 
	0, 3, 3, 3, 3, 3, 4, 1, 
	3, 0, 1, 4, 4, 1, 3, 0, 
	0, 1, 4, 4, 1, 3, 0, 1, 
	0, 0, 4, 4, 1, 3, 3, 3, 
	0, 1, 4, 4, 1, 3, 3, 3, 
	3, 3, 3, 3, 0, 1, 4, 4, 
	1, 3, 0, 0, 1, 4, 4, 1, 
	3, 3, 3, 3, 3, 0, 0, 1, 
	4, 4, 1, 3, 0, 0, 1, 4, 
	4, 1, 3, 3, 3, 3, 3, 3, 
	0, 1, 0, 1, 0, 0, 0, 1, 
	0, 3, 4, 0, 3, 4, 3, 4, 
	1, 3, 4, 1, 3, 4, 0, 0, 
	0, 1, 0, 4, 0, 4, 4, 1, 
	4, 1, 4, 3, 3, 3, 0, 0, 
	0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_rhaml_parser_index_offsets
	private :_rhaml_parser_index_offsets, :_rhaml_parser_index_offsets=
end
self._rhaml_parser_index_offsets = [
	0, 0, 7, 9, 18, 25, 27, 29, 
	34, 36, 41, 46, 52, 58, 63, 73, 
	77, 85, 88, 92, 99, 109, 113, 121, 
	124, 127, 133, 142, 154, 160, 169, 173, 
	179, 182, 185, 194, 206, 212, 221, 230, 
	237, 241, 248, 258, 271, 278, 287, 297, 
	305, 314, 321, 328, 333, 336, 342, 351, 
	363, 369, 378, 382, 386, 393, 403, 416, 
	423, 432, 442, 450, 459, 466, 469, 472, 
	478, 487, 499, 505, 514, 518, 522, 529, 
	539, 552, 559, 568, 578, 586, 595, 602, 
	607, 609, 618, 620, 629, 637, 640, 643, 
	647, 649, 655, 665, 667, 673, 687, 693, 
	707, 711, 718, 730, 735, 742, 751, 758, 
	761, 764, 768, 770, 780, 782, 796, 810, 
	814, 826, 831, 840, 846, 852, 859, 862, 
	866, 869, 870, 874, 877, 881
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
	21, 8, 22, 22, 22, 22, 8, 23, 
	24, 24, 26, 25, 23, 25, 25, 25, 
	8, 23, 26, 23, 8, 26, 27, 28, 
	29, 26, 29, 29, 8, 31, 32, 30, 
	33, 34, 33, 8, 33, 35, 33, 35, 
	35, 35, 8, 36, 37, 37, 39, 38, 
	36, 38, 38, 38, 8, 36, 39, 36, 
	8, 39, 40, 41, 29, 39, 29, 29, 
	8, 31, 43, 42, 44, 43, 42, 45, 
	31, 46, 43, 45, 42, 45, 31, 43, 
	47, 45, 47, 47, 47, 42, 48, 31, 
	49, 49, 51, 43, 50, 48, 50, 50, 
	50, 42, 48, 31, 51, 43, 48, 42, 
	51, 52, 53, 43, 54, 51, 54, 54, 
	42, 56, 44, 57, 55, 59, 31, 60, 
	61, 59, 58, 31, 61, 58, 56, 61, 
	58, 59, 31, 61, 62, 59, 62, 62, 
	62, 58, 63, 31, 64, 64, 66, 61, 
	65, 63, 65, 65, 65, 58, 63, 31, 
	66, 61, 63, 58, 66, 53, 67, 61, 
	68, 66, 68, 68, 58, 59, 31, 60, 
	61, 69, 59, 69, 69, 58, 31, 61, 
	65, 65, 65, 65, 58, 70, 70, 57, 
	55, 71, 56, 44, 72, 57, 71, 55, 
	71, 56, 44, 57, 73, 71, 73, 73, 
	73, 55, 74, 56, 44, 75, 75, 77, 
	57, 76, 74, 76, 76, 76, 55, 74, 
	56, 44, 77, 57, 74, 55, 77, 78, 
	78, 57, 79, 77, 79, 79, 55, 71, 
	56, 44, 72, 57, 80, 71, 80, 80, 
	55, 56, 44, 57, 76, 76, 76, 76, 
	55, 45, 31, 46, 43, 81, 45, 81, 
	81, 42, 31, 43, 50, 50, 50, 50, 
	42, 33, 34, 82, 33, 82, 82, 8, 
	38, 38, 38, 38, 8, 83, 32, 30, 
	84, 31, 85, 32, 84, 30, 84, 31, 
	32, 86, 84, 86, 86, 86, 30, 87, 
	31, 88, 88, 90, 32, 89, 87, 89, 
	89, 89, 30, 87, 31, 90, 32, 87, 
	30, 90, 91, 92, 32, 93, 90, 93, 
	93, 30, 56, 83, 95, 94, 96, 96, 
	95, 94, 97, 56, 83, 98, 95, 97, 
	94, 97, 56, 83, 95, 99, 97, 99, 
	99, 99, 94, 100, 56, 83, 101, 101, 
	103, 95, 102, 100, 102, 102, 102, 94, 
	100, 56, 83, 103, 95, 100, 94, 103, 
	104, 105, 95, 106, 103, 106, 106, 94, 
	97, 56, 83, 98, 95, 107, 97, 107, 
	107, 94, 56, 83, 95, 102, 102, 102, 
	102, 94, 84, 31, 85, 32, 108, 84, 
	108, 108, 30, 31, 32, 89, 89, 89, 
	89, 30, 31, 110, 109, 111, 110, 109, 
	112, 31, 113, 110, 112, 109, 112, 31, 
	110, 114, 112, 114, 114, 114, 109, 115, 
	31, 116, 116, 118, 110, 117, 115, 117, 
	117, 117, 109, 115, 31, 118, 110, 115, 
	109, 118, 119, 120, 110, 121, 118, 121, 
	121, 109, 111, 44, 123, 122, 124, 124, 
	123, 122, 125, 111, 44, 126, 123, 125, 
	122, 125, 111, 44, 123, 127, 125, 127, 
	127, 127, 122, 128, 111, 44, 129, 129, 
	131, 123, 130, 128, 130, 130, 130, 122, 
	128, 111, 44, 131, 123, 128, 122, 131, 
	132, 104, 123, 133, 131, 133, 133, 122, 
	125, 111, 44, 126, 123, 134, 125, 134, 
	134, 122, 111, 44, 123, 130, 130, 130, 
	130, 122, 112, 31, 113, 110, 135, 112, 
	135, 135, 109, 31, 110, 117, 117, 117, 
	117, 109, 25, 25, 25, 25, 8, 137, 
	136, 138, 11, 139, 140, 141, 142, 143, 
	12, 9, 145, 144, 146, 11, 147, 148, 
	149, 150, 151, 12, 9, 146, 152, 147, 
	148, 149, 150, 151, 9, 145, 153, 144, 
	145, 154, 144, 145, 155, 155, 144, 145, 
	156, 145, 157, 157, 157, 157, 144, 145, 
	158, 159, 159, 157, 158, 157, 157, 157, 
	144, 145, 160, 145, 161, 161, 161, 161, 
	144, 145, 158, 162, 163, 164, 165, 166, 
	164, 161, 158, 161, 161, 161, 144, 145, 
	167, 167, 167, 167, 144, 145, 158, 162, 
	163, 168, 165, 166, 168, 167, 158, 167, 
	167, 167, 144, 145, 158, 158, 144, 145, 
	169, 169, 169, 169, 169, 144, 145, 158, 
	162, 163, 165, 166, 169, 158, 169, 169, 
	169, 144, 145, 158, 163, 158, 144, 145, 
	170, 170, 170, 170, 170, 144, 145, 158, 
	170, 170, 158, 170, 170, 170, 144, 138, 
	139, 140, 141, 142, 143, 9, 137, 171, 
	136, 137, 15, 136, 173, 172, 172, 8, 
	173, 7, 173, 174, 175, 175, 16, 174, 
	16, 16, 16, 8, 173, 17, 173, 174, 
	176, 177, 178, 179, 180, 178, 18, 174, 
	18, 18, 18, 8, 173, 174, 176, 177, 
	181, 179, 180, 181, 19, 174, 19, 19, 
	19, 8, 173, 174, 174, 8, 173, 174, 
	176, 177, 179, 180, 20, 174, 20, 20, 
	20, 8, 173, 174, 177, 174, 8, 173, 
	174, 21, 21, 174, 21, 21, 21, 8, 
	137, 16, 16, 16, 16, 136, 137, 18, 
	18, 18, 18, 136, 137, 21, 21, 21, 
	21, 21, 136, 31, 61, 58, 56, 44, 
	57, 55, 31, 43, 42, 8, 56, 83, 
	95, 94, 31, 32, 30, 111, 44, 123, 
	122, 31, 110, 109, 0
]

class << self
	attr_accessor :_rhaml_parser_trans_targs
	private :_rhaml_parser_trans_targs, :_rhaml_parser_trans_targs=
end
self._rhaml_parser_trans_targs = [
	88, 1, 1, 5, 7, 9, 12, 114, 
	0, 90, 4, 91, 91, 4, 6, 113, 
	115, 116, 117, 118, 120, 122, 14, 15, 
	87, 14, 16, 17, 69, 50, 17, 18, 
	52, 19, 129, 20, 21, 51, 20, 22, 
	23, 32, 23, 24, 25, 26, 128, 27, 
	28, 49, 27, 29, 25, 30, 48, 30, 
	31, 40, 32, 34, 126, 33, 35, 36, 
	39, 35, 37, 31, 38, 38, 41, 42, 
	127, 43, 44, 47, 43, 45, 41, 46, 
	46, 48, 50, 53, 54, 131, 55, 56, 
	68, 55, 57, 25, 58, 67, 58, 59, 
	60, 61, 130, 62, 63, 66, 62, 64, 
	41, 60, 65, 65, 67, 69, 70, 71, 
	72, 133, 73, 74, 86, 73, 75, 76, 
	31, 85, 76, 77, 78, 79, 132, 80, 
	81, 84, 80, 82, 78, 83, 83, 85, 
	88, 89, 110, 110, 111, 123, 124, 125, 
	90, 91, 92, 92, 93, 97, 100, 108, 
	91, 94, 95, 96, 96, 98, 99, 97, 
	99, 101, 102, 104, 100, 105, 107, 103, 
	102, 106, 109, 112, 2, 3, 8, 7, 
	10, 119, 9, 11, 121, 10
]

class << self
	attr_accessor :_rhaml_parser_trans_actions
	private :_rhaml_parser_trans_actions, :_rhaml_parser_trans_actions=
end
self._rhaml_parser_trans_actions = [
	77, 1, 3, 9, 15, 5, 15, 11, 
	0, 77, 1, 131, 77, 3, 0, 0, 
	17, 29, 7, 17, 19, 19, 101, 0, 
	31, 31, 0, 113, 113, 107, 35, 35, 
	35, 0, 37, 101, 0, 31, 31, 0, 
	113, 113, 35, 35, 35, 35, 125, 139, 
	35, 104, 104, 35, 113, 113, 143, 35, 
	35, 35, 35, 35, 125, 35, 139, 35, 
	104, 104, 35, 113, 143, 110, 35, 35, 
	125, 139, 35, 104, 104, 35, 113, 143, 
	110, 110, 33, 35, 35, 125, 147, 35, 
	116, 116, 35, 122, 122, 151, 35, 35, 
	35, 35, 125, 147, 35, 116, 116, 35, 
	122, 122, 151, 119, 119, 35, 35, 35, 
	35, 125, 147, 35, 116, 116, 35, 122, 
	122, 151, 35, 35, 35, 35, 125, 147, 
	35, 116, 116, 35, 122, 151, 119, 119, 
	27, 92, 80, 83, 89, 95, 86, 95, 
	27, 92, 41, 44, 53, 59, 47, 59, 
	135, 27, 27, 27, 56, 62, 27, 62, 
	98, 50, 68, 128, 50, 71, 74, 62, 
	62, 65, 65, 27, 0, 13, 0, 17, 
	21, 39, 7, 23, 25, 17
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


# line 483 "lib/rhaml/parser.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = rhaml_parser_start
	top = 0
end

# line 491 "lib/rhaml/parser.rb"
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
# line 41 "lib/rhaml/parser.rl"
		begin

          #tag.attributes << Attribute.new
        		end
when 17 then
# line 45 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.name << data[fpc]
        		end
when 18 then
# line 49 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = Variable.new
        		end
when 19 then
# line 53 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value.name << data[fpc]
        		end
when 20 then
# line 57 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = ""
        		end
when 21 then
# line 61 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value << data[fpc]
        		end
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
# line 695 "lib/rhaml/parser.rb"
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

# line 69 "lib/rhaml/parser.rl"


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
