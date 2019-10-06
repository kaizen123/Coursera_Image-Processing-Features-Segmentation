function outchannel = colortransfer(schannel,tchannel)
%compute mean value of source channel
ms = mean(schannel(:));
%compute mean value of target channel
mt = mean(tchannel(:));
%compute normalized standard deviation of source channel 
ns = std(schannel(:));
%compute normalized standard deviation of target channel
nt = std(tchannel(:));
% perform color transfer and obtain output channel
outchannel = ((schannel-ms)*(nt/ns))+mt;

