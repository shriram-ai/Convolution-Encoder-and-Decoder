function coded_seq = rsc_encoder(in_bits)

num_bits = length(in_bits);
% fprintf("Source bits: %s\n", num2str(in_bits));

% encoder specifications
k = 1; % number of input bits at a time
m = 2; % amount of memory at a time
n = 2; % number of outputs at a time
gen_matrix = zeros(n, m+k);
gen_matrix(1, :) = [1 1 1]; 
gen_matrix(2, :) = [1 0 1]; 
% feedback = [0 1 1]; % Specifying the feedback vector
feedback = gen_matrix(1, :);
memory_vector = zeros(1, m); % Intializing the memory vector

coded_matrix = zeros(num_bits, n);
coded_matrix(:, 1) = in_bits; % systematic encoder

for ii = 1:num_bits       % This loop iterates over all the inputs
    input_vector = [in_bits(ii), memory_vector];
    feedback_out = mod(sum(input_vector .* feedback), 2);
    input_vector = [feedback_out, memory_vector];
%     input_vector = [feedback_out, memory_vector];
   
    code_vector = mod(sum(input_vector .* gen_matrix(2:end, :), 2), 2);
    coded_matrix(ii, 2:end) = code_vector;
    coded_matrix(ii, :);
    memory_vector = [feedback_out, memory_vector(1:end-1)];
%     memory_vector = [xor(feedback_out, in_bits(ii+1)), memory_vector(1:end-1)];
end
coded_seq = reshape(coded_matrix', 1, []);
% fprintf("Coded stream of bits: %s\n", num2str(coded_seq));
end