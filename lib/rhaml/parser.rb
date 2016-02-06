
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

      document = Document.new

      
# line 25 "lib/rhaml/parser.rb"
class << self
	attr_accessor :_rhaml_parser_actions
	private :_rhaml_parser_actions, :_rhaml_parser_actions=
end
self._rhaml_parser_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4, 1, 6, 1, 8, 1, 
	10, 1, 11, 1, 12, 2, 5, 6, 
	2, 6, 10, 2, 7, 8, 2, 8, 
	10, 2, 9, 10, 2, 10, 6, 2, 
	10, 8, 2, 10, 9, 2, 10, 11, 
	3, 5, 6, 10, 3, 7, 8, 10, 
	3, 10, 5, 6, 3, 10, 7, 8
]

class << self
	attr_accessor :_rhaml_parser_key_offsets
	private :_rhaml_parser_key_offsets, :_rhaml_parser_key_offsets=
end
self._rhaml_parser_key_offsets = [
	0, 0, 3, 7, 17, 21, 27, 31, 
	40, 44, 54, 56, 60, 67, 76, 80, 
	90, 92, 94, 100, 109, 120, 126, 137, 
	140, 146, 148, 150, 159, 170, 176, 187, 
	198, 204, 207, 214, 224, 236, 243, 254, 
	266, 273, 284, 290, 299, 303, 305, 311, 
	320, 331, 337, 348, 351, 354, 361, 371, 
	383, 390, 401, 413, 420, 431, 437, 439, 
	441, 447, 456, 467, 473, 484, 487, 490, 
	497, 507, 519, 526, 537, 549, 556, 567, 
	573, 577, 580, 586, 588, 591, 593, 593, 
	596, 598, 601
]

class << self
	attr_accessor :_rhaml_parser_trans_keys
	private :_rhaml_parser_trans_keys, :_rhaml_parser_trans_keys=
end
self._rhaml_parser_trans_keys = [
	9, 32, 37, 65, 90, 97, 122, 10, 
	32, 40, 45, 9, 13, 65, 90, 97, 
	122, 10, 32, 9, 13, 9, 10, 32, 
	37, 11, 13, 65, 90, 97, 122, 32, 
	45, 61, 9, 13, 65, 90, 97, 122, 
	32, 61, 9, 13, 32, 34, 39, 95, 
	9, 13, 65, 90, 97, 122, 34, 92, 
	32, 41, 9, 13, 32, 9, 13, 65, 
	90, 97, 122, 32, 45, 61, 9, 13, 
	65, 90, 97, 122, 32, 61, 9, 13, 
	32, 34, 39, 95, 9, 13, 65, 90, 
	97, 122, 34, 92, 34, 92, 32, 34, 
	41, 92, 9, 13, 32, 34, 92, 9, 
	13, 65, 90, 97, 122, 32, 34, 45, 
	61, 92, 9, 13, 65, 90, 97, 122, 
	32, 34, 61, 92, 9, 13, 32, 34, 
	39, 92, 95, 9, 13, 65, 90, 97, 
	122, 34, 39, 92, 32, 39, 41, 92, 
	9, 13, 39, 92, 39, 92, 32, 39, 
	92, 9, 13, 65, 90, 97, 122, 32, 
	39, 45, 61, 92, 9, 13, 65, 90, 
	97, 122, 32, 39, 61, 92, 9, 13, 
	32, 34, 39, 92, 95, 9, 13, 65, 
	90, 97, 122, 32, 39, 41, 92, 95, 
	9, 13, 65, 90, 97, 122, 39, 92, 
	65, 90, 97, 122, 34, 39, 92, 32, 
	34, 39, 41, 92, 9, 13, 32, 34, 
	39, 92, 9, 13, 65, 90, 97, 122, 
	32, 34, 39, 45, 61, 92, 9, 13, 
	65, 90, 97, 122, 32, 34, 39, 61, 
	92, 9, 13, 32, 34, 39, 92, 95, 
	9, 13, 65, 90, 97, 122, 32, 34, 
	39, 41, 92, 95, 9, 13, 65, 90, 
	97, 122, 34, 39, 92, 65, 90, 97, 
	122, 32, 34, 41, 92, 95, 9, 13, 
	65, 90, 97, 122, 34, 92, 65, 90, 
	97, 122, 32, 41, 95, 9, 13, 65, 
	90, 97, 122, 65, 90, 97, 122, 34, 
	92, 32, 34, 41, 92, 9, 13, 32, 
	34, 92, 9, 13, 65, 90, 97, 122, 
	32, 34, 45, 61, 92, 9, 13, 65, 
	90, 97, 122, 32, 34, 61, 92, 9, 
	13, 32, 34, 39, 92, 95, 9, 13, 
	65, 90, 97, 122, 34, 39, 92, 34, 
	39, 92, 32, 34, 39, 41, 92, 9, 
	13, 32, 34, 39, 92, 9, 13, 65, 
	90, 97, 122, 32, 34, 39, 45, 61, 
	92, 9, 13, 65, 90, 97, 122, 32, 
	34, 39, 61, 92, 9, 13, 32, 34, 
	39, 92, 95, 9, 13, 65, 90, 97, 
	122, 32, 34, 39, 41, 92, 95, 9, 
	13, 65, 90, 97, 122, 34, 39, 92, 
	65, 90, 97, 122, 32, 34, 41, 92, 
	95, 9, 13, 65, 90, 97, 122, 34, 
	92, 65, 90, 97, 122, 39, 92, 39, 
	92, 32, 39, 41, 92, 9, 13, 32, 
	39, 92, 9, 13, 65, 90, 97, 122, 
	32, 39, 45, 61, 92, 9, 13, 65, 
	90, 97, 122, 32, 39, 61, 92, 9, 
	13, 32, 34, 39, 92, 95, 9, 13, 
	65, 90, 97, 122, 34, 39, 92, 34, 
	39, 92, 32, 34, 39, 41, 92, 9, 
	13, 32, 34, 39, 92, 9, 13, 65, 
	90, 97, 122, 32, 34, 39, 45, 61, 
	92, 9, 13, 65, 90, 97, 122, 32, 
	34, 39, 61, 92, 9, 13, 32, 34, 
	39, 92, 95, 9, 13, 65, 90, 97, 
	122, 32, 34, 39, 41, 92, 95, 9, 
	13, 65, 90, 97, 122, 34, 39, 92, 
	65, 90, 97, 122, 32, 39, 41, 92, 
	95, 9, 13, 65, 90, 97, 122, 39, 
	92, 65, 90, 97, 122, 65, 90, 97, 
	122, 9, 32, 37, 9, 10, 32, 37, 
	11, 13, 39, 92, 34, 39, 92, 34, 
	92, 34, 39, 92, 34, 92, 34, 39, 
	92, 39, 92, 0
]

class << self
	attr_accessor :_rhaml_parser_single_lengths
	private :_rhaml_parser_single_lengths, :_rhaml_parser_single_lengths=
end
self._rhaml_parser_single_lengths = [
	0, 3, 0, 4, 2, 4, 0, 3, 
	2, 4, 2, 2, 1, 3, 2, 4, 
	2, 2, 4, 3, 5, 4, 5, 3, 
	4, 2, 2, 3, 5, 4, 5, 5, 
	2, 3, 5, 4, 6, 5, 5, 6, 
	3, 5, 2, 3, 0, 2, 4, 3, 
	5, 4, 5, 3, 3, 5, 4, 6, 
	5, 5, 6, 3, 5, 2, 2, 2, 
	4, 3, 5, 4, 5, 3, 3, 5, 
	4, 6, 5, 5, 6, 3, 5, 2, 
	0, 3, 4, 2, 3, 2, 0, 3, 
	2, 3, 2
]

class << self
	attr_accessor :_rhaml_parser_range_lengths
	private :_rhaml_parser_range_lengths, :_rhaml_parser_range_lengths=
end
self._rhaml_parser_range_lengths = [
	0, 0, 2, 3, 1, 1, 2, 3, 
	1, 3, 0, 1, 3, 3, 1, 3, 
	0, 0, 1, 3, 3, 1, 3, 0, 
	1, 0, 0, 3, 3, 1, 3, 3, 
	2, 0, 1, 3, 3, 1, 3, 3, 
	2, 3, 2, 3, 2, 0, 1, 3, 
	3, 1, 3, 0, 0, 1, 3, 3, 
	1, 3, 3, 2, 3, 2, 0, 0, 
	1, 3, 3, 1, 3, 0, 0, 1, 
	3, 3, 1, 3, 3, 2, 3, 2, 
	2, 0, 1, 0, 0, 0, 0, 0, 
	0, 0, 0
]

class << self
	attr_accessor :_rhaml_parser_index_offsets
	private :_rhaml_parser_index_offsets, :_rhaml_parser_index_offsets=
end
self._rhaml_parser_index_offsets = [
	0, 0, 4, 7, 15, 19, 25, 28, 
	35, 39, 47, 50, 54, 59, 66, 70, 
	78, 81, 84, 90, 97, 106, 112, 121, 
	125, 131, 134, 137, 144, 153, 159, 168, 
	177, 182, 186, 193, 201, 211, 218, 227, 
	237, 243, 252, 257, 264, 267, 270, 276, 
	283, 292, 298, 307, 311, 315, 322, 330, 
	340, 347, 356, 366, 372, 381, 386, 389, 
	392, 398, 405, 414, 420, 429, 433, 437, 
	444, 452, 462, 469, 478, 488, 494, 503, 
	508, 511, 515, 521, 524, 528, 531, 532, 
	536, 539, 543
]

class << self
	attr_accessor :_rhaml_parser_indicies
	private :_rhaml_parser_indicies, :_rhaml_parser_indicies=
end
self._rhaml_parser_indicies = [
	0, 2, 3, 1, 4, 4, 1, 6, 
	5, 7, 8, 5, 4, 4, 1, 6, 
	5, 5, 1, 9, 6, 10, 3, 5, 
	1, 11, 11, 1, 12, 13, 14, 12, 
	15, 15, 1, 12, 14, 12, 1, 14, 
	16, 17, 18, 14, 18, 18, 1, 20, 
	21, 19, 22, 23, 22, 1, 22, 22, 
	24, 24, 1, 25, 26, 27, 25, 28, 
	28, 1, 25, 27, 25, 1, 27, 29, 
	30, 18, 27, 18, 18, 1, 20, 32, 
	31, 33, 32, 31, 34, 20, 35, 32, 
	34, 31, 34, 20, 32, 34, 36, 36, 
	31, 37, 20, 38, 39, 32, 37, 40, 
	40, 31, 37, 20, 39, 32, 37, 31, 
	39, 41, 42, 32, 43, 39, 43, 43, 
	31, 45, 33, 46, 44, 48, 20, 49, 
	50, 48, 47, 20, 50, 47, 45, 50, 
	47, 48, 20, 50, 48, 51, 51, 47, 
	52, 20, 53, 54, 50, 52, 55, 55, 
	47, 52, 20, 54, 50, 52, 47, 54, 
	42, 56, 50, 57, 54, 57, 57, 47, 
	48, 20, 49, 50, 58, 48, 58, 58, 
	47, 20, 50, 55, 55, 47, 59, 59, 
	46, 44, 60, 45, 33, 61, 46, 60, 
	44, 60, 45, 33, 46, 60, 62, 62, 
	44, 63, 45, 33, 64, 65, 46, 63, 
	66, 66, 44, 63, 45, 33, 65, 46, 
	63, 44, 65, 67, 67, 46, 68, 65, 
	68, 68, 44, 60, 45, 33, 61, 46, 
	69, 60, 69, 69, 44, 45, 33, 46, 
	66, 66, 44, 34, 20, 35, 32, 70, 
	34, 70, 70, 31, 20, 32, 40, 40, 
	31, 22, 23, 71, 22, 71, 71, 1, 
	28, 28, 1, 72, 21, 19, 73, 20, 
	74, 21, 73, 19, 73, 20, 21, 73, 
	75, 75, 19, 76, 20, 77, 78, 21, 
	76, 79, 79, 19, 76, 20, 78, 21, 
	76, 19, 78, 80, 81, 21, 82, 78, 
	82, 82, 19, 45, 72, 84, 83, 85, 
	85, 84, 83, 86, 45, 72, 87, 84, 
	86, 83, 86, 45, 72, 84, 86, 88, 
	88, 83, 89, 45, 72, 90, 91, 84, 
	89, 92, 92, 83, 89, 45, 72, 91, 
	84, 89, 83, 91, 93, 94, 84, 95, 
	91, 95, 95, 83, 86, 45, 72, 87, 
	84, 96, 86, 96, 96, 83, 45, 72, 
	84, 92, 92, 83, 73, 20, 74, 21, 
	97, 73, 97, 97, 19, 20, 21, 79, 
	79, 19, 20, 99, 98, 100, 99, 98, 
	101, 20, 102, 99, 101, 98, 101, 20, 
	99, 101, 103, 103, 98, 104, 20, 105, 
	106, 99, 104, 107, 107, 98, 104, 20, 
	106, 99, 104, 98, 106, 108, 109, 99, 
	110, 106, 110, 110, 98, 100, 33, 112, 
	111, 113, 113, 112, 111, 114, 100, 33, 
	115, 112, 114, 111, 114, 100, 33, 112, 
	114, 116, 116, 111, 117, 100, 33, 118, 
	119, 112, 117, 120, 120, 111, 117, 100, 
	33, 119, 112, 117, 111, 119, 121, 93, 
	112, 122, 119, 122, 122, 111, 114, 100, 
	33, 115, 112, 123, 114, 123, 123, 111, 
	100, 33, 112, 120, 120, 111, 101, 20, 
	102, 99, 124, 101, 124, 124, 98, 20, 
	99, 107, 107, 98, 15, 15, 1, 0, 
	2, 3, 1, 9, 6, 10, 3, 125, 
	1, 20, 50, 47, 45, 33, 46, 44, 
	20, 32, 31, 1, 45, 72, 84, 83, 
	20, 21, 19, 100, 33, 112, 111, 20, 
	99, 98, 0
]

class << self
	attr_accessor :_rhaml_parser_trans_targs
	private :_rhaml_parser_trans_targs, :_rhaml_parser_trans_targs=
end
self._rhaml_parser_trans_targs = [
	1, 0, 1, 2, 3, 4, 82, 4, 
	2, 5, 5, 7, 8, 80, 9, 7, 
	10, 62, 43, 10, 11, 45, 12, 86, 
	13, 14, 44, 15, 13, 16, 25, 16, 
	17, 18, 19, 85, 20, 21, 42, 22, 
	20, 18, 23, 41, 23, 24, 33, 25, 
	27, 83, 26, 28, 29, 32, 30, 28, 
	24, 31, 31, 34, 35, 84, 36, 37, 
	40, 38, 36, 34, 39, 39, 41, 43, 
	46, 47, 88, 48, 49, 61, 50, 48, 
	18, 51, 60, 51, 52, 53, 54, 87, 
	55, 56, 59, 57, 55, 34, 53, 58, 
	58, 60, 62, 63, 64, 65, 90, 66, 
	67, 79, 68, 66, 69, 24, 78, 69, 
	70, 71, 72, 89, 73, 74, 77, 75, 
	73, 71, 76, 76, 78, 82
]

class << self
	attr_accessor :_rhaml_parser_trans_actions
	private :_rhaml_parser_trans_actions, :_rhaml_parser_trans_actions=
end
self._rhaml_parser_trans_actions = [
	1, 0, 3, 5, 7, 0, 9, 19, 
	7, 1, 3, 21, 0, 11, 0, 11, 
	33, 33, 27, 15, 15, 15, 0, 17, 
	21, 0, 11, 0, 11, 33, 33, 15, 
	15, 15, 15, 45, 48, 15, 24, 15, 
	24, 33, 33, 52, 15, 15, 15, 15, 
	15, 45, 15, 48, 15, 24, 15, 24, 
	33, 52, 30, 15, 15, 45, 48, 15, 
	24, 15, 24, 33, 52, 30, 30, 13, 
	15, 15, 45, 56, 15, 36, 15, 36, 
	42, 42, 60, 15, 15, 15, 15, 45, 
	56, 15, 36, 15, 36, 42, 42, 60, 
	39, 39, 15, 15, 15, 15, 45, 56, 
	15, 36, 15, 36, 42, 42, 60, 15, 
	15, 15, 15, 45, 56, 15, 36, 15, 
	36, 42, 60, 39, 39, 0
]

class << self
	attr_accessor :rhaml_parser_start
end
self.rhaml_parser_start = 81;
class << self
	attr_accessor :rhaml_parser_first_final
end
self.rhaml_parser_first_final = 81;
class << self
	attr_accessor :rhaml_parser_error
end
self.rhaml_parser_error = 0;

class << self
	attr_accessor :rhaml_parser_en_attributes
end
self.rhaml_parser_en_attributes = 6;
class << self
	attr_accessor :rhaml_parser_en_main
end
self.rhaml_parser_en_main = 81;


# line 345 "lib/rhaml/parser.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = rhaml_parser_start
	top = 0
end

# line 353 "lib/rhaml/parser.rb"
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
 document.newline 		end
when 5 then
# line 30 "lib/rhaml/parser.rl"
		begin

          #tag.attributes << Attribute.new
        		end
when 6 then
# line 34 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.name << data[fpc]
        		end
when 7 then
# line 38 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = Variable.new
        		end
when 8 then
# line 42 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value.name << data[fpc]
        		end
when 9 then
# line 46 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = ""
        		end
when 10 then
# line 50 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value << data[fpc]
        		end
when 11 then
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
when 12 then
# line 6 "lib/rhaml/parser_common.rl"
		begin
 	begin
		stack[top] = cs
		top+= 1
		cs = 6
		_trigger_goto = true
		_goto_level = _again
		break
	end
 		end
# line 513 "lib/rhaml/parser.rb"
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

# line 58 "lib/rhaml/parser.rl"


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
