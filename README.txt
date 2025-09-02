
MATLAB-based worm tracking software, optimized for MATLAB 2024b

Make sure that you have the Matlab image processing and statistics toolboxes installed. 

Launch matlab.

cd to where-ever you put the code. I STRONGLY recommend against using spaces in directories or filenames. 

Edit MultiWormTracker_setup.m:
      edit line 8 MultiWormTracker_CODE_PATH to where you put the source code directory

Using Windows, copy the contents of put_into_C_windows_system32\pdftk.exe to C:\Windows\System32

Run MultiWormTracker_setup in matlab each time you want to use the code: 

>> MultiWormTracker_setup 

You will need to temporarily remove any other non-core matlab paths using the Set Path menu in the toolbar (set to Default, then Close)
This is necessary to avoid conflicts between function names, etc. 
This will temporarily set the program path to the MultiWormTracker_CODE_PATH 
These changes are NOT saved; you will need to run MultiWormTracker_setup each time unless you manually save the path. However, you will not need to edit MultiWormTracker_setup.m again. 


To track, cd to the directory containing your movies, or the directory just above.

Usage: MultiWormTracker(argument1, other_arguments)
argument1 can be:
     a movie filename,
     a directory of movies,
     a cell array of movie filenames,
     a cell array of directory filenames,
     or a text file listing directories of movies
If you have a second movie my_scale_movie.avi with a object of known length, include 'scale','my_scale_movie.avi' as an argument 
If you have a stimulus file my_stimulus.txt, include 'stimulus','my_stimulus.txt' as an argument 
If your framerate is NOT 3 Hz, include 'framerate', your_framerate_in_Hz as an argument 
If number of worms <20 or >30, then you might include 'numworms',#worms as an  argument (optional)
If you believe collisions between worms is unlikely, include 'no_collisions' as an argument (optional)

Ideally your movie (an avi file of some sort ... it works well with XVID mpeg-4) will contain some object whose dimensions are known to set the scale. 

If the argument is a directory of movies, the program will automatically try to detect the ring and worms for all the movies. It will then ask for user
assitance with problematic movies. It will then track all the movies and automatically average them.  

By default, it will look for a 28mm x 28mm frame (the copper ring). 
If it cannot find it, a GUI will pop up. 

If you draw a circle somewhere using a standard 6mm diameter holepunch, it can use that as well (include the 'holepunch' option). 

Instead of drawing on your plate of interest, you can take a short movie (10 frames) of some object whose dimensions are known, and 
include that as the scale argument. 
For example:
>> MultiWormTracker('mymovie.avi','scale','my_scale_movie.avi');
>> MultiWormTracker('mymovie.avi','holepunch','scale','my_scale_holepunch_movie.avi');

If you have a stimulus program my_stimulus.txt that has 10 sec and 20 sec blue light pulses separated by 100 sec, for example:
    off 100 sec
    on 10 sec blue
    off 100 sec
    on 20 sec blue
    off 100 sec
you may include that as an argument
>> MultiWormTracker('mymovie.avi','stimulus','my_stimulus.txt');



The data for each track are stored in rawTracks.mat, Tracks.mat (processed tracks), and linkedTracks.mat (track segments with closed gaps). 
Track files may be loaded with:
	myTrack_variable = load_Tracks('prefix.linkedTracks.mat')
BinData.mat contains the binned and averaged data, and may be loaded with:
	my_binned_data_variable = load_BinData('prefix.BinData.mat')
The relevant txt files contain the data from BinData.mat in a tab-delimited format which can be opened in Excel or with any text editor.

WormPlayer('mymovie.linkedTracks.mat') will launch a viewer. Play around with it. Zoom in and out. 
It may or may not be useful to you. It is admittedly a bit clunky ...

Copper Rings:
	Punch a 28mm x 28mm hole in Whatmann 3MM paper ( http://www.acherryontop.com/shop/cat/punches/184898 ) 
	Trim a frame.
	Briefly soak the frame in 20mM CuCl2 and place on an NGM plate. 
	Add the worms. 
	Position the plate such that the outer edge of the ring is just outside the field of view. 
	See the demo_movie for an example.
	Record at 3Hz with at least 512x512 resolution (at least 20 pixels per animal).

For lawn leaving:
	For experimental details, see Bendesky et al 2011
	See the included movie hw_1.avi for an example. The drawn circle was made using a standard 6mm diameter 
		holepunch hole as a stensil. 
	Movies should be saved as xvid mpeg-4 avi files
	leaving_events_per_min_on_lawn = lawn_leaving_analysis(Moviename, framerate, timerbox_flag);
	Returns the mean lawn leaving events per worm minute on the lawn in leaving_events_per_min_on_lawn 
	If your movie has a timerbox in the corner, set timerbox_flag to 1, else ignore it.
	For example: (no timer, 1 frames/sec)
		>> leaving_events_per_min_on_lawn  = lawn_leaving_analysis('mymovie.avi',1)
	For example: (timer box present, 1 frames/sec)	
		>> leaving_events_per_min_on_lawn  = lawn_leaving_analysis('mymovie.avi',1,'timerbox')
	If the program has a hard time finding the lawn edge or worms, the GUI will ask for your help.




To track, cd to the directory containing your movies, or the directory just above.

Usage: MultiWormTracker(argument1, other_arguments)
argument1 can be:
     a movie filename,
     a directory of movies,
     a cell array of movie filenames,
     a cell array of directory filenames,
     or a text file listing directories of movies
If you have a second movie my_scale_movie.avi with a object of known length, include 'scale','my_scale_movie.avi' as an argument 
If you have a stimulus file my_stimulus.txt, include 'stimulus','my_stimulus.txt' as an argument 
If your framerate is NOT 3 Hz, include 'framerate', your_framerate_in_Hz as an argument 
If number of worms <20 or >30, then you might include 'numworms',#worms as an  argument (optional)
If you believe collisions between worms is unlikely, include 'no_collisions' as an argument (optional)

Ideally your movie (an avi file of some sort ... it works well with mpeg-4) will contain some object whose dimensions are known to set the scale. 

If the argument is a directory of movies, the program will automatically try to detect the ring and worms for all the movies. It will then ask for user
assitance with problematic movies. It will then track all the movies and automatically average them.  

By default, it will look for a 28mm x 28mm frame (the copper ring). 
	Punch a 28mm x 28mm hole in Whatmann 3MM paper ( http://www.acherryontop.com/shop/cat/punches/184898 ) 
	Trim a frame.
	Briefly soak the frame in 20mM CuCl2 and place on the plate. 
	Add the worms. 
	Position the plate such that the outer edge of the ring is just outside the field of view. 
	Record at 3Hz with at least 512x512 resolution (at least 20 pixels per animal).
If it cannot find a ring, a GUI will pop up. 

If you draw a circle somewhere using a standard 6mm diameter holepunch, it can use that as well (include the 'holepunch' option). 

Instead of drawing on your plate of interest, you can take a short movie (10 frames) of some object whose dimensions are known, and 
include that as the scale argument. 
For example:
>> MultiWormTracker('mymovie.avi','scale','my_scale_movie.avi');
>> MultiWormTracker('mymovie.avi','holepunch','scale','my_scale_holepunch_movie.avi');

To analyze a movie recorded at 5 Hz, with a scale movie: 
>> MultiWormTracker('mymovie.avi','scale','my_scale_movie.avi','framerate',5); 

To analyze a movie with only 10 animals:
>> MultiWormTracker('my_movie.avi', 'numworms', 10)  

If you have a stimulus program my_stimulus.txt that has 10 sec and 20 sec blue light pulses separated by 100 sec, for example:
    off 100 sec
    on 10 sec blue
    off 100 sec
    on 20 sec blue
    off 100 sec
you may include that as an argument
>> MultiWormTracker('mymovie.avi','stimulus','my_stimulus.txt');

The data for each track are stored in rawTracks.mat, Tracks.mat (processed tracks), and linkedTracks.mat (track segments with closed gaps). 
Track files may be loaded with:
	myTrack_variable = load_Tracks('prefix.linkedTracks.mat')
The myTrack_variable is an structure array of tracks, where each element is a single continuous track. 
The fields in the Track structure are: 
    Frames % actual frame from the start of the video 
    Time   % time in seconds from the start of the video 
    Size   % instantaneous area of the worm being tracked, in pixels 
    Eccentricity  % instantaneous eccentricity of the elipse that circumscribes the worm; straight --> 1, circle --> 0 
    MajorAxes % Major axis of the the elipse that circumscribes the worm
    RingDistance % instantaneous distance of the animal from the copper ring (if it is there)
    Image % binary image of the animal within the bounding box that circumscribes the worm
    bound_box_corner % x,y coordinates of the upper-left corner of the bounding box
    body_contour % structure array with x,y coordinates of the animal's midline and curvature along the the A-P axis
    NumFrames % total number of frames in this track
    numActiveFrames % number of frames in this track not censored due to ring-induced pirouettes or 
    Height % Height of the frame in pixels
    Width  % Width of the frame in pixels
    PixelSize % mm/pixel
    FrameRate % in Hz
    Name  % the name of the movie file
    SmoothX % X-coordinates of track; smoothened with a sliding window of 1 sec
    SmoothY % Y-coordinates of track; smoothened with a sliding window of 1 sec
    Direction % current heading of the animal's path; 0 deg = up the screen
    Speed % instantaneous speed of the animal in mm/sec 
    original_track_indicies % indicies of the original rawTracks that were linked 
    Wormlength % length of the animal in mm
    AngSpeed % instantaneous angular speed of the animal in deg/sec 
    Reorientations % structure array describing each reorientation event (reversal, turn, omega, and combinations) reversal length, change in direction, eccentricity of the turn, etc
    State % instantaneous behavioral state code; num_state_convert can translate into English
    body_angle % instantaneous angle between the head, neck, and tail
    head_angle % instantaneous angle between the head, neck, and midbody
    tail_angle % instantaneous angle between the tail, lumbar point, and mid-body
    midbody_angle % instantaneous angle between the neck, midbody, and lumbar point
    curvature_vs_body_position_matrix % matrix for producing body curvature kymographs; rows are body segments, A --> P, columns are frames
    Curvature % path curvature in deg/mm
    mvt_init % indicates if a behavior was initiated at that frame
    stimulus_vector % indicates whether a stimulus is present at that frame

A number of functions in Track_analysis and Track_tools may be useful for extracting data from Tracks. Some of the more useful ones include:
    num_state_convert % convert a numerical behavior state code into English
    find_Track % find Tracks and frames that meet the requested behavior criteria
    
BinData.mat contains the binned and averaged data, and may be loaded with:
	my_binned_data_variable = load_BinData('prefix.BinData.mat')
The relevant txt files contain the data from BinData.mat in a tab-delimited format which can be opened in Excel or with any text editor.

The my_binned_data_variable is an structure which has arrays of behavioral parameters from tracks averaged in bins.
Instantaneous values such as speed and fraction of animals in a given behavioral state are binned with a 1 sec window. The times are in the "time" field. The number of animals being averaged for each bin are in the "n" field.
Event initiation frequencies are binned with a 10 sec window. The times are in the "freqtime" field. The number of animals being averaged for each bin are in the "n_freq" field.

There are also fields for standard deviation "_s" and standard error "_err" 
For example, the "my_binned_data_variable.speed" array will have the average speed for every second of the movie.
"my_binned_data_variable.speed_s" is the standard deviation of the speed for every second of the movie.
"my_binned_data_variable.speed_err" is the standard error of the speed for every second of the movie.

The behavior fields in BinData all include fields for the frequency of initiating that behavior, and the fraction of animals currently in that behavioral state.
For example, "sRevOmega" refers to short reversals coupled to an omega turn. 
"sRevOmega_freq" is the frequency of initiating sRevOmega events (10 sec bin) 
"frac_sRevOmega" is the fraction of animals currently in a sRevOmega state (1 sec bin). 
    Rev % all reversals
    sRev % all short reversals
    lRev % all long reversals
    omegaUpsilon % all turns
    upsilon % all upsilon turns
    omega % all omega turns
    pure_Rev %  reversals not immediately followed by a turn
    pure_sRev %  short reversals not immediately followed by a turn
    pure_lRev %  long reversals not immediately followed by a turn
    pure_omegaUpsilon % all turns not immediately preeceded by a reversal
    pure_upsilon % upsilon turns not immediately preeceded by a reversal
    pure_omega % omega turns not immediately preeceded by a reversal
    RevOmega %  reversals immediately followed by an omega
    RevOmegaUpsilon %  reversals immediately followed by turn
    lRevOmega %  long reversals immediately followed by an omega
    lRevUpsilon %  long reversals immediately followed by an upsilon
    sRevOmega %  short reversals immediately followed by an omega
    sRevUpsilon %  short reversals immediately followed by an upsilon
    pause % stop moving

Instantaneous behavior parameters are averaged over 1 sec bins:
    speed % averaged over animals in a forward motion state in mm/sec
    angspeed % angular speed in deg/sec 
    curv % track path curvature in deg/mm averaged over animals in a forward motion state 
    ecc % average eccentricity averaged over animals in a forward motion state 
    body_angle % average body angle in degrees averaged over animals in a forward motion state 
    head_angle % average head angle in degrees  averaged over animals in a forward motion state 
    tail_angle % average tail angle in degrees  averaged over animals in a forward motion state 
    revlength % average reversal length in terms of the length of the reversing animal's body
    revlength_bodybends % average length of reversals in bodybends
    revSpeed % average speed of reversing animals
    delta_dir_rev % average change in direction of animals following a reversal
    ecc_omegaupsilon % average minimal eccentricity of animals in a turn state
    delta_dir_omegaupsilon % average change in direction of animals following a turn

There are five behavior states: forward (F), reverse (R), pause (P), omega turn (O), upsilson turn (U). 
Probabilities for transitioning from each state to each of the other states are calculated and binned every second. For example:
    P_F_to_R % probability for an animal in a forward state transitioning to a reversal state

A number of functions in Bin_analysis may be useful for extracting data from BinData. Some of the more useful ones include:
    segment_statistics % extracts BinData values and statistics for a given field and time window
    BinData_to_matrix % converts the requested fields fieldnames in BinData to a matrix; useful for PCA analysis
    alternate_binwidth_BinData % rebin the BinData with user-defined bin widths
    extract_BinData % trim the BinData to a defined window of time
    
For lawn leaving:
	For experimental details, see Bendesky et al 2011
	Draw a circle over the lawn using a standard 6mm diameter holepunch hole as a stensil. 
	leaving_events_per_min_on_lawn = lawn_leaving_analysis(Moviename, framerate, timerbox_flag);
	Returns the mean lawn leaving events per worm minute on the lawn in leaving_events_per_min_on_lawn 
	If the program has a hard time finding the lawn edge or worms, the GUI will ask for your help.

WormPlayer('mymovie.linkedTracks.mat') will launch a viewer for playing individual worm tracks overlaid on the movie

There are lots of other functions and programs hidden in the package .... I need to document them all someday!

For additional details and remarks, please see 
Pokala and Flavell "Recording and quantifying C. elegans behavior" in the
"C. elegans Methods and Applications" volume of "Methods in Molecular Biology"

If you have any questions or problems, please let me know ...
I have found that anytime someone else uses my software, it fails in a novel manner!! 
This version has been tested on R2024b but should work on later versions. 
There are many additional functions for analyzing and displaying Tracks and binned data I haven't had a chance to properly document ... 
Feel free to drop me an email to see whether a function to do what you want already exists or is a few edits away from existing ...
Navin Pokala
navin (dot) pokala (at) nyit (dot) edu


