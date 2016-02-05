
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
	4, 1, 6, 1, 8, 1, 9, 1, 
	10, 2, 3, 4, 2, 4, 8, 2, 
	5, 6, 2, 6, 8, 2, 7, 8, 
	2, 8, 4, 2, 8, 6, 2, 8, 
	7, 2, 8, 9, 3, 3, 4, 8, 
	3, 5, 6, 8, 3, 8, 3, 4, 
	3, 8, 5, 6
]

class << self
	attr_accessor :_rhaml_parser_key_offsets
	private :_rhaml_parser_key_offsets, :_rhaml_parser_key_offsets=
end
self._rhaml_parser_key_offsets = [
	0, 0, 1, 3, 7, 14, 15, 19, 
	28, 32, 42, 44, 48, 55, 64, 68, 
	78, 80, 82, 88, 97, 108, 114, 125, 
	128, 134, 136, 138, 147, 158, 164, 175, 
	186, 192, 195, 202, 212, 224, 231, 242, 
	254, 261, 272, 278, 287, 291, 293, 299, 
	308, 319, 325, 336, 339, 342, 349, 359, 
	371, 378, 389, 401, 408, 419, 425, 427, 
	429, 435, 444, 455, 461, 472, 475, 478, 
	485, 495, 507, 514, 525, 537, 544, 555, 
	561, 565, 567, 569, 572, 574, 574, 577, 
	579, 582
]

class << self
	attr_accessor :_rhaml_parser_trans_keys
	private :_rhaml_parser_trans_keys, :_rhaml_parser_trans_keys=
end
self._rhaml_parser_trans_keys = [
	32, 32, 37, 65, 90, 97, 122, 10, 
	40, 45, 65, 90, 97, 122, 10, 65, 
	90, 97, 122, 32, 45, 61, 9, 10, 
	65, 90, 97, 122, 32, 61, 9, 10, 
	32, 34, 39, 95, 9, 10, 65, 90, 
	97, 122, 34, 92, 32, 41, 9, 10, 
	32, 9, 10, 65, 90, 97, 122, 32, 
	45, 61, 9, 10, 65, 90, 97, 122, 
	32, 61, 9, 10, 32, 34, 39, 95, 
	9, 10, 65, 90, 97, 122, 34, 92, 
	34, 92, 32, 34, 41, 92, 9, 10, 
	32, 34, 92, 9, 10, 65, 90, 97, 
	122, 32, 34, 45, 61, 92, 9, 10, 
	65, 90, 97, 122, 32, 34, 61, 92, 
	9, 10, 32, 34, 39, 92, 95, 9, 
	10, 65, 90, 97, 122, 34, 39, 92, 
	32, 39, 41, 92, 9, 10, 39, 92, 
	39, 92, 32, 39, 92, 9, 10, 65, 
	90, 97, 122, 32, 39, 45, 61, 92, 
	9, 10, 65, 90, 97, 122, 32, 39, 
	61, 92, 9, 10, 32, 34, 39, 92, 
	95, 9, 10, 65, 90, 97, 122, 32, 
	39, 41, 92, 95, 9, 10, 65, 90, 
	97, 122, 39, 92, 65, 90, 97, 122, 
	34, 39, 92, 32, 34, 39, 41, 92, 
	9, 10, 32, 34, 39, 92, 9, 10, 
	65, 90, 97, 122, 32, 34, 39, 45, 
	61, 92, 9, 10, 65, 90, 97, 122, 
	32, 34, 39, 61, 92, 9, 10, 32, 
	34, 39, 92, 95, 9, 10, 65, 90, 
	97, 122, 32, 34, 39, 41, 92, 95, 
	9, 10, 65, 90, 97, 122, 34, 39, 
	92, 65, 90, 97, 122, 32, 34, 41, 
	92, 95, 9, 10, 65, 90, 97, 122, 
	34, 92, 65, 90, 97, 122, 32, 41, 
	95, 9, 10, 65, 90, 97, 122, 65, 
	90, 97, 122, 34, 92, 32, 34, 41, 
	92, 9, 10, 32, 34, 92, 9, 10, 
	65, 90, 97, 122, 32, 34, 45, 61, 
	92, 9, 10, 65, 90, 97, 122, 32, 
	34, 61, 92, 9, 10, 32, 34, 39, 
	92, 95, 9, 10, 65, 90, 97, 122, 
	34, 39, 92, 34, 39, 92, 32, 34, 
	39, 41, 92, 9, 10, 32, 34, 39, 
	92, 9, 10, 65, 90, 97, 122, 32, 
	34, 39, 45, 61, 92, 9, 10, 65, 
	90, 97, 122, 32, 34, 39, 61, 92, 
	9, 10, 32, 34, 39, 92, 95, 9, 
	10, 65, 90, 97, 122, 32, 34, 39, 
	41, 92, 95, 9, 10, 65, 90, 97, 
	122, 34, 39, 92, 65, 90, 97, 122, 
	32, 34, 41, 92, 95, 9, 10, 65, 
	90, 97, 122, 34, 92, 65, 90, 97, 
	122, 39, 92, 39, 92, 32, 39, 41, 
	92, 9, 10, 32, 39, 92, 9, 10, 
	65, 90, 97, 122, 32, 39, 45, 61, 
	92, 9, 10, 65, 90, 97, 122, 32, 
	39, 61, 92, 9, 10, 32, 34, 39, 
	92, 95, 9, 10, 65, 90, 97, 122, 
	34, 39, 92, 34, 39, 92, 32, 34, 
	39, 41, 92, 9, 10, 32, 34, 39, 
	92, 9, 10, 65, 90, 97, 122, 32, 
	34, 39, 45, 61, 92, 9, 10, 65, 
	90, 97, 122, 32, 34, 39, 61, 92, 
	9, 10, 32, 34, 39, 92, 95, 9, 
	10, 65, 90, 97, 122, 32, 34, 39, 
	41, 92, 95, 9, 10, 65, 90, 97, 
	122, 34, 39, 92, 65, 90, 97, 122, 
	32, 39, 41, 92, 95, 9, 10, 65, 
	90, 97, 122, 39, 92, 65, 90, 97, 
	122, 65, 90, 97, 122, 32, 37, 39, 
	92, 34, 39, 92, 34, 92, 34, 39, 
	92, 34, 92, 34, 39, 92, 39, 92, 
	0
]

class << self
	attr_accessor :_rhaml_parser_single_lengths
	private :_rhaml_parser_single_lengths, :_rhaml_parser_single_lengths=
end
self._rhaml_parser_single_lengths = [
	0, 1, 2, 0, 3, 1, 0, 3, 
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
	0, 0, 0, 2, 2, 0, 2, 3, 
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
	0, 0, 2, 5, 8, 14, 16, 19, 
	26, 30, 38, 41, 45, 50, 57, 61, 
	69, 72, 75, 81, 88, 97, 103, 112, 
	116, 122, 125, 128, 135, 144, 150, 159, 
	168, 173, 177, 184, 192, 202, 209, 218, 
	228, 234, 243, 248, 255, 258, 261, 267, 
	274, 283, 289, 298, 302, 306, 313, 321, 
	331, 338, 347, 357, 363, 372, 377, 380, 
	383, 389, 396, 405, 411, 420, 424, 428, 
	435, 443, 453, 460, 469, 479, 485, 494, 
	499, 502, 505, 508, 512, 515, 516, 520, 
	523, 527
]

class << self
	attr_accessor :_rhaml_parser_indicies
	private :_rhaml_parser_indicies, :_rhaml_parser_indicies=
end
self._rhaml_parser_indicies = [
	0, 1, 2, 3, 1, 4, 4, 1, 
	5, 6, 7, 4, 4, 1, 5, 1, 
	8, 8, 1, 9, 10, 11, 9, 12, 
	12, 1, 9, 11, 9, 1, 11, 13, 
	14, 15, 11, 15, 15, 1, 17, 18, 
	16, 19, 20, 19, 1, 19, 19, 21, 
	21, 1, 22, 23, 24, 22, 25, 25, 
	1, 22, 24, 22, 1, 24, 26, 27, 
	15, 24, 15, 15, 1, 17, 29, 28, 
	30, 29, 28, 31, 17, 32, 29, 31, 
	28, 31, 17, 29, 31, 33, 33, 28, 
	34, 17, 35, 36, 29, 34, 37, 37, 
	28, 34, 17, 36, 29, 34, 28, 36, 
	38, 39, 29, 40, 36, 40, 40, 28, 
	42, 30, 43, 41, 45, 17, 46, 47, 
	45, 44, 17, 47, 44, 42, 47, 44, 
	45, 17, 47, 45, 48, 48, 44, 49, 
	17, 50, 51, 47, 49, 52, 52, 44, 
	49, 17, 51, 47, 49, 44, 51, 39, 
	53, 47, 54, 51, 54, 54, 44, 45, 
	17, 46, 47, 55, 45, 55, 55, 44, 
	17, 47, 52, 52, 44, 56, 56, 43, 
	41, 57, 42, 30, 58, 43, 57, 41, 
	57, 42, 30, 43, 57, 59, 59, 41, 
	60, 42, 30, 61, 62, 43, 60, 63, 
	63, 41, 60, 42, 30, 62, 43, 60, 
	41, 62, 64, 64, 43, 65, 62, 65, 
	65, 41, 57, 42, 30, 58, 43, 66, 
	57, 66, 66, 41, 42, 30, 43, 63, 
	63, 41, 31, 17, 32, 29, 67, 31, 
	67, 67, 28, 17, 29, 37, 37, 28, 
	19, 20, 68, 19, 68, 68, 1, 25, 
	25, 1, 69, 18, 16, 70, 17, 71, 
	18, 70, 16, 70, 17, 18, 70, 72, 
	72, 16, 73, 17, 74, 75, 18, 73, 
	76, 76, 16, 73, 17, 75, 18, 73, 
	16, 75, 77, 78, 18, 79, 75, 79, 
	79, 16, 42, 69, 81, 80, 82, 82, 
	81, 80, 83, 42, 69, 84, 81, 83, 
	80, 83, 42, 69, 81, 83, 85, 85, 
	80, 86, 42, 69, 87, 88, 81, 86, 
	89, 89, 80, 86, 42, 69, 88, 81, 
	86, 80, 88, 90, 91, 81, 92, 88, 
	92, 92, 80, 83, 42, 69, 84, 81, 
	93, 83, 93, 93, 80, 42, 69, 81, 
	89, 89, 80, 70, 17, 71, 18, 94, 
	70, 94, 94, 16, 17, 18, 76, 76, 
	16, 17, 96, 95, 97, 96, 95, 98, 
	17, 99, 96, 98, 95, 98, 17, 96, 
	98, 100, 100, 95, 101, 17, 102, 103, 
	96, 101, 104, 104, 95, 101, 17, 103, 
	96, 101, 95, 103, 105, 106, 96, 107, 
	103, 107, 107, 95, 97, 30, 109, 108, 
	110, 110, 109, 108, 111, 97, 30, 112, 
	109, 111, 108, 111, 97, 30, 109, 111, 
	113, 113, 108, 114, 97, 30, 115, 116, 
	109, 114, 117, 117, 108, 114, 97, 30, 
	116, 109, 114, 108, 116, 118, 90, 109, 
	119, 116, 119, 119, 108, 111, 97, 30, 
	112, 109, 120, 111, 120, 120, 108, 97, 
	30, 109, 117, 117, 108, 98, 17, 99, 
	96, 121, 98, 121, 121, 95, 17, 96, 
	104, 104, 95, 12, 12, 1, 2, 3, 
	1, 17, 47, 44, 42, 30, 43, 41, 
	17, 29, 28, 1, 42, 69, 81, 80, 
	17, 18, 16, 97, 30, 109, 108, 17, 
	96, 95, 0
]

class << self
	attr_accessor :_rhaml_parser_trans_targs
	private :_rhaml_parser_trans_targs, :_rhaml_parser_trans_targs=
end
self._rhaml_parser_trans_targs = [
	2, 0, 1, 3, 4, 81, 5, 3, 
	7, 8, 80, 9, 7, 10, 62, 43, 
	10, 11, 45, 12, 85, 13, 14, 44, 
	15, 13, 16, 25, 16, 17, 18, 19, 
	84, 20, 21, 42, 22, 20, 18, 23, 
	41, 23, 24, 33, 25, 27, 82, 26, 
	28, 29, 32, 30, 28, 24, 31, 31, 
	34, 35, 83, 36, 37, 40, 38, 36, 
	34, 39, 39, 41, 43, 46, 47, 87, 
	48, 49, 61, 50, 48, 18, 51, 60, 
	51, 52, 53, 54, 86, 55, 56, 59, 
	57, 55, 34, 53, 58, 58, 60, 62, 
	63, 64, 65, 89, 66, 67, 79, 68, 
	66, 69, 24, 78, 69, 70, 71, 72, 
	88, 73, 74, 77, 75, 73, 71, 76, 
	76, 78
]

class << self
	attr_accessor :_rhaml_parser_trans_actions
	private :_rhaml_parser_trans_actions, :_rhaml_parser_trans_actions=
end
self._rhaml_parser_trans_actions = [
	1, 0, 0, 3, 5, 0, 15, 5, 
	17, 0, 7, 0, 7, 29, 29, 23, 
	11, 11, 11, 0, 13, 17, 0, 7, 
	0, 7, 29, 29, 11, 11, 11, 11, 
	41, 44, 11, 20, 11, 20, 29, 29, 
	48, 11, 11, 11, 11, 11, 41, 11, 
	44, 11, 20, 11, 20, 29, 48, 26, 
	11, 11, 41, 44, 11, 20, 11, 20, 
	29, 48, 26, 26, 9, 11, 11, 41, 
	52, 11, 32, 11, 32, 38, 38, 56, 
	11, 11, 11, 11, 41, 52, 11, 32, 
	11, 32, 38, 38, 56, 35, 35, 11, 
	11, 11, 11, 41, 52, 11, 32, 11, 
	32, 38, 38, 56, 11, 11, 11, 11, 
	41, 52, 11, 32, 11, 32, 38, 56, 
	35, 35
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
# line 26 "lib/rhaml/parser.rl"
		begin

          #tag.attributes << Attribute.new
        		end
when 4 then
# line 30 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.name << data[fpc]
        		end
when 5 then
# line 34 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = Variable.new
        		end
when 6 then
# line 38 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value.name << data[fpc]
        		end
when 7 then
# line 42 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value = ""
        		end
when 8 then
# line 46 "lib/rhaml/parser.rl"
		begin

          #tag.attributes.last.value << data[fpc]
        		end
when 9 then
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
when 10 then
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
# line 501 "lib/rhaml/parser.rb"
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


      if cs != rhaml_parser_first_final
        raise ParseError.new("ParseError on #{linecol(text, p)}")
      end

      document.compile
    rescue => ex
      puts "#{ex.class}: #{ex.message}"
      puts "Position: #{linecol(text, p).join(":")}"
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
