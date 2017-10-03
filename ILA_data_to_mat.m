% First, convert ILA data column to column of integers
hex_data = cell2mat(ILA_Import);

% Initialize the holding variables
I_data = zeros(1,128);
Q_data = zeros(1,128);

% Assign the I/Q data vectors to values
I_data(1:2:end) = hex2dec(hex_data(:,1:4));
I_data(2:2:end) = hex2dec(hex_data(:,9:12));

% Scale and produce the 16,15 signed fixed-point int, that still needs to be converted to matlab fp 
I_data_scaled = (I_data - (2^15 - 1));
I_data_fp = I_data_scaled/max(abs(I_data_scaled));