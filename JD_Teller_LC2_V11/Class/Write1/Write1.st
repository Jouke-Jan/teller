//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "Write1"
	Revision           = "0.0"
	GUID               = "{DF939928-6B5B-48AD-AADA-D371FE848B4D}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(284,120)">
	<Channels>
		<Server Name="ClassSvr" GUID="{25FA2F4B-D396-4902-A561-51D401EA9A49}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Client Name="cWrite1" Required="true" Internal="false"/>
	</Channels>
</Class>
*)
Write1 : CLASS
  //Servers:
	ClassSvr 	: SvrChCmd_DINT;
  //Clients:
	cWrite1 	: CltCh_DINT;
  //Variables:
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL Init;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB Write1::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_WRITE1
0$UINT, 0$UINT, (SIZEOF(::Write1))$UINT, 
1$UINT, 1$UINT, 0$UINT, 
TO_UDINT(3018010598), "Write1", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::Write1.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
//Clients:
(::Write1.cWrite1.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(3937287903), "cWrite1", 
END_FUNCTION


#define USER_CNT_Write1 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_Write1] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION Write1::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_Write1, pCmd := #vmt.CmdTable);
	vmt.CmdTable.Init		:= #Init();
	ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION

FUNCTION VIRTUAL GLOBAL Write1::Init


  if    _FirstScan then
        cWrite1.Write (1);

  end_if;


END_FUNCTION







