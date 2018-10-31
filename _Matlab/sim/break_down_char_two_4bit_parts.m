%returns a 2x N matrix, where N is the amount of characters
% and 1st row == upper 4 bits
% 2nd row == lower 4 bits
function symbol_matrix = break_down_char_two_4bit_parts(fullText)
   fullText_uint8 = uint8(fullText);
   % masks for bit selection
   high_4bit_mask = uint8(hex2dec('F0'));
   low_4bit_mask = uint8(hex2dec('0F'));
   
   for i=1:length(fullText)
       high_4bits = bitand(high_4bit_mask,fullText_uint8(i));
       high_4bits = bitsrl(high_4bits,4);
       low_4bits = bitand(low_4bit_mask,fullText_uint8(i));
       %high 4 bits on 1st row
       % low 4 bits on 2nd row
       % each column == a char ascii value
       symbol_matrix(:,i) = [ high_4bits ;...
                              low_4bits ];
                        
   end
end