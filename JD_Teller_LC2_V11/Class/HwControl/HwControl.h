#ifndef HW_CONTROL_H
#define HW_CONTROL_H

// Definitions for installing Update-Calls
#ifndef SCANDEFS_H
#define SCANDEFS_H
  #define CALL_OPTION_RT_PRESCAN  2#0001
  #define CALL_OPTION_RT_POSTSCAN 2#0010
  #define CALL_OPTION_CYCLIC      2#0100
  #define CALL_OPTION_POST_INIT   2#1000
#endif // SCANDEFS_H

// maximum time for the initilisation after the last init in ms
#define POST_INIT_TIMEOUT               30000

// newinst commands
#define CMD_POST_INIT_CALL        16#8002 // when the init is blocked but the realtime is already running everything gets called so it can wait until init is finished
#define CMD_NEED_POST_INIT_CALL   16#8003 // when a module needs to initialize during last init it calls the newinst of the varanmanager with this parameter
#define CMD_POST_INIT_FINISHED    16#8004 // when the module is ready (CMD_NEED_LAST_INIT_CALL has to be called before)
#define CMD_FORCE_POST_INIT_END   16#8005 // when the Post init runs init runs into timeout, this call is used by HWControl to stop the post init phase in the VM. Otherwise UpDateCy of HWK is not called
#define CMD_HWCONTROL_LOGIN       16#8006 // general login to hwcontrol to get callbacks for post init, cyclic and realtime pre-/postscan
#define CMD_POST_INIT_RT_READY    16#8007 // when the hwcontrol has finished post init it asks every module if it's also ready with it's rt
#define CMD_POST_INIT_DO_SORT     16#8008 // command for the varan managers to sort their DOs (safety first, then all others)            


//*****************************************************************************
//** TYPES                                                                   **
//*****************************************************************************

	TYPE
    t_HwObjListSettings : BDINT
	    [
	    1 RtPreScan,
      2 RtPostScan,
      3 Cyclic,
      4 PostInit,
	    ];
  END_TYPE
  
#endif
