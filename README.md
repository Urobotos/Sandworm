
# <h2>Sandworm 3D printer - Klipper macros: <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (by Urobotos Project) </h2>
# <h3>In macros I use my modified mainsail.cfg file called mainsail_custom.cfg </h3>
(the redirected incude is included in the printer.cfg file, no need edit)<br>
The modifications include:<br>

1. The fan (part cooling) turns off during PAUSE, and then resumes to its previous print speed during RESUME.<br>
Benefits: Fan will not spin unnecessarily during the pause, which can take longer with Filament Runout.<br>

2. The second added modification is the <point_unretract> macro, this is the last code sent when printing is RESUMED (after PAUSE). <br>
This is the coordinate point of the tool head on the print object when printing was paused and serves for <br>
a small filling of the nozzle directly at the point when continuation of printing.<br>
Benefit: No more empty layers on printed parts after a pause.
					  
#  <h3>PrusaSlicer START and END gcodes: </h3>
In PrusaSlicer, insert these codes below into the Start gcodes and End gcodes sections:

<b> Start gcodes:</b><br>
SET_PRINT_STATS_INFO TOTAL_LAYER=[total_layer_count] <br>
CLEAR_PAUSE <br>
BED_MESH_CLEAR <br>
start_gcode BED_TMP=[first_layer_bed_temperature] EXT_TMP=[first_layer_temperature] CHAMBER_TMP=[chamber_temperature] CHAMBER_MIN_TMP=[chamber_minimal_temperature] <br>

<b> End gcodes:</b><br>
end_gcode

# <h3>Mainsail and macro Buttons:</h3>
(find the macro names below in the list of available macros and add them to the main page as buttons).<br>
(In Mainsail main page choose: Interface settings --> Macros --> Add Group).<br>

<b> Movement: (adjusted to: not displayed when pinting) </b><br>
Temp_homong <br>
E Stepper off <br>
Park_toolhaead <br>

<b> Filament: (not displayed when pinting, only on Pause and Printer Ready state) </b><br>
Filament load <br>
Filament unload <br>
M600 <br>
Noozle Clean  &nbsp;&nbsp;&nbsp; # (via brush) <br>
E stepper off <br>

<b> Chamber Lights (always on) </b><br>
Lights on off  &nbsp;&nbsp; &nbsp;&nbsp; # (toogle button - ON or OFF, its depends on previous Lights state) <br>
Lights max     &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;# (lights on maximum brithness) <br>

<b> Calibration: (not displayed when pinting and Pause) </b><br>
Z Endstop calibrate 01 <br>
Probe calibrate 02 <br>
Z tilt adjust 03 <br>
Bed mesh calibrate 04 <br>

<b> Adjust print: (displayed only when pinting) </b><br>
set pause at layer <br>
set pause next layer <br>
Activate power off <br>
Deactivate power off

# <h3>Information about Proximity inductive probe SN-04 PNP and initial Z homing:</h3>
For the initial Z home (after starting the printer), it is recommended to preheat the nozzle, <br>
due to filament leakage from the Volcano nozzle after the previous print. <br>
Longer sticking filament does not cause much of a problem, it will bend on the SN-04 probe, <br>
but short and hard could cause a shock displacement of the probe. <br>

Solution: It is not required to go to the printer to manually clean the nozzle, <br>
just preheat the nozzle remotely and start Z homing, after which the filament will <br>
remain bent and the next Z homing can be performed normally. <br>

<b> Buil-in macros: </b><br>
The printer handles this situation with a built-in automatic G28 XYZ macro <b>Temp_Homing</b>, <br>
which preheats the nozzle (a little) and then performs Z homing. The macro is implemented in: <br>

- Start Gcodes <br>
- Noozle Clean (via brush, only when axis is not homed) <br>
- And in the last row, <b>Temp_Homing</b> will appear as a clickable macro in the Mainsail console every time the printer is started.

# <h3> Language change:</h3>
The current language version can be changed in the menu on the LCD display: <br>
Click on knob for Menu --> Setup --> Language --> and choice: <br>

English, Cestina or Deutch <br>

<b>Or run one of the macros below: </b><br>
- <b>For English: </b><br>
  SET_MENU_LANGUAGE LANGUAGE=1
- <b>For Czech: </b><br>
  SET_MENU_LANGUAGE LANGUAGE=2
- <b>For Deutch </b><br>
  SET_MENU_LANGUAGE LANGUAGE=3

# <h3>Manual for remotely control printer power ON and OFF via Relay:</h3>
(The original code and setup instructions can be found at: https://github.com/tinntbg/auto-power-off-klipper ) <br>

For remote control power ON/OFF by Relay it is need add somewhere to <b>moonraker.conf</b> file codes below: <br>

[power printer] <br>
type: gpio <br>
pin: gpiochip0/gpio72  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # can be revesed by "!" , BTT-PI GPIO pin PC8 <br>
initial_state: off  <br>
off_when_shutdown: True  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Turning off when a shutdown/error occurs <br>
locked_while_printing: True  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Preventing you from turning it off during a print <br>
on_when_job_queued: True &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;# Toggling the power On when you send a file from the slicer to print <br>
restart_klipper_when_powered: True <br>
restart_delay: 1 <br>
bound_service: klipper &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Making sure the Klipper service is started/restarted with the toggle <br>


<hr>
<b>Now you have everything ready</b>, copy and paste all .cfg files (from here) into your directory: (overwrite printer.cfg file):<br> 
home\biqu\printer_data\config\ <br><br>

And restart your printer for the first <b>Sandworm</b> launch...

<hr>



>                                                                                                 ,                                                                                                   
>                                                                                       (%(.      //(&(      ,/(*                                                                                     
>                                                                                       .#(((&,   .(////&.  .((//((                                                                                   
>                                                                                        *%/(((#%. ,#/((/,%, (&#//**                                                                                  
>                                                                                         *#/((((%&,(/(((//#%.&#/((/(.                                                                                
>                                                                                          ((###((#(((((/(//%((%(##(/#                                                                               
>                                                                                    .,(((/((((///((((/(/(/(///(((#%#%%                                                                               
>                                                    .#(.                     .,/##(/(((//(#(#%#(((##(/,,/(/(///(/((///(&&(*                                                                          
>                                                   /##////(((((((*/(/////(((((///(////(////(%@%**&@//%#((////////((((##%(((/(%%*.                                                                    
>                                                      .%######(####(//(//////((/////////(/,*@#,,*,,#@&((((((#////((//##/((/&((#%#/(%/.                                                              
>                                                        (&#/,/,,*,,,,,,,,,,,,,,,,,,*(#/#&(*#/#(###(/(##///*/##//((((((/(((/((/((((((((#/((/,.                                                       
>                                                     ,(%@&#/##&&&%#(**/,,,,,,,,,,,,,,,,,(%/#*/&#((##((((///((//(/(((%///(/((/(((/(/*#/((/(/(#/(##,                                                   
>                                              ./(#(((((#&(((&#(#%((%/%%&#%#(##%@&&&%#(//*(/*/#@&%/,,,**/(#///#(///(##%#(/((((((#((((/%/(///,((((((/%(/.                                              
>                                         .#&%(((((((/,((/((#(,(&#&(#(#%%%#%/(/(&&/(&#(//(#(#%%(/*(#@%#///((/*/(//,%(/(**###&%#(,#***(#(%#/(((((((((/(//#%%#.                                         
>                                      *%&%%%##&#((((%(#&%#(###%%****,/&#*,/(#((&&%((#(@&&%&##/*/(#&%(#&%&&&#*(%%*,,,,*(#((,,*(%(/%#%%//(((&(/((((&//((/(&*((%@#,                                     
>                                   .%@#&((((((/#((%&((##(/,,,#&*,,#&(,,,,,(&&((#(/(///@#&##&#&#&@%#(&@&*/(&&&#(*,,,,,,/#,,,,/(,,,,,(##&%##(((###/((/(((((/(#//(#&&*                                  
>                                 *&(/((((((/#&##%#&&%%(&/*(&&&#*,,,&%##%&%%@%(**,,*,,,,,,,,,,,,,,,,,,,/,,,*((*(/,,*,,,,,*,,,,*,,,*,,,,,*#%#%%((&/(//(%((((/%&/((((#@&/                               
>                              /&%#&%#&((&&####%&%/,*#&%%%&*,,,,*#&&&#/&&&((**,***(,,,,,,,,,,,,,*%/(%&(@%&&&&&&&%((@&%*,*,,,,(,,,,*,,,,((#,*/*/(#(#&&%(###%%#(#(((//&((%&,                            
>                           ,%((((/#((((#(((#&%#/*,,/#(,,,,%%%(.              .*&%(&&&%#%%((@(%&%&&(//,               ,//#%&@&#(/,*/,,,,*,,,,//,,,,,//#&&%(%/((////(//#%((%#,                         
>                         #%(#&#%&((#((((&&&&%/*,,,,##&##*#.                       ./#&(%&&((%&&&*.                             *#%&(##%(,,,,*,,(#*,,,,/&#&#(((*/@#/((/#%///(&&/                      
>                      .%##(/(//#((#@((#&%%%&//(((#(#(%%,                                                                               ,(@%/*,,,,,,*,,,*(&%%#&(*(((#####%/((/#&%#                    
>                    .%&&%#(((/%*##//%&&&##&#/,,(%**%,                                                                                     ,#&(,*,,,,**(,,*/,/&&#/((((((((/&/(#*/#&%.                 
>                   #&#(((%/##(#((((&&%%#&#(/*&##&/                                                                                            .&&/,,,,/*,,,(/,*/#&%/((*//(//(//%//#&#                
>                 *%(((((&/((((((/*&(//*(%,/(//&/                                                                                                 ,&&///,**/&(*//#/,*%&/%#/((**/#/((*%&/              
>                #(&####(((((#%%&&#,,,,#/##*/&*                                                                                                      ,%(//(&/*//**,*,,#&%/(((*/(//(%&((%&.            
>              /#((##((((((#%/(%%#(%%%&&*,,/(                                                                                                          .*&(/*,*&(,,,,,,((%%(*%%///(/##/(#@#           
>             ####%&*((*#/%(((&#%*%#//&///#.                                                                                                              /&##*//*,,,,,,,/&&%(/#%((#&((((/#&.         
>           .#(#(/(,(#%##(#&%&%&&&%%%&#(%#                                                                                                                  (%*,,,*/,,*,,*&/(%((/%*/(/(%((%/%%        
>          /(#(((((((/(((/&(*,,,,*&#/*/&/                                                                                                                     #/*,*,,,*,*,,,/%#*#&//(((%((((((@,      
>         ,%(%%&%(/%##((/#%(*,,,*%&#,/(#                                                                                                                       ,&(,,,,*%*,*,,*#%(((*/%((#(//((&@*   
>        /&%#/,((#%/(/(&&#,,*(//,,,,,(%                                                                                                                         ./&#%(*,%%/*,(&#((((/%(((/(*%*/*##   
>       ,&%#((/((%((((*%#*,,(&#*,,,,/#.                                                                                                                           /&/,,,,(#//**(&%(%%(///((/%#((*%(  
>      .%*##@(/&%&(/#&%/&/*(,*,*,,,,%.                                                                                                                              (/&/,/**,,,(&&&#(((*#&&#/((//(@, 
>      (&#((/#&(((%%(&#/*%/,,,,,%&#&,                                                                                                                               .#(,,,*,#&##%/#%((/%&(/((/(%#*#& 
>     ,&/(/(/,#(/(%#&((,,#,,,,,%(*%%.                                                                                                                                ,&##,,,#(/*,,,,#,///#/(/(&#(/#@#
>     (#(&#//((%#((&/%#(%/*%&/%#//@*                                                                                                                                  ,&(,/*,,*(,,,/&*/((((%#(*(((/#&*
>    ,#/,#(((/(#((#%((,,,&%*,,,(/(&                                                                                                                                    (&%(,,,,*(//(#/#//(&#(///%%##&(
>    (*##((/(@&(((%&&*,,(#,,,,,%#&(                                                                                                                                    /&&%#(,(&((,**#&*/(/&/((/&(/(%&
>   .&#((((%#(((@&%(*%(&#,#(#&/#&&,                                                                                                                                     (&(*((%*,,%(#&&%(((##(%%///(/&
>   *#((((&%(((/&#(,,(@(,,,%&///#&,                                                                                                                                     (%,,,*%(,,,,(**#&%(&((((*%#(&&
>  .#(((#/((((&&&(/*(&&%**,&&&(*%%                                                                                                                          ,((/.       .%#/,%%(/,,*%/*#%((/#%/(@#(/((
>  .%##((((#%&((/&%&&*,,%%&(,,,,%#                                                                                                                       ,#,,,,,,,,     .&////,*(,,**,//#/(%#((/%%/(((
>  /%%(((((*%/((&(##,,,,,&#*,,,*%/  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;01010101 01110010 01101111 01100010 01101111 01110100 01101111 01110011                  *%#%*,,**,,,*  .%#(,,,#(*(**%#(&&#*(((/%#(#&%
>  ##&(*(((/%#(#&((%,,*/,(#*,,,,#(                                                                                                                           *#%%*,,*%( .%(/%@&%,*///&/*&(/%#&&#%((((/
> .&#(&#/#&#(##%&%#%#&%%%%/*#(*,%(                                                                                                                               ,&*,,#/,&#(,*,%(,,/%*%#((&((((/(%///(
> ,&%&(((((//&((&#*(&/,,,*(%%*,,/%                                                                                                                                 (%**/(%%(//(&/(/(//(%/#(#(((/%/*///
> /&%#((((((#%#/#&/(&**,,*%(&((/(&,                                                                                                                                .&%,/&%(#&%#(,,,*%/((/#(*#%%#%((((/
> *&&((/(&&&#/###&#/#%#*/&&%##((%%&                                                                                                                    ,#&%#.       ./#&&#,,,,/(,*(%,&&&##(((*((#%(((%
> .&%((((%&((((/#%(,,,*#%/*,,,,%&&#/                                                                                                                /&(%%#**(@,      /&(@/,,,,#(((*/**(#/#%,/((#@(//(/
> .%#((((/#((((((%(*,,**(/***#&(/,*@,                                                                                                                .&#((/*,/@*     /&&/#***%%/**,/%(&&%*(((((/(//((*
>  #&##%((#((##%#%(*,/(//*/(%#(*,,,(#                                                                                                                 *&%*,,,,/&,    #&%(*/,/###(/#%#%&(/(/##(/(/%#((#
>  *&#&%((((&#((((#&(&/,,,,*,/#*,,,,##                                                                                                                .  (&(,,,*&(  /%(//%(,&*,//(&(%&%#/(*%%##&%/////
>  .%#(#((((&((((#(%&%*,,,,*%&%/(#/*/%#                                                                                                                    /%/,,,(@/&/*/##&(*/,,/&#/#&((#*,/(//#/(((/#
>   /&/####(#&%/((%%&###/,*(#**,,*/%&&&#                                                                                                                    ./#,,,*&*,**,,,,,#&&&//#%,/%#/((((/&(////@
>   .%#(%&(((((%(,(((&%((#/#&/*,,,*%%(##%.                                                                                                                    .%%(&*,*//*/*,*(,,/*/#*(((((&(###/###/&&
>    *#(#%((((((#%((((%&&&(#(%#/*/(*##/(*&.                                                                                                                    %%#,(////((/%&(///,#%/(((/#/(/(((((/#%/
>     ##(/%((((#@/((###&&*/**,*&&#((*,***,&/                                                                                                                 ,#&/,,(**/*,*#**####&(#%#%%/((/%/(/(((%# 
>     ,&&(((((%@((((((##%(#((/*##**/*,/%%*((@,                                                                                                               #%(#*/&*,,,*&/**,/(%((((//(((///&%%#&## 
>      .@##(((/&%((((((((@&((*,/#(*,,*&(((*,,&&,                                                                                                           .#/*/%&&&@&&@((@##/##&*(((/#/##&#(((((/%. 
>       ,&((((((&%#&((((((&%%#///#%&&%%&%#((*%#&@,                                           ,%%,/&(                                                     .(#,**,/*,,,,#/,**,%(/(//(%#,((((((((/((&. 
>        *&#%%(/((((&#((((*/%(&%&&##//((/(&&##((#(@.                                   .(&&&#,%(,,#(            ..*&##/##                              ,@#,/*,,%(**,,((///*/&#((/(((%,((((//@#//&.  
>         /&(&#/(((((##((*(#//(#&%(/*,,/**%%#((((/#(#/                        /##((/*,,***,,,,,,/&*            */*#&,,%/&.                          .#@&#///%###@%((%&&&&%%%%(/(/((%*(%%%/((,%*@.  
>          (&%&%((%&((((((&((/(((%&#**,,*#/*,,,,**%&&/(%                     ,(,,,,,,,,,,/*/(*,               ,#/,//,,#(                          *&&&##**(&/*/*//&#*,,,*&//(//##(*/(((((((%&/@   
>           .%&%((#(*((((((%(((((((&&#/*,*,,*,,*,*#/,,*/*@&,               ,((,,,,,,,/%.                 .*&(,,,,,,//.                         ./%&&**,,(/#&*,**#&%/**,/&(((((((#/(((((%#*#/#&.  
>             #&%(%(((((/((((&%(%((((#&(*,,,**,*,,,,**,,,,,*&&%        ,((,,,,,,,,,,*%,                .(*,,,,,*#/.                         .%&**,##*****((*#&&(**%&(%&&##((((#&&#((#%&(/&#&(   
>              .&&((&(((%%(((((#&(((/((%&(,,,**(*,,,,,,,##,,,,,,/#(.(%(%*,,,,,,,,,,,%*                 /%,,,,//                         *(%/#(*(*,,*##%%%(*,,((***,//#//(//(%*/((//%(/((#(&,    
>                %&&(((((&#((((((%#/((/%%##(,,,/*,,,,,,,(&,,,,,,,,*,*%&(,,,,,,,,,,,%.                 //,,,,,(#                    ,#%&#,,,**%&&#/##/,,,#(,,,,&&(((&%#///((#%((((((%#/(%#@,     
>                 /@((((((#%#((((((##%#(%%/(%&&&%%/*,,*(##(((*,*%((,,,,,*/%%#,,,**.                  (**,,,,,,@*            .#&&&&&&//&&((**&%(***#////*/%&%%##/((*////%%%%((%&&%##/(#%&(     
>                  .&%((((%#(((((##/((((//(&/*&&%&##%&#,,,,,,,#&*,,//*/*((%(##(##&%%((*,            &*,,,,,,,,#    ,/((##/*/#&%##/,(#,,/((##%/(/,*,/&&@&%&((%%/#(((((/#(((((((%*/((#%(&.    
>                    %&(*#&//(/*((&(/(((((((/(&((%&%((#(,,,,//*&%////*%%/*,,,/,,(&#%#(//(/((&&%&&&&&%(/%#(//*/#%/*/*(#,,,,*,,,,/**/#**,***,(%%(,,*((/*,//%&%(((%%(((((%((/(((*%/(/%#&*    
>                     .&&((%#/((/,(/(#(,###(((%%((/#&&#/(**,*/#(/*/#(*(&*,,**,,,(%,*//////#(&/*,,,,,*,%*,,,*&&*,,/(/%*,,,,,,,#/**,,(#((((##/,*###%%/,*(%&(##(#(//#%%%//%@##(%%((&&@#     
>                       ,&&#(#%//(((((/(%(((((((%&(/&(/%&&&##%/*,,,,,,*(&#(/&(*,,**(%/#(*///(&#/@#/,,,/&&#&%@&#(((((&(%###%(#&%//**///*/#%*/**,,,,(&&#/((&#,/(/((#/(*//((%(/((%(&(        
>                         ,%&#(/%%(((((//&((((/#(#*/#&#(((#%#&%##(**#/,,,**/@(*,*,*,(%*******,/&#(**/*,/*,///(#&%**,,**%(***,***/&#*,*,**#&(***(&&%(((/*//%(//((((*/(/(/##%&(&&(        
>                           *@&%#%%((((((//##/#%/(((((((%(((((&&&&&&&(,,,,,,,/&#//*,/#****,,,**#&&####%%*((///#&/*////#&#/*,,,*#&@%/**////#&&&&((((/(/((/((/%%##(//#%#((#&&/%,          
>                             ,/&&#(%((((#(//((#&#(((**,&#(((((/((#%(@&&/&#*,,,/**,///(#(#((/*****/&&#(/%%&&&(//%%&%%/*/&&%((&%###&#(/%&%((((/%,((((/*%////(//*(%(//(%%&(%/          
>                                 (@%#//&(/((((((((%%%#(&&(/((/&(/((((/(&///(#&%/##*//(/**%(**/((@(*///*//&##(/*,(#*******#%(%%%%&#&&&#/((((((,(%%###/&#(/////*@#///(/&#        
>                                    /&&&&#/((((((#&((((//(#((*&&#/(**((%&((((//(&%%&&%%%((&%//#%&&#(*/*#%&@%##((#&(*,/(#%%&/(#(//(((##((/(((((#((((((((%&##@%((*%%&%,                  
>                                       ,%@&&&(((((%&#(((/((((//(%@&%#%#(((%%#(//*&@#///((#&&#&#/(/#&&&&&((((/&##(,#&%##*,*/(#%@#((((/,#%&&##(%,((((((((#(,((//#%%,            
>                                          ./&@&%((((#&(/(((&%/((((//&(((//%#/(//(((/(&#(/*/*&%(((((((%(/((((%//(((/*%,/((((,/(/(((((*#/(((((/((((/**(((#(*/#&%*                          
>                                               ,(&&#(,#%/((/#&%(*/((&(((((/#&/(///*&#/(((((/#&#/((((#(%&&##%&((((//(#@&(//*/&#(((((//@*(((/(((((/*//(///#@#.                            
>                                                    ./%&#/(%%(*#&#(((%&%(/##%#((((,%&////(((/#%%((&((((((((((#%%%%%(//((((%#*/%%%%#((*/%#((((((((%@&&&(.                           
>                                                         ,#&@%(@&&#((((//&(/(/*//(*(#%&&%((##/((/#%((((((/((((((((#//(/((#*//(///*%/(((((/((#&&&&&(                                
>                                                              .,/%&&&&&&&&&(/(((((%#///((/##((((((/(%@&&%/&#(((((((#%%%%&@#(//(//(&(/##%%%&&%(,.                                    
>                                                                       .(&&&&&(%&&@&##((///#&%/(((/*&((((((#%&#%&&#&#(##%@&&&@&&#&&&&&#(,                                           
>                                                                              .*/(#%&&%%######&&&&&&&%#%%#(((#(/(%&&&&&&&&&&&%#(,.                                                     












































                                                             













                                                            














	  

