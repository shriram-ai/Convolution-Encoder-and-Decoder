function out_bits = random_flip(in_bits, flip_chance)
len_bits = length(in_bits);
% flip_perc = 0.2;
flip_indices = randi([1, len_bits], 1, floor(flip_chance*len_bits));
out_bits = in_bits;
for ii = flip_indices
    out_bits(ii) = not(out_bits(ii));
end
sum(out_bits ~= in_bits);
end