
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
	8, 1, 10, 1, 12, 1, 13, 1, 
	14, 2, 7, 8, 2, 8, 12, 2, 
	9, 10, 2, 10, 12, 2, 11, 12, 
	2, 12, 8, 2, 12, 10, 2, 12, 
	11, 2, 12, 13, 3, 7, 8, 12, 
	3, 9, 10, 12, 3, 12, 7, 8, 
	3, 12, 9, 10
]

class << self
	attr_accessor :_rhaml_parser_key_offsets
	private :_rhaml_parser_key_offsets, :_rhaml_parser_key_offsets=
end
self._rhaml_parser_key_offsets = [
	0, 0, 4, 5, 6, 10, 11, 18, 
	22, 26, 36, 40, 49, 53, 63, 65, 
	69, 76, 85, 89, 99, 101, 103, 109, 
	118, 129, 135, 146, 149, 155, 157, 159, 
	168, 179, 185, 196, 207, 213, 216, 223, 
	233, 245, 252, 263, 275, 282, 293, 299, 
	308, 312, 314, 320, 329, 340, 346, 357, 
	360, 363, 370, 380, 392, 399, 410, 422, 
	429, 440, 446, 448, 450, 456, 465, 476, 
	482, 493, 496, 499, 506, 516, 528, 535, 
	546, 558, 565, 576, 582, 586, 590, 597, 
	599, 602, 604, 604, 607, 609, 612
]

class << self
	attr_accessor :_rhaml_parser_trans_keys
	private :_rhaml_parser_trans_keys, :_rhaml_parser_trans_keys=
end
self._rhaml_parser_trans_keys = [
	9, 32, 33, 37, 33, 33, 10, 32, 
	9, 13, 10, 9, 10, 32, 33, 37, 
	11, 13, 10, 32, 9, 13, 65, 90, 
	97, 122, 10, 32, 40, 45, 9, 13, 
	65, 90, 97, 122, 65, 90, 97, 122, 
	32, 45, 61, 9, 13, 65, 90, 97, 
	122, 32, 61, 9, 13, 32, 34, 39, 
	95, 9, 13, 65, 90, 97, 122, 34, 
	92, 32, 41, 9, 13, 32, 9, 13, 
	65, 90, 97, 122, 32, 45, 61, 9, 
	13, 65, 90, 97, 122, 32, 61, 9, 
	13, 32, 34, 39, 95, 9, 13, 65, 
	90, 97, 122, 34, 92, 34, 92, 32, 
	34, 41, 92, 9, 13, 32, 34, 92, 
	9, 13, 65, 90, 97, 122, 32, 34, 
	45, 61, 92, 9, 13, 65, 90, 97, 
	122, 32, 34, 61, 92, 9, 13, 32, 
	34, 39, 92, 95, 9, 13, 65, 90, 
	97, 122, 34, 39, 92, 32, 39, 41, 
	92, 9, 13, 39, 92, 39, 92, 32, 
	39, 92, 9, 13, 65, 90, 97, 122, 
	32, 39, 45, 61, 92, 9, 13, 65, 
	90, 97, 122, 32, 39, 61, 92, 9, 
	13, 32, 34, 39, 92, 95, 9, 13, 
	65, 90, 97, 122, 32, 39, 41, 92, 
	95, 9, 13, 65, 90, 97, 122, 39, 
	92, 65, 90, 97, 122, 34, 39, 92, 
	32, 34, 39, 41, 92, 9, 13, 32, 
	34, 39, 92, 9, 13, 65, 90, 97, 
	122, 32, 34, 39, 45, 61, 92, 9, 
	13, 65, 90, 97, 122, 32, 34, 39, 
	61, 92, 9, 13, 32, 34, 39, 92, 
	95, 9, 13, 65, 90, 97, 122, 32, 
	34, 39, 41, 92, 95, 9, 13, 65, 
	90, 97, 122, 34, 39, 92, 65, 90, 
	97, 122, 32, 34, 41, 92, 95, 9, 
	13, 65, 90, 97, 122, 34, 92, 65, 
	90, 97, 122, 32, 41, 95, 9, 13, 
	65, 90, 97, 122, 65, 90, 97, 122, 
	34, 92, 32, 34, 41, 92, 9, 13, 
	32, 34, 92, 9, 13, 65, 90, 97, 
	122, 32, 34, 45, 61, 92, 9, 13, 
	65, 90, 97, 122, 32, 34, 61, 92, 
	9, 13, 32, 34, 39, 92, 95, 9, 
	13, 65, 90, 97, 122, 34, 39, 92, 
	34, 39, 92, 32, 34, 39, 41, 92, 
	9, 13, 32, 34, 39, 92, 9, 13, 
	65, 90, 97, 122, 32, 34, 39, 45, 
	61, 92, 9, 13, 65, 90, 97, 122, 
	32, 34, 39, 61, 92, 9, 13, 32, 
	34, 39, 92, 95, 9, 13, 65, 90, 
	97, 122, 32, 34, 39, 41, 92, 95, 
	9, 13, 65, 90, 97, 122, 34, 39, 
	92, 65, 90, 97, 122, 32, 34, 41, 
	92, 95, 9, 13, 65, 90, 97, 122, 
	34, 92, 65, 90, 97, 122, 39, 92, 
	39, 92, 32, 39, 41, 92, 9, 13, 
	32, 39, 92, 9, 13, 65, 90, 97, 
	122, 32, 39, 45, 61, 92, 9, 13, 
	65, 90, 97, 122, 32, 39, 61, 92, 
	9, 13, 32, 34, 39, 92, 95, 9, 
	13, 65, 90, 97, 122, 34, 39, 92, 
	34, 39, 92, 32, 34, 39, 41, 92, 
	9, 13, 32, 34, 39, 92, 9, 13, 
	65, 90, 97, 122, 32, 34, 39, 45, 
	61, 92, 9, 13, 65, 90, 97, 122, 
	32, 34, 39, 61, 92, 9, 13, 32, 
	34, 39, 92, 95, 9, 13, 65, 90, 
	97, 122, 32, 34, 39, 41, 92, 95, 
	9, 13, 65, 90, 97, 122, 34, 39, 
	92, 65, 90, 97, 122, 32, 39, 41, 
	92, 95, 9, 13, 65, 90, 97, 122, 
	39, 92, 65, 90, 97, 122, 65, 90, 
	97, 122, 9, 32, 33, 37, 9, 10, 
	32, 33, 37, 11, 13, 39, 92, 34, 
	39, 92, 34, 92, 34, 39, 92, 34, 
	92, 34, 39, 92, 39, 92, 0
]

class << self
	attr_accessor :_rhaml_parser_single_lengths
	private :_rhaml_parser_single_lengths, :_rhaml_parser_single_lengths=
end
self._rhaml_parser_single_lengths = [
	0, 4, 1, 1, 2, 1, 5, 2, 
	0, 4, 0, 3, 2, 4, 2, 2, 
	1, 3, 2, 4, 2, 2, 4, 3, 
	5, 4, 5, 3, 4, 2, 2, 3, 
	5, 4, 5, 5, 2, 3, 5, 4, 
	6, 5, 5, 6, 3, 5, 2, 3, 
	0, 2, 4, 3, 5, 4, 5, 3, 
	3, 5, 4, 6, 5, 5, 6, 3, 
	5, 2, 2, 2, 4, 3, 5, 4, 
	5, 3, 3, 5, 4, 6, 5, 5, 
	6, 3, 5, 2, 0, 4, 5, 2, 
	3, 2, 0, 3, 2, 3, 2
]

class << self
	attr_accessor :_rhaml_parser_range_lengths
	private :_rhaml_parser_range_lengths, :_rhaml_parser_range_lengths=
end
self._rhaml_parser_range_lengths = [
	0, 0, 0, 0, 1, 0, 1, 1, 
	2, 3, 2, 3, 1, 3, 0, 1, 
	3, 3, 1, 3, 0, 0, 1, 3, 
	3, 1, 3, 0, 1, 0, 0, 3, 
	3, 1, 3, 3, 2, 0, 1, 3, 
	3, 1, 3, 3, 2, 3, 2, 3, 
	2, 0, 1, 3, 3, 1, 3, 0, 
	0, 1, 3, 3, 1, 3, 3, 2, 
	3, 2, 0, 0, 1, 3, 3, 1, 
	3, 0, 0, 1, 3, 3, 1, 3, 
	3, 2, 3, 2, 2, 0, 1, 0, 
	0, 0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_rhaml_parser_index_offsets
	private :_rhaml_parser_index_offsets, :_rhaml_parser_index_offsets=
end
self._rhaml_parser_index_offsets = [
	0, 0, 5, 7, 9, 13, 15, 22, 
	26, 29, 37, 40, 47, 51, 59, 62, 
	66, 71, 78, 82, 90, 93, 96, 102, 
	109, 118, 124, 133, 137, 143, 146, 149, 
	156, 165, 171, 180, 189, 194, 198, 205, 
	213, 223, 230, 239, 249, 255, 264, 269, 
	276, 279, 282, 288, 295, 304, 310, 319, 
	323, 327, 334, 342, 352, 359, 368, 378, 
	384, 393, 398, 401, 404, 410, 417, 426, 
	432, 441, 445, 449, 456, 464, 474, 481, 
	490, 500, 506, 515, 520, 523, 528, 535, 
	538, 542, 545, 546, 550, 553, 557
]

class << self
	attr_accessor :_rhaml_parser_trans_targs
	private :_rhaml_parser_trans_targs, :_rhaml_parser_trans_targs=
end
self._rhaml_parser_trans_targs = [
	1, 1, 2, 8, 0, 3, 0, 4, 
	0, 86, 5, 5, 0, 86, 5, 6, 
	86, 6, 2, 8, 7, 0, 86, 7, 
	7, 0, 9, 9, 0, 86, 7, 7, 
	8, 7, 9, 9, 0, 11, 11, 0, 
	12, 84, 13, 12, 11, 11, 0, 12, 
	13, 12, 0, 13, 14, 66, 47, 13, 
	47, 47, 0, 15, 49, 14, 16, 90, 
	16, 0, 16, 16, 17, 17, 0, 18, 
	48, 19, 18, 17, 17, 0, 18, 19, 
	18, 0, 19, 20, 29, 47, 19, 47, 
	47, 0, 15, 21, 20, 22, 21, 20, 
	23, 15, 89, 21, 23, 20, 23, 15, 
	21, 23, 24, 24, 20, 25, 15, 46, 
	26, 21, 25, 24, 24, 20, 25, 15, 
	26, 21, 25, 20, 26, 22, 27, 21, 
	45, 26, 45, 45, 20, 28, 22, 37, 
	27, 31, 15, 87, 30, 31, 29, 15, 
	30, 29, 28, 30, 29, 31, 15, 30, 
	31, 32, 32, 29, 33, 15, 36, 34, 
	30, 33, 32, 32, 29, 33, 15, 34, 
	30, 33, 29, 34, 27, 28, 30, 35, 
	34, 35, 35, 29, 31, 15, 87, 30, 
	35, 31, 35, 35, 29, 15, 30, 32, 
	32, 29, 38, 38, 37, 27, 39, 28, 
	22, 88, 37, 39, 27, 39, 28, 22, 
	37, 39, 40, 40, 27, 41, 28, 22, 
	44, 42, 37, 41, 40, 40, 27, 41, 
	28, 22, 42, 37, 41, 27, 42, 38, 
	38, 37, 43, 42, 43, 43, 27, 39, 
	28, 22, 88, 37, 43, 39, 43, 43, 
	27, 28, 22, 37, 40, 40, 27, 23, 
	15, 89, 21, 45, 23, 45, 45, 20, 
	15, 21, 24, 24, 20, 16, 90, 47, 
	16, 47, 47, 0, 17, 17, 0, 50, 
	49, 14, 51, 15, 92, 49, 51, 14, 
	51, 15, 49, 51, 52, 52, 14, 53, 
	15, 65, 54, 49, 53, 52, 52, 14, 
	53, 15, 54, 49, 53, 14, 54, 22, 
	55, 49, 64, 54, 64, 64, 14, 28, 
	50, 56, 55, 57, 57, 56, 55, 58, 
	28, 50, 91, 56, 58, 55, 58, 28, 
	50, 56, 58, 59, 59, 55, 60, 28, 
	50, 63, 61, 56, 60, 59, 59, 55, 
	60, 28, 50, 61, 56, 60, 55, 61, 
	38, 57, 56, 62, 61, 62, 62, 55, 
	58, 28, 50, 91, 56, 62, 58, 62, 
	62, 55, 28, 50, 56, 59, 59, 55, 
	51, 15, 92, 49, 64, 51, 64, 64, 
	14, 15, 49, 52, 52, 14, 15, 67, 
	66, 68, 67, 66, 69, 15, 94, 67, 
	69, 66, 69, 15, 67, 69, 70, 70, 
	66, 71, 15, 83, 72, 67, 71, 70, 
	70, 66, 71, 15, 72, 67, 71, 66, 
	72, 73, 28, 67, 82, 72, 82, 82, 
	66, 68, 22, 74, 73, 75, 75, 74, 
	73, 76, 68, 22, 93, 74, 76, 73, 
	76, 68, 22, 74, 76, 77, 77, 73, 
	78, 68, 22, 81, 79, 74, 78, 77, 
	77, 73, 78, 68, 22, 79, 74, 78, 
	73, 79, 75, 38, 74, 80, 79, 80, 
	80, 73, 76, 68, 22, 93, 74, 80, 
	76, 80, 80, 73, 68, 22, 74, 77, 
	77, 73, 69, 15, 94, 67, 82, 69, 
	82, 82, 66, 15, 67, 70, 70, 66, 
	11, 11, 0, 1, 1, 2, 8, 0, 
	6, 86, 6, 2, 8, 86, 0, 15, 
	30, 29, 28, 22, 37, 27, 15, 21, 
	20, 0, 28, 50, 56, 55, 15, 49, 
	14, 68, 22, 74, 73, 15, 67, 66, 
	0
]

class << self
	attr_accessor :_rhaml_parser_trans_actions
	private :_rhaml_parser_trans_actions, :_rhaml_parser_trans_actions=
end
self._rhaml_parser_trans_actions = [
	1, 3, 9, 5, 0, 0, 0, 0, 
	0, 13, 0, 0, 0, 13, 11, 1, 
	13, 3, 9, 5, 0, 0, 13, 0, 
	0, 0, 7, 7, 0, 13, 0, 23, 
	7, 0, 7, 7, 0, 25, 25, 0, 
	0, 15, 0, 0, 15, 15, 0, 0, 
	0, 0, 0, 0, 37, 37, 31, 0, 
	31, 31, 0, 19, 19, 19, 0, 21, 
	0, 0, 0, 0, 25, 25, 0, 0, 
	15, 0, 0, 15, 15, 0, 0, 0, 
	0, 0, 0, 37, 37, 31, 0, 31, 
	31, 0, 19, 19, 19, 19, 19, 19, 
	19, 19, 49, 19, 19, 19, 19, 19, 
	19, 19, 52, 52, 19, 19, 19, 28, 
	19, 19, 19, 28, 28, 19, 19, 19, 
	19, 19, 19, 19, 19, 37, 37, 19, 
	56, 19, 56, 56, 19, 19, 19, 19, 
	19, 19, 19, 49, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 52, 52, 19, 19, 19, 28, 19, 
	19, 19, 28, 28, 19, 19, 19, 19, 
	19, 19, 19, 19, 37, 37, 19, 56, 
	19, 56, 56, 19, 19, 19, 49, 19, 
	34, 19, 34, 34, 19, 19, 19, 28, 
	28, 19, 19, 19, 19, 19, 19, 19, 
	19, 49, 19, 19, 19, 19, 19, 19, 
	19, 19, 52, 52, 19, 19, 19, 19, 
	28, 19, 19, 19, 28, 28, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 37, 
	37, 19, 56, 19, 56, 56, 19, 19, 
	19, 19, 49, 19, 34, 19, 34, 34, 
	19, 19, 19, 19, 28, 28, 19, 19, 
	19, 49, 19, 34, 19, 34, 34, 19, 
	19, 19, 28, 28, 19, 0, 21, 17, 
	0, 17, 17, 0, 15, 15, 0, 19, 
	19, 19, 19, 19, 49, 19, 19, 19, 
	19, 19, 19, 19, 60, 60, 19, 19, 
	19, 40, 19, 19, 19, 40, 40, 19, 
	19, 19, 19, 19, 19, 19, 19, 46, 
	46, 19, 64, 19, 64, 64, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 49, 19, 19, 19, 19, 19, 
	19, 19, 19, 60, 60, 19, 19, 19, 
	19, 40, 19, 19, 19, 40, 40, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	46, 46, 19, 64, 19, 64, 64, 19, 
	19, 19, 19, 49, 19, 43, 19, 43, 
	43, 19, 19, 19, 19, 40, 40, 19, 
	19, 19, 49, 19, 43, 19, 43, 43, 
	19, 19, 19, 40, 40, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 49, 19, 
	19, 19, 19, 19, 19, 19, 60, 60, 
	19, 19, 19, 40, 19, 19, 19, 40, 
	40, 19, 19, 19, 19, 19, 19, 19, 
	19, 46, 46, 19, 64, 19, 64, 64, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 49, 19, 19, 19, 
	19, 19, 19, 19, 19, 60, 60, 19, 
	19, 19, 19, 40, 19, 19, 19, 40, 
	40, 19, 19, 19, 19, 19, 19, 19, 
	19, 19, 46, 46, 19, 64, 19, 64, 
	64, 19, 19, 19, 19, 49, 19, 43, 
	19, 43, 43, 19, 19, 19, 19, 40, 
	40, 19, 19, 19, 49, 19, 43, 19, 
	43, 43, 19, 19, 19, 40, 40, 19, 
	15, 15, 0, 1, 3, 9, 5, 0, 
	1, 13, 3, 9, 5, 0, 0, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	19, 0, 19, 19, 19, 19, 19, 19, 
	19, 19, 19, 19, 19, 19, 19, 19, 
	0
]

class << self
	attr_accessor :rhaml_parser_start
end
self.rhaml_parser_start = 85;
class << self
	attr_accessor :rhaml_parser_first_final
end
self.rhaml_parser_first_final = 85;
class << self
	attr_accessor :rhaml_parser_error
end
self.rhaml_parser_error = 0;

class << self
	attr_accessor :rhaml_parser_en_attributes
end
self.rhaml_parser_en_attributes = 10;
class << self
	attr_accessor :rhaml_parser_en_main
end
self.rhaml_parser_en_main = 85;


# line 381 "lib/rhaml/parser.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = rhaml_parser_start
	top = 0
end

# line 389 "lib/rhaml/parser.rb"
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
# line 32 "lib/rhaml/parser.rl"
		begin

          #tag.attributes << Attribute.new
        		end
when 8 then
# line 36 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.name << data[fpc]
        		end
when 9 then
# line 40 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = Variable.new
        		end
when 10 then
# line 44 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value.name << data[fpc]
        		end
when 11 then
# line 48 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = ""
        		end
when 12 then
# line 52 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value << data[fpc]
        		end
when 13 then
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
when 14 then
# line 6 "lib/rhaml/parser_common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 10
		_trigger_goto = true
		_goto_level = _again
		break
	end
 		end
# line 556 "lib/rhaml/parser.rb"
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

# line 60 "lib/rhaml/parser.rl"


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
