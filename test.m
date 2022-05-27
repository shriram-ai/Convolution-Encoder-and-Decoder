% close all; clear; clc;
function [ber_usual, ber_convo]= test(flip_rate)
numbits = 1e6;
in_bits = randi([0 1], 1, numbits);

% encoding
out_bits_convo = rsc_encoder(in_bits);

% noise effect
% flip_rate = 0.005;
out_bits_convo_noise = random_flip(out_bits_convo, flip_rate);
out_bits_usual_noise = random_flip(in_bits, flip_rate);

% decoding
est_bits_convo = viterbi_decoder(out_bits_convo_noise);
added_noise_to_convo = sum(out_bits_convo_noise ~= out_bits_convo)/(2*numbits);

ber_convo = 100*sum(est_bits_convo ~= in_bits)/numbits;
ber_usual = 100*sum(out_bits_usual_noise ~= in_bits)/numbits;
end