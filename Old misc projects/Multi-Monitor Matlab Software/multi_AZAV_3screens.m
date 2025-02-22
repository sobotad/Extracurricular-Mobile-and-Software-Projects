clear all
%eval(['edit ',mfilename]);

%keyboard

clearAllMediaToolsInstances;
close all;
ListN= input('Enter List Set Number: ','s');
dBAZAV= input('Enter decibel level of sentences:');
dBnoise= input ('Enter dB level of background noise (SNR -10 would mean noise is 10dB louder than sentences):');
dBhere=dBAZAV;

%Calculate values for volume%%%
volAZAV= 10^((0.05026*dBAZAV)-3.588);
disp('volAZAV=');
disp(volAZAV);

volhere= 10^((0.05092*dBhere)-3.665);
disp('volhere=');
disp(volhere);

volnoise= 10^((0.04912*dBnoise)-3.536); %Lous restaurant calc 8/1/2016
disp('volnoise=');
disp(volnoise);




FigHandle = figure('units','pixels', 'Color', 'black','Position', [1920 80 5770 1080]);
set(FigHandle, 'menubar', 'none');
FigHandle2= figure('units','pixels','Position', [700 500 450 400]);

load (['AZAV3_set',ListN,'.mat']);
[mfile_path,name,ext] = fileparts(mfilename('fullpath'));

avfile_path = ['C:\Program Files\Sensimetrics\AVFiles\small\'];

wavfile_path = ['C:\Program Files\Sensimetrics\AVFiles\small\'];
OUTPUT_DEV= MediaToolsOutputDevices('ASIO');

% A1=readA([avfile_path,'sheshere_49.wav']);


Noise1 = mtplayer([avfile_path,'1_15_20_rev1-48000-02.wav'], OUTPUT_DEV);
Noise2 = mtplayer([avfile_path,'2_15_20_rev1-48000-02.wav'], OUTPUT_DEV);
Noise3 = mtplayer([avfile_path,'3_15_20_rev1-48000-02.wav'], OUTPUT_DEV);
Noise4 = mtplayer([avfile_path,'4_15_20_rev1-48000-02.wav'], OUTPUT_DEV);
Noise5 = mtplayer([avfile_path,'5_15_20_rev1-48000-02.wav'], OUTPUT_DEV);
Noise6 = mtplayer([avfile_path,'6_15_20_rev1-48000-02.wav'], OUTPUT_DEV);
Noise7 = mtplayer([avfile_path,'7_15_20_rev1-48000-02.wav'], OUTPUT_DEV);
Noise8 = mtplayer([avfile_path,'8_15_20_rev1-48000-02.wav'], OUTPUT_DEV);

Noise1.LoopAVSource = 'on';
Noise2.LoopAVSource = 'on';
Noise3.LoopAVSource = 'on';
Noise4.LoopAVSource = 'on';
Noise5.LoopAVSource = 'on';
Noise6.LoopAVSource = 'on';
Noise7.LoopAVSource = 'on';
Noise8.LoopAVSource = 'on';

%vol = 0; %to silence
Noise1.SourceToOutputAudioMixing = volnoise*[1 0 0 0 0 0 0 0 0 0 0 0];
Noise2.SourceToOutputAudioMixing = volnoise*[0 1 0 0 0 0 0 0 0 0 0 0];
Noise3.SourceToOutputAudioMixing = volnoise*[0 0 1 0 0 0 0 0 0 0 0 0];
Noise4.SourceToOutputAudioMixing = volnoise*[0 0 0 1 0 0 0 0 0 0 0 0];
Noise5.SourceToOutputAudioMixing = volnoise*[0 0 0 0 1 0 0 0 0 0 0 0];
Noise6.SourceToOutputAudioMixing = volnoise*[0 0 0 0 0 1 0 0 0 0 0 0];
Noise7.SourceToOutputAudioMixing = volnoise*[0 0 0 0 0 0 1 0 0 0 0 0];
Noise8.SourceToOutputAudioMixing = volnoise*[0 0 0 0 0 0 0 1 0 0 0 0];

play(Noise1);
play(Noise2);
play(Noise3);
play(Noise4);
play(Noise5);
play(Noise6);
play(Noise7);
play(Noise8);


i=1;
while i < 46
    
    

mtphere = mtplayer([avfile_path,'sheshere_49_down20dBgain.wav'], OUTPUT_DEV,'ParentFigureHandle',FigHandle,'DisplayPosition',[5200 1 10 10]);   
mtp1 = mtplayer([avfile_path,filenamelist{i,1}], OUTPUT_DEV,'ParentFigureHandle',FigHandle,'DisplayPosition',[0 1 1280 1024]);
mtp2 = mtplayer([avfile_path,filenamelist{i,2}], OUTPUT_DEV,'ParentFigureHandle',FigHandle,'DisplayPosition',[1281 1 1280 1024]);
mtp3 = mtplayer([avfile_path,filenamelist{i,3}], OUTPUT_DEV,'ParentFigureHandle',FigHandle,'DisplayPosition',[2561 1 1280 1024]);



mtp1.VideoDelayReAudioMsec = -500;
mtp2.VideoDelayReAudioMsec = -500;
mtp3.VideoDelayReAudioMsec = -500;


if filenamelist{i,5} == 1
 mtp1.EnableAudio = 'on';
 mtp2.EnableAudio = 'off';
 mtp3.EnableAudio = 'off';
 mtp4.EnableAudio = 'off';
 mtp1.SourceToOutputAudioMixing = [0 0 0 0 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 1 0 0 0 0 0];
 mtphere.SourceToOutputAudioMixing = [0 0 0 0 0 0 1 0 0 0 0 0];
elseif filenamelist{i,5} == 2
 mtp1.EnableAudio = 'off';
 mtp2.EnableAudio = 'on';
 mtp3.EnableAudio = 'off';
 mtp4.EnableAudio = 'off';
 mtp2.SourceToOutputAudioMixing = [0 0 0 0 0 0 0 0 0 0 0 0; 1 0 0 0 0 0 0 0 0 0 0 0];
 mtphere.SourceToOutputAudioMixing = [1 0 0 0 0 0 0 0 0 0 0 0];
elseif filenamelist{i,5} == 3
 mtp1.EnableAudio = 'off';
 mtp2.EnableAudio = 'off';
 mtp3.EnableAudio = 'on';
 mtp4.EnableAudio = 'off';
mtp3.SourceToOutputAudioMixing = [0 0 0 0 0 0 0 0 0 0 0 0; 0 0 1 0 0 0 0 0 0 0 0 0];
mtphere.SourceToOutputAudioMixing = [0 0 1 0 0 0 0 0 0 0 0 0];
end;


%  volAZAV = 0; %to silence
%  volhere = 0; %to silence
volhererove = volhere 
mtphere.SourceToOutputAudioMixing( mtphere.SourceToOutputAudioMixing~=0) = volhere;
mtp1.SourceToOutputAudioMixing(mtp1.SourceToOutputAudioMixing~=0) = volAZAV;
mtp2.SourceToOutputAudioMixing(mtp2.SourceToOutputAudioMixing~=0) = volAZAV;
mtp3.SourceToOutputAudioMixing(mtp3.SourceToOutputAudioMixing~=0) = volAZAV;

mtphere.PlaySpeed = 1;
mtp1.PlaySpeed = .9;
mtp2.PlaySpeed = .9;
mtp3.PlaySpeed = .9;

playblocking(mtphere);
pause(1);
play(mtp1);
play(mtp2);
play(mtp3);
pause(5);
delete(mtphere);
delete(mtp1);
delete(mtp2);
delete(mtp3);


 i=i+1;
 

 
end;

clearAllMediaToolsInstances;
close all;
