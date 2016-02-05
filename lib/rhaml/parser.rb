
# line 1 "lib/rhaml/parser.rl"
require 'rhaml/document'

module RHaml
  class Parser
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

      
# line 23 "lib/rhaml/parser.rb"
class << self
	attr_accessor :_rhaml_parser_actions
	private :_rhaml_parser_actions, :_rhaml_parser_actions=
end
self._rhaml_parser_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 5, 1, 7, 1, 9, 1, 
	10, 1, 11, 2, 4, 5, 2, 5, 
	9, 2, 6, 7, 2, 7, 9, 2, 
	8, 9, 2, 9, 5, 2, 9, 7, 
	2, 9, 8, 2, 9, 10, 3, 4, 
	5, 9, 3, 6, 7, 9, 3, 9, 
	4, 5, 3, 9, 6, 7
]

class << self
	attr_accessor :_rhaml_parser_key_offsets
	private :_rhaml_parser_key_offsets, :_rhaml_parser_key_offsets=
end
self._rhaml_parser_key_offsets = [
	0, 0, 1, 3, 7, 17, 21, 25, 
	34, 38, 48, 50, 54, 61, 70, 74, 
	84, 86, 88, 94, 103, 114, 120, 131, 
	134, 140, 142, 144, 153, 164, 170, 181, 
	192, 198, 201, 208, 218, 230, 237, 248, 
	260, 267, 278, 284, 293, 297, 299, 305, 
	314, 325, 331, 342, 345, 348, 355, 365, 
	377, 384, 395, 407, 414, 425, 431, 433, 
	435, 441, 450, 461, 467, 478, 481, 484, 
	491, 501, 513, 520, 531, 543, 550, 561, 
	567, 571, 573, 575, 578, 580, 580, 583, 
	585, 588
]

class << self
	attr_accessor :_rhaml_parser_trans_keys
	private :_rhaml_parser_trans_keys, :_rhaml_parser_trans_keys=
end
self._rhaml_parser_trans_keys = [
	32, 32, 37, 65, 90, 97, 122, 10, 
	32, 40, 45, 9, 13, 65, 90, 97, 
	122, 10, 32, 9, 13, 65, 90, 97, 
	122, 32, 45, 61, 9, 13, 65, 90, 
	97, 122, 32, 61, 9, 13, 32, 34, 
	39, 95, 9, 13, 65, 90, 97, 122, 
	34, 92, 32, 41, 9, 13, 32, 9, 
	13, 65, 90, 97, 122, 32, 45, 61, 
	9, 13, 65, 90, 97, 122, 32, 61, 
	9, 13, 32, 34, 39, 95, 9, 13, 
	65, 90, 97, 122, 34, 92, 34, 92, 
	32, 34, 41, 92, 9, 13, 32, 34, 
	92, 9, 13, 65, 90, 97, 122, 32, 
	34, 45, 61, 92, 9, 13, 65, 90, 
	97, 122, 32, 34, 61, 92, 9, 13, 
	32, 34, 39, 92, 95, 9, 13, 65, 
	90, 97, 122, 34, 39, 92, 32, 39, 
	41, 92, 9, 13, 39, 92, 39, 92, 
	32, 39, 92, 9, 13, 65, 90, 97, 
	122, 32, 39, 45, 61, 92, 9, 13, 
	65, 90, 97, 122, 32, 39, 61, 92, 
	9, 13, 32, 34, 39, 92, 95, 9, 
	13, 65, 90, 97, 122, 32, 39, 41, 
	92, 95, 9, 13, 65, 90, 97, 122, 
	39, 92, 65, 90, 97, 122, 34, 39, 
	92, 32, 34, 39, 41, 92, 9, 13, 
	32, 34, 39, 92, 9, 13, 65, 90, 
	97, 122, 32, 34, 39, 45, 61, 92, 
	9, 13, 65, 90, 97, 122, 32, 34, 
	39, 61, 92, 9, 13, 32, 34, 39, 
	92, 95, 9, 13, 65, 90, 97, 122, 
	32, 34, 39, 41, 92, 95, 9, 13, 
	65, 90, 97, 122, 34, 39, 92, 65, 
	90, 97, 122, 32, 34, 41, 92, 95, 
	9, 13, 65, 90, 97, 122, 34, 92, 
	65, 90, 97, 122, 32, 41, 95, 9, 
	13, 65, 90, 97, 122, 65, 90, 97, 
	122, 34, 92, 32, 34, 41, 92, 9, 
	13, 32, 34, 92, 9, 13, 65, 90, 
	97, 122, 32, 34, 45, 61, 92, 9, 
	13, 65, 90, 97, 122, 32, 34, 61, 
	92, 9, 13, 32, 34, 39, 92, 95, 
	9, 13, 65, 90, 97, 122, 34, 39, 
	92, 34, 39, 92, 32, 34, 39, 41, 
	92, 9, 13, 32, 34, 39, 92, 9, 
	13, 65, 90, 97, 122, 32, 34, 39, 
	45, 61, 92, 9, 13, 65, 90, 97, 
	122, 32, 34, 39, 61, 92, 9, 13, 
	32, 34, 39, 92, 95, 9, 13, 65, 
	90, 97, 122, 32, 34, 39, 41, 92, 
	95, 9, 13, 65, 90, 97, 122, 34, 
	39, 92, 65, 90, 97, 122, 32, 34, 
	41, 92, 95, 9, 13, 65, 90, 97, 
	122, 34, 92, 65, 90, 97, 122, 39, 
	92, 39, 92, 32, 39, 41, 92, 9, 
	13, 32, 39, 92, 9, 13, 65, 90, 
	97, 122, 32, 39, 45, 61, 92, 9, 
	13, 65, 90, 97, 122, 32, 39, 61, 
	92, 9, 13, 32, 34, 39, 92, 95, 
	9, 13, 65, 90, 97, 122, 34, 39, 
	92, 34, 39, 92, 32, 34, 39, 41, 
	92, 9, 13, 32, 34, 39, 92, 9, 
	13, 65, 90, 97, 122, 32, 34, 39, 
	45, 61, 92, 9, 13, 65, 90, 97, 
	122, 32, 34, 39, 61, 92, 9, 13, 
	32, 34, 39, 92, 95, 9, 13, 65, 
	90, 97, 122, 32, 34, 39, 41, 92, 
	95, 9, 13, 65, 90, 97, 122, 34, 
	39, 92, 65, 90, 97, 122, 32, 39, 
	41, 92, 95, 9, 13, 65, 90, 97, 
	122, 39, 92, 65, 90, 97, 122, 65, 
	90, 97, 122, 32, 37, 39, 92, 34, 
	39, 92, 34, 92, 34, 39, 92, 34, 
	92, 34, 39, 92, 39, 92, 0
]

class << self
	attr_accessor :_rhaml_parser_single_lengths
	private :_rhaml_parser_single_lengths, :_rhaml_parser_single_lengths=
end
self._rhaml_parser_single_lengths = [
	0, 1, 2, 0, 4, 2, 0, 3, 
	2, 4, 2, 2, 1, 3, 2, 4, 
	2, 2, 4, 3, 5, 4, 5, 3, 
	4, 2, 2, 3, 5, 4, 5, 5, 
	2, 3, 5, 4, 6, 5, 5, 6, 
	3, 5, 2, 3, 0, 2, 4, 3, 
	5, 4, 5, 3, 3, 5, 4, 6, 
	5, 5, 6, 3, 5, 2, 2, 2, 
	4, 3, 5, 4, 5, 3, 3, 5, 
	4, 6, 5, 5, 6, 3, 5, 2, 
	0, 2, 2, 3, 2, 0, 3, 2, 
	3, 2
]

class << self
	attr_accessor :_rhaml_parser_range_lengths
	private :_rhaml_parser_range_lengths, :_rhaml_parser_range_lengths=
end
self._rhaml_parser_range_lengths = [
	0, 0, 0, 2, 3, 1, 2, 3, 
	1, 3, 0, 1, 3, 3, 1, 3, 
	0, 0, 1, 3, 3, 1, 3, 0, 
	1, 0, 0, 3, 3, 1, 3, 3, 
	2, 0, 1, 3, 3, 1, 3, 3, 
	2, 3, 2, 3, 2, 0, 1, 3, 
	3, 1, 3, 0, 0, 1, 3, 3, 
	1, 3, 3, 2, 3, 2, 0, 0, 
	1, 3, 3, 1, 3, 0, 0, 1, 
	3, 3, 1, 3, 3, 2, 3, 2, 
	2, 0, 0, 0, 0, 0, 0, 0, 
	0, 0
]

class << self
	attr_accessor :_rhaml_parser_index_offsets
	private :_rhaml_parser_index_offsets, :_rhaml_parser_index_offsets=
end
self._rhaml_parser_index_offsets = [
	0, 0, 2, 5, 8, 16, 20, 23, 
	30, 34, 42, 45, 49, 54, 61, 65, 
	73, 76, 79, 85, 92, 101, 107, 116, 
	120, 126, 129, 132, 139, 148, 154, 163, 
	172, 177, 181, 188, 196, 206, 213, 222, 
	232, 238, 247, 252, 259, 262, 265, 271, 
	278, 287, 293, 302, 306, 310, 317, 325, 
	335, 342, 351, 361, 367, 376, 381, 384, 
	387, 393, 400, 409, 415, 424, 428, 432, 
	439, 447, 457, 464, 473, 483, 489, 498, 
	503, 506, 509, 512, 516, 519, 520, 524, 
	527, 531
]

class << self
	attr_accessor :_rhaml_parser_indicies
	private :_rhaml_parser_indicies, :_rhaml_parser_indicies=
end
self._rhaml_parser_indicies = [
	0, 1, 2, 3, 1, 4, 4, 1, 
	6, 5, 7, 8, 5, 4, 4, 1, 
	6, 5, 5, 1, 9, 9, 1, 10, 
	11, 12, 10, 13, 13, 1, 10, 12, 
	10, 1, 12, 14, 15, 16, 12, 16, 
	16, 1, 18, 19, 17, 20, 21, 20, 
	1, 20, 20, 22, 22, 1, 23, 24, 
	25, 23, 26, 26, 1, 23, 25, 23, 
	1, 25, 27, 28, 16, 25, 16, 16, 
	1, 18, 30, 29, 31, 30, 29, 32, 
	18, 33, 30, 32, 29, 32, 18, 30, 
	32, 34, 34, 29, 35, 18, 36, 37, 
	30, 35, 38, 38, 29, 35, 18, 37, 
	30, 35, 29, 37, 39, 40, 30, 41, 
	37, 41, 41, 29, 43, 31, 44, 42, 
	46, 18, 47, 48, 46, 45, 18, 48, 
	45, 43, 48, 45, 46, 18, 48, 46, 
	49, 49, 45, 50, 18, 51, 52, 48, 
	50, 53, 53, 45, 50, 18, 52, 48, 
	50, 45, 52, 40, 54, 48, 55, 52, 
	55, 55, 45, 46, 18, 47, 48, 56, 
	46, 56, 56, 45, 18, 48, 53, 53, 
	45, 57, 57, 44, 42, 58, 43, 31, 
	59, 44, 58, 42, 58, 43, 31, 44, 
	58, 60, 60, 42, 61, 43, 31, 62, 
	63, 44, 61, 64, 64, 42, 61, 43, 
	31, 63, 44, 61, 42, 63, 65, 65, 
	44, 66, 63, 66, 66, 42, 58, 43, 
	31, 59, 44, 67, 58, 67, 67, 42, 
	43, 31, 44, 64, 64, 42, 32, 18, 
	33, 30, 68, 32, 68, 68, 29, 18, 
	30, 38, 38, 29, 20, 21, 69, 20, 
	69, 69, 1, 26, 26, 1, 70, 19, 
	17, 71, 18, 72, 19, 71, 17, 71, 
	18, 19, 71, 73, 73, 17, 74, 18, 
	75, 76, 19, 74, 77, 77, 17, 74, 
	18, 76, 19, 74, 17, 76, 78, 79, 
	19, 80, 76, 80, 80, 17, 43, 70, 
	82, 81, 83, 83, 82, 81, 84, 43, 
	70, 85, 82, 84, 81, 84, 43, 70, 
	82, 84, 86, 86, 81, 87, 43, 70, 
	88, 89, 82, 87, 90, 90, 81, 87, 
	43, 70, 89, 82, 87, 81, 89, 91, 
	92, 82, 93, 89, 93, 93, 81, 84, 
	43, 70, 85, 82, 94, 84, 94, 94, 
	81, 43, 70, 82, 90, 90, 81, 71, 
	18, 72, 19, 95, 71, 95, 95, 17, 
	18, 19, 77, 77, 17, 18, 97, 96, 
	98, 97, 96, 99, 18, 100, 97, 99, 
	96, 99, 18, 97, 99, 101, 101, 96, 
	102, 18, 103, 104, 97, 102, 105, 105, 
	96, 102, 18, 104, 97, 102, 96, 104, 
	106, 107, 97, 108, 104, 108, 108, 96, 
	98, 31, 110, 109, 111, 111, 110, 109, 
	112, 98, 31, 113, 110, 112, 109, 112, 
	98, 31, 110, 112, 114, 114, 109, 115, 
	98, 31, 116, 117, 110, 115, 118, 118, 
	109, 115, 98, 31, 117, 110, 115, 109, 
	117, 119, 91, 110, 120, 117, 120, 120, 
	109, 112, 98, 31, 113, 110, 121, 112, 
	121, 121, 109, 98, 31, 110, 118, 118, 
	109, 99, 18, 100, 97, 122, 99, 122, 
	122, 96, 18, 97, 105, 105, 96, 13, 
	13, 1, 2, 3, 1, 18, 48, 45, 
	43, 31, 44, 42, 18, 30, 29, 1, 
	43, 70, 82, 81, 18, 19, 17, 98, 
	31, 110, 109, 18, 97, 96, 0
]

class << self
	attr_accessor :_rhaml_parser_trans_targs
	private :_rhaml_parser_trans_targs, :_rhaml_parser_trans_targs=
end
self._rhaml_parser_trans_targs = [
	2, 0, 1, 3, 4, 5, 81, 5, 
	3, 7, 8, 80, 9, 7, 10, 62, 
	43, 10, 11, 45, 12, 85, 13, 14, 
	44, 15, 13, 16, 25, 16, 17, 18, 
	19, 84, 20, 21, 42, 22, 20, 18, 
	23, 41, 23, 24, 33, 25, 27, 82, 
	26, 28, 29, 32, 30, 28, 24, 31, 
	31, 34, 35, 83, 36, 37, 40, 38, 
	36, 34, 39, 39, 41, 43, 46, 47, 
	87, 48, 49, 61, 50, 48, 18, 51, 
	60, 51, 52, 53, 54, 86, 55, 56, 
	59, 57, 55, 34, 53, 58, 58, 60, 
	62, 63, 64, 65, 89, 66, 67, 79, 
	68, 66, 69, 24, 78, 69, 70, 71, 
	72, 88, 73, 74, 77, 75, 73, 71, 
	76, 76, 78
]

class << self
	attr_accessor :_rhaml_parser_trans_actions
	private :_rhaml_parser_trans_actions, :_rhaml_parser_trans_actions=
end
self._rhaml_parser_trans_actions = [
	1, 0, 0, 3, 5, 0, 7, 17, 
	5, 19, 0, 9, 0, 9, 31, 31, 
	25, 13, 13, 13, 0, 15, 19, 0, 
	9, 0, 9, 31, 31, 13, 13, 13, 
	13, 43, 46, 13, 22, 13, 22, 31, 
	31, 50, 13, 13, 13, 13, 13, 43, 
	13, 46, 13, 22, 13, 22, 31, 50, 
	28, 13, 13, 43, 46, 13, 22, 13, 
	22, 31, 50, 28, 28, 11, 13, 13, 
	43, 54, 13, 34, 13, 34, 40, 40, 
	58, 13, 13, 13, 13, 43, 54, 13, 
	34, 13, 34, 40, 40, 58, 37, 37, 
	13, 13, 13, 13, 43, 54, 13, 34, 
	13, 34, 40, 40, 58, 13, 13, 13, 
	13, 43, 54, 13, 34, 13, 34, 40, 
	58, 37, 37
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


# line 339 "lib/rhaml/parser.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = rhaml_parser_start
	top = 0
end

# line 347 "lib/rhaml/parser.rb"
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
# line 22 "lib/rhaml/parser.rl"
		begin
 document.indent 		end
when 1 then
# line 23 "lib/rhaml/parser.rl"
		begin
 document.new_tag 		end
when 2 then
# line 24 "lib/rhaml/parser.rl"
		begin
 document.append_to_tag_name(data[p]) 		end
when 3 then
# line 25 "lib/rhaml/parser.rl"
		begin
 document.newline 		end
when 4 then
# line 27 "lib/rhaml/parser.rl"
		begin

          #tag.attributes << Attribute.new
        		end
when 5 then
# line 31 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.name << data[fpc]
        		end
when 6 then
# line 35 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = Variable.new
        		end
when 7 then
# line 39 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value.name << data[fpc]
        		end
when 8 then
# line 43 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = ""
        		end
when 9 then
# line 47 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value << data[fpc]
        		end
when 10 then
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
when 11 then
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
# line 503 "lib/rhaml/parser.rb"
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

# line 55 "lib/rhaml/parser.rl"


      if cs == rhaml_parser_error
        coords = linecol(text, p)
        raise ParseError.new("ParseError at #{coords.join(':')}\n#{text.lines[coords[0]-1..coords[0]+1].inspect}")
      end

      document.compile
    end

    def linecol(text, p)
      line = 0
      col = 0
      text.chars.each do |c|
        if c == "\n"
          line += 1
          col = 0
        elsif c == text[p]
          break
        else
          col += 1
        end
      end
      [line, col]
    end
  end
end
