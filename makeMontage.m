function makeMontage(fname, nDisplay)
% makeMontage - make a montage from data in a file 
%
%  specify a filename 
%  specify nDisplay (how many slices to display from start to end)
%
%   makeMontage('~/data/subject-C/mprage.nii.gz', 20)
%
% ds 2020-03-06 - in class

% load image
data = niftiread(fname);

% robustRange
robustRange = prctile(data(:), [5, 95]);

% permute step (to make sure images display a bit nicer)
% TODO: choice for permutation works for anatomy images from this class,
% .     but would be nice to have a more generic solution that ALWAYS
%       works.
dataP = permute( data, [2, 1, 3]);

% figure out indices
nSlices = size(dataP,3);
idx = round( linspace(1, nSlices, nDisplay) ); % nice numbers, integers

% make montage with the matlab command
montage(dataP, 'Indices', idx, 'DisplayRange', robustRange );

end