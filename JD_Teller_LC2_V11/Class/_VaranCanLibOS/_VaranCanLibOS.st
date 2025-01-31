//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION
#include <.\lsl_st_can.h>

(*!
<Class
	Name               = "_VaranCanLibOS"
	Revision           = "1.10"
	GUID               = "{B2B3F01B-1617-4AB6-9E7F-53BED5067E4E}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "true"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	IconPath           = ".\Class\Tool.ico"
	SharedCommandTable = "true"
	Objectsize         = "(354,120)">
	<Channels>
		<Server
			Name           = "CanBus"
			Initialize     = "false"
			Visualized     = "false"
			WriteProtected = "true"
			Comment        = "which CanbusSystem [1,2,...](as initvalue)">
		</Server>
		<Server
			Name           = "Command"
			Initialize     = "false"
			Visualized     = "false"
			WriteProtected = "true"
			Comment        = "Connect a object client">
		</Server>
		<Client Name="Index" Required="true" Internal="false" Comment="index of can interface on device"/>
		<Client Name="VaranIn" Required="true" Internal="false"/>
	</Channels>
	<Dependencies>
		<Files>
			<File Path=".\lsl_st_can.h" Include="true"/>
		</Files>
	</Dependencies>
	<RevDoku>
		<Owner Company="Sigmatek" Author="RenSte"/>
		<Dokumentation Revision="1.10" Date="12.02.2014" Author="PieSte" Company="Sigmatek" Description="Add read Client Index in Init in GetCanBusNr to set value with connected server."/>
		<Dokumentation Revision="1.2" Date="04.01.2011" Author="BleErn" Company="Sigmatek" Description="Added Client Transparent that allows to disable a VARAN-HW-Class"/>
	</RevDoku>
	<Network Name="_VaranCanLibOS">
		<!-- List of Components in this network -->
		<Components>
			<Object
				Name       = "_base"
				GUID       = "{992FE203-46D1-4ADD-B0DA-33A00F5E4614}"
				Class      = "_CanLib"
				Position   = "(270,150)"
				Visualized = "true">
				<Channels>
					<Server Name="CanBus"/>
					<Server Name="Command"/>
					<Client Name="To_Can"/>
				</Channels>
			</Object>
		</Components>
		<Comments>
		</Comments>
		<!-- List of Connections in this network -->
		<Connections>
			<Connection Source="this.Command" Destination="_base.Command" Vertices="(772,210),(600,240),"/>
			<Connection Source="this.CanBus" Destination="_base.CanBus" Vertices="(772,270),(600,300),"/>
		</Connections>
		<!-- Headerfiles -->
		<Options>
		</Options>
	</Network>
</Class>
*)
#pragma using _CanLib

_VaranCanLibOS : CLASS
: _CanLib
  //Servers:
  //Clients:
	VaranIn 	: CltChCmd_Varan_Base;
	Index 	: CltCh_DINT;
  //Variables:
		p_Node 	: ^USINT;
  //Functions:
	
	FUNCTION _VaranCanLibOS
		VAR_OUTPUT
			ret_code 	: ConfStates;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL IsInstalled
		VAR_OUTPUT
			retval 	: DINT;			//! <Variable Comment="0 = CAN interface is installed, otherwise error code." Name="IsInstalled.retval"/>
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL GetMyStation
		VAR_INPUT
			Station 	: ^USINT;			//! <Variable Comment="target address to where the station number should be written." Name="GetMyStation.Station"/>
		END_VAR
		VAR_OUTPUT
			retval 	: DINT;			//! <Variable Comment="0 = Function successful, otherwise error code." Name="GetMyStation.retval"/>
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL SetMyStation
		VAR_INPUT
			Station 	: USINT;			//! <Variable Comment="Station number." Name="SetMyStation.Station"/>
		END_VAR
		VAR_OUTPUT
			retval 	: DINT;			//! <Variable Comment="0 = Function successful, otherwise error code." Name="SetMyStation.retval"/>
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL GetBaudrate
		VAR_INPUT
			Baudrate 	: ^USINT;			//! <Variable Comment="target address to where the baud rate should be written. 0: 615 kBit/s, 1: 500 kBit/s, 2: 250 kBit/s, 3: 125 kBit/s, 4: 100 kBit/s, 5: 50 kBit/s, 6: 20 kBit/s, 7: 1 MBit/s." Name="GetBaudrate.Baudrate"/>
		END_VAR
		VAR_OUTPUT
			retval 	: DINT;			//! <Variable Comment="0 = Function successful, otherwise error code." Name="GetBaudrate.retval"/>
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL SetBaudrate
		VAR_INPUT
			Baudrate 	: USINT;			//! <Variable Comment="0: 615 kBit/s, 1: 500 kBit/s, 2: 250 kBit/s, 3: 125 kBit/s, 4: 100 kBit/s, 5: 50 kBit/s, 6: 20 kBit/s, 7: 1 MBit/s." Name="SetBaudrate.Baudrate"/>
		END_VAR
		VAR_OUTPUT
			retval 	: DINT;			//! <Variable Comment="0 = Function successful, otherwise error code." Name="SetBaudrate.retval"/>
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL CanTxObj
		VAR_INPUT
			ObjNr 	: INT;			//! <Variable Comment="Object number (max. 2047)." Name="CanTxObj.ObjNr"/>
			length 	: USINT;			//! <Variable Comment="Data length (max. 8)." Name="CanTxObj.length"/>
			data 	: pVoid;			//! <Variable Comment="Data pointer." Name="CanTxObj.data"/>
		END_VAR
		VAR_OUTPUT
			retval 	: INT;			//! <Variable Comment="0: OK, 1: wrong CAN interface (1 of 2). 2: Data length greater than 8 of ObjNr greater than 2047. 4: Buffer full." Name="CanTxObj.retval"/>
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL AddCanObj
		VAR_INPUT
			ObjNr 	: INT;			//! <Variable Comment="Object number (max. 2047)." Name="AddCanObj.ObjNr"/>
			Length 	: USINT;			//! <Variable Comment="Data length (max. 8) ." Name="AddCanObj.Length"/>
			Mode 	: USINT;			//! <Variable Comment="0: RX without Interrupt, 1: RX with Interrupt, 2: Tx (use function CanTxObject!)." Name="AddCanObj.Mode"/>
			ActionPtr 	: pVoid;			//! <Variable Comment="Pointer to the function called by the Interrupt." Name="AddCanObj.ActionPtr"/>
			ThisPointer 	: pVoid;			//! <Variable Comment="Thispointer." Name="AddCanObj.ThisPointer"/>
		END_VAR
		VAR_OUTPUT
			retVal 	: DINT;			//! <Variable Comment="0-11: Nr. CAN-Objects used -2: Length &gt; 8, -3: ObjNr &gt; 2047, -4: Mode &gt; 2, -5: No User CAN-Object available" Name="AddCanObj.retVal"/>
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL LoginIntoCanNew
		VAR_INPUT
			CanStation 	: USINT;			//! <Variable Comment="CAN-Station number." Name="LoginIntoCanNew.CanStation"/>
			TxObjNr 	: INT;			//! <Variable Comment="Object number." Name="LoginIntoCanNew.TxObjNr"/>
		END_VAR
		VAR_OUTPUT
			retval 	: DINT;			//! <Variable Comment="0 = Function successful, otherwise error code." Name="LoginIntoCanNew.retval"/>
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL InitBasicCanObject
		VAR_INPUT
			ObjNr 	: INT;			//! <Variable Comment="Object number (max. 2047)." Name="InitBasicCanObject.ObjNr"/>
			mask 	: INT;			//! <Variable Comment="Bitmask filter to select CAN-Objects." Name="InitBasicCanObject.mask"/>
			ActionPointer 	: pVoid;			//! <Variable Comment="Pointer to the function called by the interrupt." Name="InitBasicCanObject.ActionPointer"/>
			ThisPointer 	: pVoid;			//! <Variable Comment="Thispointer." Name="InitBasicCanObject.ThisPointer"/>
		END_VAR
		VAR_OUTPUT
			retval 	: DINT;			//! <Variable Comment="0: Function successful, -1: Wrong CAN interface Number, -2: Object number &gt; 2047" Name="InitBasicCanObject.retval"/>
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL Set_RTR_Flag
		VAR_INPUT
			handle 	: DINT;			//! <Variable Comment="Number of the  Can-Object used (return value of the AddCanObj function)" Name="Set_RTR_Flag.handle"/>
		END_VAR
		VAR_OUTPUT
			retval 	: DINT;			//! <Variable Comment="0 = OK, -1 = wrong handle" Name="Set_RTR_Flag.retval"/>
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL CanTxObjHandle
		VAR_INPUT
			handle 	: DINT;
			data 	: pVoid;
		END_VAR
		VAR_OUTPUT
			retval 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL CanRxObjHandle
		VAR_INPUT
			handle 	: DINT;
			pData 	: pVoid;
		END_VAR
		VAR_OUTPUT
			retval 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL RedefCanObj
		VAR_INPUT
			handle 	: DINT;
			ObjNr 	: DINT;
			Length 	: USINT;
			Mode 	: USINT;
			ActionPtr 	: pVoid;
			ThisPtr 	: pVoid;
			mask 	: INT;
		END_VAR
		VAR_OUTPUT
			retVal 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL ChkObjExists
		VAR_INPUT
			ObjNr 	: INT;
			Mode 	: USINT;
		END_VAR
		VAR_OUTPUT
			handle 	: DINT;
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL DelCanObj
		VAR_INPUT
			Handle 	: DINT;			//! <Variable Comment="the handle of the object which should be deleted" Name="DelCanObj.Handle"/>
		END_VAR
		VAR_OUTPUT
			retval 	: DINT;			//! <Variable Comment="0 = Function successful, otherwise error code." Name="DelCanObj.retval"/>
		END_VAR;
	
	FUNCTION VIRTUAL GLOBAL DelBasicCanObj
		VAR_INPUT
			Handle 	: DINT;			//! <Variable Comment="This parameter is only used for the CCA021 module" Name="DelBasicCanObj.Handle"/>
		END_VAR
		VAR_OUTPUT
			retval 	: DINT;			//! <Variable Comment="0 = Function successful, otherwise error code." Name="DelBasicCanObj.retval"/>
		END_VAR;
	
	FUNCTION GetCanBusNr;
	
	FUNCTION VIRTUAL GLOBAL Connect;
	
	FUNCTION VIRTUAL GLOBAL Disconnect;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma usingLtd Varan_Base


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB _VaranCanLibOS::@CT_
0$UINT,
2#0100000000000000$UINT, //TY__VARANCANLIBOS
1$UINT, 10$UINT, (SIZEOF(::_VaranCanLibOS))$UINT, 
0$UINT, 2$UINT, 0$UINT, 
TO_UDINT(415874427), "_VaranCanLibOS", //Class
TO_UDINT(529317953), "_CanLib", 1$UINT, 10$UINT, //Baseclass
//Servers:
//Clients:
(::_VaranCanLibOS.VaranIn.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(2999796184), "VaranIn", TO_UDINT(862125188), "Varan_Base", 2$UINT, 2$UINT, 
(::_VaranCanLibOS.Index.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(1999087025), "Index", 
END_FUNCTION


#define USER_CNT__VaranCanLibOS 18

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT__VaranCanLibOS] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION _VaranCanLibOS::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
		nCmdSize	: UINT;
	END_VAR

	ret_code	:= _CanLib::@STD();
	IF ret_code <> C_OK THEN
		RETURN;
	END_IF;
	nCmdSize		:= _CanLib::Command.pMeth^.nCmds$UINT*SIZEOF(pVoid) + CMDMETH.Init;

	_memcpy((#vmt.CmdTable)$^USINT, _CanLib::Command.pMeth, nCmdSize);
	vmt.CmdTable.nCmds		:= nSTDCMD + USER_CNT__VaranCanLibOS;
#pragma warning (disable : 74)
	vmt.UserFcts[0]		:= #IsInstalled();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[1]		:= #GetMyStation();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[2]		:= #SetMyStation();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[3]		:= #GetBaudrate();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[4]		:= #SetBaudrate();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[5]		:= #CanTxObj();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[6]		:= #AddCanObj();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[7]		:= #LoginIntoCanNew();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[8]		:= #InitBasicCanObject();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[9]		:= #Set_RTR_Flag();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[10]		:= #CanTxObjHandle();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[11]		:= #CanRxObjHandle();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[12]		:= #RedefCanObj();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[13]		:= #ChkObjExists();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[14]		:= #DelCanObj();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[15]		:= #DelBasicCanObj();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[16]		:= #Connect();

#pragma warning (default : 74)
#pragma warning (disable : 74)
	vmt.UserFcts[17]		:= #Disconnect();

#pragma warning (default : 74)
	_CanLib::Command.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF _CanLib::Command.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	ret_code	:= _VaranCanLibOS();

END_FUNCTION

//{{LSL_IMPLEMENTATION
#pragma usingLtd Hub_Base


(************************************************************************************
*
*	CAN OS interface class for Varan Can
*	Created : Sigmatek	/	SR	/	2007
*	Changes : 
*   1.0 => 1.1  / 05.01.2009  / Mark: //#PH001
*     add the methods DelCanObj, DelBasicCanObj, CanTxObjHandle, CanRxObjHandle,
*     RedefCanObj, ChkObjExists
*
************************************************************************************)

#define VARAN_CAN_OS_VERSION	16#1100 + 226
#define CANBUS_INVALID_VALUE	-2147483393			//16#800000FF


FUNCTION  _VaranCanLibOS::GetCanBusNr
VAR
	pCanuser		: ^OS_CANUSER;
	ud_master		: UDINT;
	p_varan			: ^LSL_VARAN;
END_VAR

#ifdef IsTransparent_IS_AVAILABLE
  IF VaranIn.IsTransparent() THEN
    return;
  END_IF;
#endif

	//get node pointer
	p_node := VaranIn.GetPointer2NodeString();

	//check if we have one
	if ( p_Node = NIL ) then
		return;
	end_if;

	ud_master := VaranIn.VaranIn.GetManagerNumber( #p_varan );
  
  //get client values
  Index := Index.Read();
	
	if ( _RTOSVersion < VARAN_CAN_OS_VERSION | OS_CILGet( "CANUSER", #pCanuser$void ) ) then
	else
		CanBus := CANUSER_GETNRBYPATH( master := ud_master, p_node, index := Index$UDINT );
	end_if;

END_FUNCTION // _VaranCanLibOS::GetCanBusNr
FUNCTION  _VaranCanLibOS::_VaranCanLibOS
VAR_OUTPUT
	ret_code		: CONFSTATES;
END_VAR

	CanBus := CANBUS_INVALID_VALUE;

	if ( _RTOSVersion < VARAN_CAN_OS_VERSION ) then
		TRACE("OS-Can not available! At least OS 1.1.226 is needed! ");
	end_if;

	ret_code	:= C_OK;

END_FUNCTION //  _VaranCanLibOS::_VaranCanLibOS
FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::Connect

	GetCanBusNr();

END_FUNCTION //GLOBAL _VaranCanLibOS::Connect
FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::Disconnect
	
	CanBus := CANBUS_INVALID_VALUE;

END_FUNCTION //GLOBAL _VaranCanLibOS::Disconnect

FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::IsInstalled
VAR_OUTPUT
	retval		: DINT;
END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;	

	retval := _CanLib::IsInstalled();

END_FUNCTION //VIRTUAL GLOBAL _VaranCanLibOS::IsInstalled
FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::GetMyStation
VAR_INPUT
	Station		: ^USINT;
END_VAR
VAR_OUTPUT
	retval		: DINT;
END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;	

	retval := _CanLib::GetMyStation( Station );

END_FUNCTION //VIRTUAL GLOBAL _VaranCanLibOS::GetMyStation

FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::SetMyStation
VAR_INPUT
	Station		: USINT;
END_VAR
VAR_OUTPUT
	retval		: DINT;
END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;	

	retval := _CanLib::SetMyStation( Station );

END_FUNCTION //VIRTUAL GLOBAL _VaranCanLibOS::SetMyStation

FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::GetBaudrate
VAR_INPUT
	Baudrate		: ^USINT;
END_VAR
VAR_OUTPUT
	retval		: DINT;
END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;	

	retval := _CanLib::GetBaudrate( Baudrate );

END_FUNCTION //VIRTUAL GLOBAL _VaranCanLibOS::GetBaudrate

FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::SetBaudrate
VAR_INPUT
	Baudrate		: USINT;
END_VAR
VAR_OUTPUT
	retval		: DINT;
END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;	

	retval := _CanLib::SetBaudrate( Baudrate );

END_FUNCTION //VIRTUAL GLOBAL _VaranCanLibOS::SetBaudrate

FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::CanTxObj
VAR_INPUT
	ObjNr		: INT;
	length		: USINT;
	data		: pVoid;
END_VAR
VAR_OUTPUT
	retval		: INT;
END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;	

	retval := _CanLib::CanTxObj( ObjNr, length, data );

END_FUNCTION //VIRTUAL GLOBAL _VaranCanLibOS::CanTxObj

FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::AddCanObj
VAR_INPUT
	ObjNr			: INT;
	Length			: USINT;
	Mode			: USINT;
	ActionPtr		: pVoid;
	ThisPointer		: pVoid;
END_VAR
VAR_OUTPUT
	retVal			: DINT;
END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;	

	retval := _CanLib::AddCanObj( ObjNr, Length, Mode, ActionPtr, ThisPointer );

END_FUNCTION //VIRTUAL GLOBAL _VaranCanLibOS::AddCanObj

FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::LoginIntoCanNew
VAR_INPUT
	CanStation		: USINT;
	TxObjNr			: INT;
END_VAR
VAR_OUTPUT
	retval			: DINT;
END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;	

	retval := _CanLib::LoginIntoCanNew( CanStation, TxObjNr );

END_FUNCTION //VIRTUAL GLOBAL _VaranCanLibOS::LoginIntoCanNew

FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::InitBasicCanObject
VAR_INPUT
	ObjNr			: INT;
	mask			: INT;
	ActionPointer	: pVoid;
	ThisPointer		: pVoid;
END_VAR
VAR_OUTPUT
	retval			: DINT;
END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;	

	retval := _CanLib::InitBasicCanObject( ObjNr, mask, ActionPointer, ThisPointer );

END_FUNCTION //VIRTUAL GLOBAL _VaranCanLibOS::InitBasicCanObject

FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::Set_RTR_Flag
VAR_INPUT
	handle		: DINT;
END_VAR
VAR_OUTPUT
	retval		: DINT;
END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;	

	retval := _CanLib::Set_RTR_Flag( handle );

END_FUNCTION //VIRTUAL GLOBAL _VaranCanLibOS::Set_RTR_Flag



FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::DelCanObj //#PH001
	VAR_INPUT
		Handle 	: DINT;
	END_VAR
	VAR_OUTPUT
		retval 	: DINT;
	END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;	

  retval  := _CanLib::DelCanObj(Handle:=Handle);
  
END_FUNCTION


FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::DelBasicCanObj
	VAR_INPUT
		Handle 	: DINT;
	END_VAR
	VAR_OUTPUT
		retval 	: DINT;
	END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;	

  retval  := _CanLib::DelBasicCanObj();
  
END_FUNCTION


FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::ChkObjExists //#PH001
	VAR_INPUT
		ObjNr 	: INT;
		Mode 	: USINT;
	END_VAR
	VAR_OUTPUT
		handle 	: DINT;
	END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;
  
  handle  := _CanLib::ChkObjExists(ObjNr:=ObjNr, Mode:=Mode);
  
END_FUNCTION


FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::RedefCanObj //#PH001
	VAR_INPUT
		handle 	: DINT;
		ObjNr 	: DINT;
		Length 	: USINT;
		Mode 	: USINT;
		ActionPtr 	: pVoid;
		ThisPtr 	: pVoid;
		mask 	: INT;
	END_VAR
	VAR_OUTPUT
		retVal 	: DINT;
	END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;
  
  retVal  := _CanLib::RedefCanObj(handle:=handle, 
                                  ObjNr:=ObjNr, 
                                  Length:=Length, 
                                  Mode:=Mode, 
                                  ActionPtr:=ActionPtr, 
                                  ThisPtr:=ThisPtr, 
                                  mask:=mask);
  
END_FUNCTION


FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::CanRxObjHandle //#PH001
	VAR_INPUT
		handle 	: DINT;
		pData 	: pVoid;
	END_VAR
	VAR_OUTPUT
		retval 	: DINT;
	END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;
  
  retval  := _CanLib::CanRxObjHandle(handle:=handle, pData:=pData);

END_FUNCTION


FUNCTION VIRTUAL GLOBAL _VaranCanLibOS::CanTxObjHandle //#PH001
	VAR_INPUT
		handle 	: DINT;
		data 	: pVoid;
	END_VAR
	VAR_OUTPUT
		retval 	: DINT;
	END_VAR

	//if we have no number
	if ( CanBus = CANBUS_INVALID_VALUE ) then
		GetCanBusnr();
	end_if;
  
  retval  := _CanLib::CanTxObjHandle(handle:=handle, data:=data);
  
END_FUNCTION
