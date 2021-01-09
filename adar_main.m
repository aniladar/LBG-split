%% Loading Phase
%First, let's upload an audio file to the workspace via load_audio function.
x=load_audio;
%Then, convert the audio file to the binary sequences.(N x 16)
binary_out = aud2bin(x);
%% Training
k = 16;                         % number of centroids required
D=binary_out;
[X,ESQ,J]=v_kmeanlbg(D,k);