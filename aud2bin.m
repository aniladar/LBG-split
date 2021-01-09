% Multimedia Coding
% 
% 
% AudioToBinary.m : converting audio signals into binary sequence

function bin_out = aud2bin(x)
bin_out = dec2bin( typecast( single(x(:)), 'uint16'), 16 ) - '0';
end
