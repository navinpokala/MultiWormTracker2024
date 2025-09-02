function MultiWormTracker_setup

global SCOPE_NUMBER;
if(isempty(SCOPE_NUMBER))
    SCOPE_NUMBER = [];
end

MultiWormTracker_CODE_PATH = 'D:\Dropbox\software\MultiWormTracker2024';

done_flag = questdlg('Go to Set Path menu in toolbar and set path to Default, then Close',sprintf('Done?'), 'Yes','No','Yes');
if(done_flag(1) == 'Y')
    addpath(genpath(MultiWormTracker_CODE_PATH));
end

return;
end

