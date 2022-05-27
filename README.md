# Convolution-Encoder-and-Decoder
*Implementation of Recursive Systematic Convolutional Encoder and decoding the encoded bits using Viterbi Algorithm in MATLAB*

This is a course project developed by 5 students of Indian Institute of Space Science and Technology, Thiruvananthapuram.

The MATLAB codes include a Recursive Systematic Convolutional (RSC) Encoder, its decoder and some extra elements for testing and analysing its performance. The RSC code used here is 1 input + 2 memory with a 1/2 bit rate. 

Though we have not generalised the encoder and decoder, you can easily change the encoder code and use your own state space diagram to build a decoder from it. For more help with this you can always contact **murtazahamid515253@gmail.com** or **tgshriram@outlook.com**, and we would be happy to help you out in using the codes for your projects.

The program **rand_flip.m** choses a fraction of the total number of bits and flips that many bits randomly. 
Note: This is not the same as Bit Error Rate because we wanted to have a random and probabilistic approach to bit flipping.

The function **test.m** can be used to check the performance of the code for some flip rate , while **blah.m** runs multiple iterations to get a final plot. 
