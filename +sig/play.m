% SIG.PLAY
% plays the audio waveform.
% Syntax: sig.play(filename)
% sig.input(...,'Mix') sums the channels together.
% sig.input(...,'Center') centers the waveform.
% sig.input(...,'Sampling',r) resamples at rate r (in Hz).
% sig.input(...,'Extract',t1,t2,u) extracts the signal between dates
%   t1 and t2, expressed in the unit u.
%   Possible values for u:
%       's' (seconds, by default),
%       'sp' (sample index, starting from 1).
% sig.input(...,...,'Trim') trims the pseudo-silence beginning and end off
%   the audio file. Silent frames are frames with RMS below t times the
%   medium RMS of the whole audio file.
%   Default value: t = 0.06
%   instead of 'Trim':
%       'TrimStart' only trims the beginning of the audio file,
%       'TrimEnd' only trims the end.
% sig.input(...,'TrimThreshold',t) specifies the trimming threshold t.
% sig.input(...,'Frame',...) decomposes the waveform into successive
%   frames. However we advise to use 'Frame' directly with the operators
%   for which frame decomposition is actually used.
%
% Copyright (C) 2014, Olivier Lartillot
% All rights reserved.
% License: New BSD License. See full text of the license in LICENSE.txt in
% the main folder of the MiningSuite distribution.
function varargout = play(varargin)

if 0 %isa(varargin{1},'sig.Signal')
    varargout = varargin{1}.play(varargin{2:end});
    return
end

    ch.key = 'Channel';
    ch.type = 'Integer';
    ch.default = 0;
options.ch = ch;

    sg.key = 'Segment';
    sg.type = 'Integer';
    sg.default = 0;
options.sg = sg;

    se.key = 'Sequence';
    se.type = 'Integer';
    se.default = 0;
options.se = se;

    inc.key = 'Increasing';
    inc.type = 'MIRtb';
options.inc = inc;

    dec.key = 'Decreasing';
    dec.type = 'MIRtb';
options.dec = dec;

    every.key = 'Every';
    every.type = 'Integer';
options.every = every;

    burst.key = 'Burst';
    burst.type = 'Boolean';
    burst.default = 1;
options.burst = burst;


varargout = sig.operate('sig','play',options,@init,@main,varargin);


function [x type] = init(x,option,frame)
type = '?';


function out = main(x,option,postoption)
out = {x{1}.play(option)};