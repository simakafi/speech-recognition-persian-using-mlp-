taqirat = 1024; % Size of one chunk of ferecans to be processed in one loop

% Here you create a System object to read from a specified audio file and
% set its output data type.
hfileIn = dsp.AudioFileReader(which('ketab3.wav'), ...
            'SamplesPerFrame', taqirat, ...
            'OutputDataType', 'double');


fileInfo = info(hfileIn);
Fs = fileInfo.SampleRate;
hfft = dsp.FFT;
hmean = dsp.Mean('RunningMean', true);
hmin  = dsp.Minimum('RunningMinimum', true);
hmax  = dsp.Maximum('RunningMaximum', true);
haudioOut = dsp.AudioPlayer('SampleRate', Fs, ...
                            'QueueDuration', 1.2);


% Initialize figures for plotting
s = hfigsstats(taqirat, Fs);
while ~isDone(hfileIn)
    % Audio input from file
    sig = step(hfileIn);

    % Compute FFT of the input audio data
    fftoutput = step(hfft, sig);
    fftoutput = fftoutput(1:512); % Store for plotting

    % The hmean System object keeps track of the information about past
    % samples and gives you the mean value reached until now. The same is
    % true for hmin and hmax System objects.
    meanval = step(hmean, sig);
    minimum = step(hmin, sig);
    maximum = step(hmax, sig);
if 0==1
    taqirat = 1024; % Size of one chunk of signal to be processed in one loop

% Here you create a System object to read from a specified audio file and
% set its output data type.
hfileIn = dsp.AudioFileReader(which('3.wav'), ...
            'SamplesPerFrame', taqirat, ...
            'OutputDataType', 'double');


fileInfo = info(hfileIn);
Fs = fileInfo.SampleRate;
hfft = dsp.FFT;
hmean = dsp.Mean('RunningMean', true);
hmin  = dsp.Minimum('RunningMinimum', true);
hmax  = dsp.Maximum('RunningMaximum', true);
haudioOut = dsp.AudioPlayer('SampleRate', Fs, ...
                            'QueueDuration', 1.2);


% Initialize figures for plotting
s = hfigsstats(taqirat, Fs);
while ~isDone(hfileIn)
    % Audio input from file
    sig = step(hfileIn);

    % Compute FFT of the input audio data
    fftoutput = step(hfft, sig);
    fftoutput = fftoutput(1:512); % Store for plotting

    % The hmean System object keeps track of the information about past
    % samples and gives you the mean value reached until now. The same is
    % true for hmin and hmax System objects.
    meanval = step(hmean, sig);
    minimum = step(hmin, sig);
    maximum = step(hmax, sig);

    % Play output audio
    step(haudioOut, sig);

    % Plot the data you have processed
    s = plotstatsdata(s, minimum, maximum, sig.', meanval, fftoutput);
end
pause(haudioOut.QueueDuration); % Wait for audio to finish
   % The hmean System object keeps track of the information about past
    % samples and gives you the mean value reached until now. The same is
    % true for hmin and hmax System objects.
    meanval = step(hmean, sig);
    minimum = step(hmin, sig);
    maximum = step(hmax, sig);

    % Play output audio
    step(haudioOut, sig);

    % Plot the data you have processed
    s = plotstatsdata(s, minimum, maximum, sig.', meanval, fftoutput);
       % The hmean System object keeps track of the information about past
    % samples and gives you the mean value reached until now. The same is
    % true for hmin and hmax System objects.
    meanval = step(hmean, sig);
    minimum = step(hmin, sig);
    maximum = step(hmax, sig);

    % Play output audio
    step(haudioOut, sig);

    % Plot the data you have processed
    s = plotstatsdata(s, minimum, maximum, sig.', meanval, fftoutput);
end
    % Play output audio
    step(haudioOut, sig);

    % Plot the data you have processed
    s = plotstatsdata(s, minimum, maximum, sig.', meanval, fftoutput);
end
pause(haudioOut.QueueDuration); % Wait for audio to finish
clc
