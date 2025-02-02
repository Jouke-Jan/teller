// SAFETY MANAGER COMMANDS

#ifndef SAFETYMANAGER_H
#pragma once
#define SAFETYMANAGER_H

// activate debug logging for safety functionality
//#define SAFETY_DEBUG_LOGGING_ACTIVATED
#ifdef SAFETY_DEBUG_LOGGING_ACTIVATED
//  #define SAFETY_DEBUG_TRACING_ACTIVATED
#pragma message("Safety Debug Logging activated!")
#endif

// Range of the Safty commands
#define CMD_SM_CMD_MIN_RANGE          0x8100
#define CMD_SM_CMD_MAX_RANGE          0x81FF

//*****************************************************************************
//** FROM SAFETY MANAGER                                                     **
//*****************************************************************************


// TO SAFETY MODULES OR MANAGING NODES ***********************************
  // start your time synchronisation
#define CMD_SM_START_TIME_SYNC        0x8100
  
// TO SAFETY MODULES **********************************************************
  // set new sync mode
#define CMD_SM_SET_NEW_SYNC_MODE      0x8110
  
  // manager init finished
#define CMD_SM_INIT_FINISHED          0x8111
  
  // sdo to module
#define CMD_SM_SDO_TO_MODULE          0x8112

  // tdo to module
#define CMD_SM_TDO_TO_MODULE          0x8113

  // get safety number of the module
#define CMD_SM_GET_SAFETY_NUMBER      0x8114

  // tell the module it has an external pdo source
#define CMD_SM_ADD_INPUT_PDO          0x8115

  // tell the module it has an external pdo destination
#define CMD_SM_ADD_OUTPUT_PDO         0x8116

  // tell the module we have no more PDO data for it
#define CMD_SM_REMOVE_INPUT_PDO       0x8117

// TO MANAGING NODES **********************************************************
  // check if it's synchron with the counterpart
#define CMD_SM_SYNC_CHECK             0x8120

  // tell the domain gateway, that we're master for our domains, but get the sync via interface frame (can only be sent to VBC021Slave or VaranManager4VMC) => interface frames possible
#define CMD_SM_ITF_POSSIBLE           0x8121

  // tell the domain gateway how much memory is used
#define CMD_SM_PDO_MEM_USAGE_WR       0x8122
#define CMD_SM_PDO_MEM_USAGE_RD       0x8123

  // choose between automatic or manual PDO data copy of intern and class memory (normaly done in UpdateRt and UpdateRtPostScan)
#define CMD_SM_PDO_COPY_MODE          0x8124


//*****************************************************************************
//** TO SAFETY MANAGER                                                       **
//*****************************************************************************


// FROM SAFETY MODULES OR MANAGING NODES **************************************
  // finished with time synchronisation
#define CMD_SM_TIME_SYNC_FINISHED     0x8130

  // new CRC in safety cpu detected => reinit the system (step 1: delete the old config, step 2: remember the new config)
#define CMD_SM_NEW_SAFETY_PROJECT     0x8131


// FROM SAFETY MODULES ********************************************************
  // add module
#define CMD_SM_ADD_MODULE             0x8140
  
  // add module infos
#define CMD_SM_ADD_MODULE_INFO        0x8141
  
  // sdo to manager
#define CMD_SM_SDO_TO_MANAGER         0x8142

  // tdo to manager
#define CMD_SM_TDO_TO_MANAGER         0x8143

  // configuration to local manager
#define CMD_SM_CPU_CFG_TO_MANAGER     0x8144

  // configuration to local manager
#define CMD_SM_UNSAFE_CFG_TO_MANAGER  0x8145

  // tell the local manager what type of configuration we have just loaded (at old configs no timesync has to be done by the classes)
#define CMD_SM_NEW_CFG_TYPE           0x8146

  // tell the local manager that the module has been disconnected
#define CMD_SM_MODULE_DISCONNECT      0x8147

  // tell the local manager that the module has been reconnected (after a previous disconnect)
#define CMD_SM_MODULE_RECONNECT       0x8148


// FROM MANAGING NODES ********************************************************
  // connection broken => flush config and wait in init state
#define CMD_SM_DISCONNECT             0x8150

  // hand over pointer to DPRAM and other infos from the managing module
#define CMD_SM_ADD_MANAGING_INFO      0x8151

// FROM HWCONTROL *************************************************************
  // ready with post init => get safety configurations
#define CMD_SM_POST_INIT_FINISHED     0x8160


//*****************************************************************************
//** FROM MANAGING NODE TO MANAGING NODE                                     **
//*****************************************************************************

// time synchronisation token forwarding
#define CMD_SM_TDO_TOKEN_FWD          0x8170

// send domain info to direct neighbor
#define CMD_SM_DOMAIN_NR_SEND         0x8171

// send domain info to 2nd level neighbor (1 neighbor between)
#define CMD_SM_DOMAIN_NR_FWD          0x8172

// tell everyone that they should stop working and delete the configurations of external domains
#define CMD_SM_STOP_AND_FLUSH_CFG     0x8173

// response => flushing finished
#define CMD_SM_STOPPED_AND_FLUSHED    0x8174

// tell everyone to start again and spread their configuration
#define CMD_SM_SPREAD_CFG_AND_START   0x8175

// tell the master that our subdomains are synchron
#define CMD_SM_SUBDOMAINS_SYNCHRON    0x8176

  // configuration to master manager
#define CMD_SM_CPU_CONFIG_TO_MASTER   0x8177

  // the master broadcasts his PDO settings 1 by 1 to all slaves (the slaves forward this command and answer to it if they are affected)
#define CMD_SM_PDO_MAPPING_BROADCAST  0x8178

  // we understood the mapping broadcast and know that we have to deal with it
#define CMD_SM_PDO_MAPPING_ACK        0x8179

  // send additional PDO info: the source/destination safety number of a multi-domain PDO has to be sent to the destination/source domain of it
#define CMD_SM_PDO_SAFETYNBR_2_DOM    0x817A

  // send initial SDO memory informations
#define CMD_SM_SDO_INIT_INFORMATION   0x817B

  // sdo via topology path will be sent to master. sdo contains the compressed path, the master knows the corresponding uncompressed path to it
#define CMD_SM_TOP_SDO_TO_MASTER      0x817C

  // sdo via topology path sent from master to addressee via uncompressed topology path
#define CMD_SM_TOP_SDO_TO_MODULE      0x817D

  // the master sends the configuration of the unsafe variables
#define CMD_SM_SEND_UNSAFE_VAR_CFG    0x817E

  // the destination domain understood the unsafe variable configuration tells the master
#define CMD_SM_UNSAFE_VAR_CFG_ACK     0x817F

  // new value for a unsafe variable
#define CMD_SM_UNSAFE_VAR_NEW_VAL     0x8180

  // the master tells the slaves to (re-)send their slave domain synchronicity
#define CMD_SM_SEND_SUBDOMAIN_SYNC    0x8181

  // the master tells the slaves to send their domain-nr for a first time (needed for S-DIAS Master/Slave SDO distribution)
#define CMD_SEND_DOMAIN_ROUTING_INFO  0x8182

  // tell all safety components that the HW-connection of all domains is ready (to start distributing SDOs)
#define CMD_SM_FIRST_CONNECT_READY    0x8183

//*****************************************************************************
//** FROM MANAGING NODE TO MANAGING NODE (ONLY USED FOR INTERFACE FRAMES)    **
//*****************************************************************************

  // send info of all our safety modules to the other system (needs it for SDO and TDO distribution)
#define CMD_SM_IF_MODULE_INFO         0x8190


//*****************************************************************************
//** FROM SAFETY MODULE TO SAFETY MODULE (USED MAINLY FOR INITIALISATION)    **
//*****************************************************************************

  // these newinst commands replace the former call via pointer to the class, which created an unnecessary dependency to class SafetyCDIAS_Base
#define CMD_SM_ADD_SDO_TO_BUFFER      0x81A0
#define CMD_SM_WRITE_TDO_TO_MODULE    0x81A1
#define CMD_SM_CONFIG_SAFETY_CPU      0x81A2
#define CMD_SM_CONFIG_SAFETY_INPUT    0x81A3
#define CMD_SM_CONFIG_SAFETY_OUTPUT   0x81A4
#define CMD_SM_REMOVE_CPU_FROM_TABLE  0x81A5
#define CMD_SM_GET_MODULE_TYPE        0x81A6
#define CMD_SM_DEACTIVATE_MOVE_CMD    0x81A7
#define CMD_SM_READ_PDO_SIZE          0x81A8


//*****************************************************************************
//** General Constants                                                       **
//*****************************************************************************

// mode of compressed path (1 = uncompressed, 2 = compressed with CRC, 3 = interface CRC)
#define INTERFACE_CRC_MODE                 3

// time in ms in which the timesynchronisation of each component (safety module or managing node) should be finished
#define TIMESYNC_TIMEOUT                3000

// defines how many consecutive timeouts have to occur before a logmessage is put into the logfile/trace output
#define TIMESYNC_TIMEOUTS_BEFORE_LOGMSG    3

// maximum number of domains used in a system
#define MAX_DOMAINS_ALLOWED               10

// maximum number of modules used in other domains
#define MAX_MODULES_IN_OTHER_DOMAINS      50

// maximum number of PDOs to copy to a domain module via copy command of varan manager
#define MAX_PDO_COPY_CMDS                100

// maximum number of PDO configurationes stored in safety manager
#define MAX_PDO_CONFIGS                  100

// maximum number of internal interface modules stored in safety manager
#define MAX_INTERNAL_IF_MODULES           10

// size of SDO (asy data) ring buffer in byte  
#define SDO_BUFFER_SIZE                 1500

// afther that amount of milliseconds a timeout in the initialisation occured and a message will be added to the log and trace view with details to the actual step
#define T_INIT_TIMEOUT                  30000

// minimal needed mem size for SDO data transfer
#define MIN_SDO_MEMSIZE                   16

// minimal needed mem size for PDO data transfer
#define MIN_PDO_MEMSIZE                   60

// size of SDO Data header (size of WriteCnt + size of ReadCnt)
#define SDO_BLOCK_HEADERSIZE               4

// if defined then RX and TX SDO data recording is active
//#define SDO_DATA_RECORDING                

#ifdef SDO_DATA_RECORDING
  #pragma message("Safety SDO Recording activated! Needs more Ressources in Cyclic Priority!")
#endif

//modultype of safety modules (none-safety modules have type 0)
#define SM_TYPE_SAFETY_MODULE                1

// size of temporary memory in bytes (used if memory is needed dynamically)
#define SIZE_TEMP_MEMORY    2000

//*****************************************************************************
//** TYPES                                                                   **
//*****************************************************************************

	TYPE
	  t_e_ModuleType :
	  (
	    _NotUsed:=0,
      _CSCP01x:=100,
	    _CSDI16x:=101,
	    _CSTO08x:=102,
	    _SCP010:=128,
	    _SCP011:=1000,
	    _MS011:=1145,
	    _VBC021Master:=300,
	    _VBC021Slave:=301,
	    _VMC052:=302,
	    _VaranManager4VMC:=303
	  )$UDINT;
#pragma pack(push, 1)
    //SvePau 12.01.2011
    t_SdoBlock      : STRUCT
	    pRingBuffer   : pVoid;
      WrPlace       : UINT;
      RdPlace       : UINT;
      bytesInBuffer : UINT;
      MyPara        : CmdStruct; 
      actualRead    : UINT;
      SplitInfo     : BSINT
	    [
	    1 length,
      2 data,
      3 reserved1,
      4 lengthNext,
      5 dataNext,
      6 reserved2,
	    ];
      OldReadedWriteCnt   : UINT;
      ReadLength          : UINT;
      WrongAckCtr         : USINT;
      OldSynchron         : DINT;
      DataToEnd           : UINT;
      RestOfData          : UINT;
      BytesInSplitBuffer  : UINT;
      SDOBuffer           : SDOCmdStruct;
      DataBuffer          : ^void;
      MemorySizeInfo      : t_MemSizeInfo;
      SDOLength           : UINT;
      SDODataLength       : UINT;
      SDOCmd              : UINT;
      TimeMeasure         : ARRAY [0..2] OF t_TimeStruct;
      InitDone            : bool;
#ifdef SDO_DATA_RECORDING
      Recorder            : t_SdoDataRecording;
#endif
	  END_STRUCT;    
    SDOCmdStruct    : STRUCT
      uiCmd         : UINT;
      aPara         : ARRAY [0..(SDO_BUFFER_SIZE/4)] OF DINT;
    END_STRUCT;
    t_AsyCMDType :
    (
      ___EMPTY___                 :=0,
      START_TIME_SYNC             :=CMD_SM_START_TIME_SYNC,
      SET_NEW_SYNC_MODE           :=CMD_SM_SET_NEW_SYNC_MODE,
      INIT_FINISHED               :=CMD_SM_INIT_FINISHED,
      SDO_TO_MODULE               :=CMD_SM_SDO_TO_MODULE,
      TDO_TO_MODULE               :=CMD_SM_TDO_TO_MODULE,
      GET_SAFETY_NUMBER           :=CMD_SM_GET_SAFETY_NUMBER,
      ADD_INPUT_PDO               :=CMD_SM_ADD_INPUT_PDO,
      ADD_OUTPUT_PDO              :=CMD_SM_ADD_OUTPUT_PDO,
      REMOVE_INPUT_PDO            :=CMD_SM_REMOVE_INPUT_PDO,
      SYNC_CHECK                  :=CMD_SM_SYNC_CHECK,
      ITF_POSSIBLE                :=CMD_SM_ITF_POSSIBLE,
      PDO_MEM_USAGE_WR            :=CMD_SM_PDO_MEM_USAGE_WR,
      PDO_MEM_USAGE_RD            :=CMD_SM_PDO_MEM_USAGE_RD,
      PDO_COPY_MODE               :=CMD_SM_PDO_COPY_MODE,
      TIME_SYNC_FINISHED          :=CMD_SM_TIME_SYNC_FINISHED,
      NEW_SAFETY_PROJECT          :=CMD_SM_NEW_SAFETY_PROJECT,
      ADD_MODULE                  :=CMD_SM_ADD_MODULE,
      ADD_MODULE_INFO             :=CMD_SM_ADD_MODULE_INFO,
      SDO_TO_MANAGER              :=CMD_SM_SDO_TO_MANAGER,
      TDO_TO_MANAGER              :=CMD_SM_TDO_TO_MANAGER,
      CPU_CFG_TO_MANAGER          :=CMD_SM_CPU_CFG_TO_MANAGER,
      UNSAFE_CFG_TO_MANAGER       :=CMD_SM_UNSAFE_CFG_TO_MANAGER,
      NEW_CFG_TYPE                :=CMD_SM_NEW_CFG_TYPE,
      DISCONNECT                  :=CMD_SM_DISCONNECT,
      ADD_MANAGING_INFO           :=CMD_SM_ADD_MANAGING_INFO,
      TDO_TOKEN_FWD               :=CMD_SM_TDO_TOKEN_FWD,
      DOMAIN_NR_SEND              :=CMD_SM_DOMAIN_NR_SEND,
      DOMAIN_NR_FWD               :=CMD_SM_DOMAIN_NR_FWD,
      STOP_AND_FLUSH_CFG          :=CMD_SM_STOP_AND_FLUSH_CFG,
      STOPPED_AND_FLUSHED         :=CMD_SM_STOPPED_AND_FLUSHED,
      SPREAD_CFG_AND_START        :=CMD_SM_SPREAD_CFG_AND_START,
      SUBDOMAINS_SYNCHRON         :=CMD_SM_SUBDOMAINS_SYNCHRON,
      CPU_CONFIG_TO_MASTER        :=CMD_SM_CPU_CONFIG_TO_MASTER,
      PDO_MAPPING_BROADCAST       :=CMD_SM_PDO_MAPPING_BROADCAST,
      PDO_MAPPING_ACK             :=CMD_SM_PDO_MAPPING_ACK,
      PDO_SAFETYNBR_2_DOM         :=CMD_SM_PDO_SAFETYNBR_2_DOM,
      SDO_INIT_INFORMATION        :=CMD_SM_SDO_INIT_INFORMATION,
      TOP_SDO_TO_MASTER           :=CMD_SM_TOP_SDO_TO_MASTER,
      TOP_SDO_TO_MODULE           :=CMD_SM_TOP_SDO_TO_MODULE,
      SEND_UNSAFE_VAR_CFG         :=CMD_SM_SEND_UNSAFE_VAR_CFG,
      UNSAFE_VAR_CFG_ACK          :=CMD_SM_UNSAFE_VAR_CFG_ACK,
      UNSAFE_VAR_NEW_VAL          :=CMD_SM_UNSAFE_VAR_NEW_VAL,
      SEND_SUBDOMAIN_SYNC         :=CMD_SM_SEND_SUBDOMAIN_SYNC,
      SEND_DOMAIN_ROUTING_INFO    :=CMD_SEND_DOMAIN_ROUTING_INFO,
      FIRST_CONNECT_READY         :=CMD_SM_FIRST_CONNECT_READY,
      IF_MODULE_INFO              :=CMD_SM_IF_MODULE_INFO
    )$UINT;
#ifdef SDO_DATA_RECORDING
   t_SdoDataRecordingEntry    : STRUCT
      uiCmd                   : t_AsyCMDType;
      uiLength                : UINT;
      bIsTx                   : BOOL;
      udTimeSinceLast         : UDINT;
      udTimeSinceStart        : UDINT;
	 END_STRUCT;
   t_SdoDataRecording : STRUCT
      Index           : USINT;
      Buffer          : ARRAY [0..99] OF t_SdoDataRecordingEntry;
      StartTime       : UDINT; 
      FirstRecorded   : bool;
   END_STRUCT;
#else
   t_SdoDataRecording : USINT;
#endif
    t_TimeStruct  : STRUCT
      Start       : UDINT;
	    Stop        : UDINT;
      Diff        : UDINT;
      Maximum     : UDINT;
      Minimum     : UDINT;
	  END_STRUCT;
    t_SdoBlockHeader  : STRUCT
      WriteCnt        : UINT;
	    ReadCnt         : UINT;
	  END_STRUCT;
    t_MemSizeInfo         : STRUCT
      SafetyIsoMemRead    : UINT;
      SafetyIsoMemWrite   : UINT;
	    SafetyAsyMemRead    : UINT;
      SafetyAsyMemWrite   : UINT;
	  END_STRUCT;
	  t_AsyMemXChange : STRUCT
	    SDOHeader     : t_SdoBlockHeader;
	    pSDOData      : ^void;
      Length        : UINT;
	  END_STRUCT;
	  t_IsoMemXChange : STRUCT
	    WriteCnt : UINT;
	    StateInfo : BSINT
	    [
	    1 TimeSyncToken,
      2 TDOInside,
      3 InterfaceFramesPossible,
	    ];
	    Length : USINT;
	    TDOData : ARRAY [0..23] OF USINT;
      PDOData : ARRAY [0..991] OF USINT;
	  END_STRUCT;
	  t_s_user_object_data : STRUCT
	    udAsyReadLength : UDINT;
	    udAsyWriteLength : UDINT;
	    udIsoReadLength : UDINT;
	    udIsoWriteLength : UDINT;
	    pAsyReadData : ^void;
	    pAsyWriteData : ^void;
	    pIsoReadData : ^void;
	    pIsoWriteData : ^void;
	  END_STRUCT;
    t_PdoCfgInfo : BSINT
	    [
	    1 IsInterfacePDO,
      2 IsOptional,
      3 DoublePDOEntry,
      4 IFBroadCast,
      5 VirtualPDO,
      6 VirtualPDOsCreated,
	    ];
    t_SlaveCfgInfo : BSINT
	    [
	    1 IsOptional,
	    2 IsInterface,
	    ];
	  t_PdoCfg : STRUCT
      PDO_ID : USINT;
      PdoLen : USINT;
	    Info : t_PdoCfgInfo;
      InterfaceCRC : HDINT;
	    SourcePathLen : UINT;
	    pSourcePath : ^USINT;
	    DestPathLen : UINT;
	    pDestPath : ^USINT;
	  END_STRUCT;
	  t_SlaveCfg : STRUCT
	    Info : t_SlaveCfgInfo;
      InterfaceCRC : HDINT;
	    PathLen : UINT;
	    pPath : ^USINT;
      CompPathLen : UINT;
      pCompPath : ^USINT;
	  END_STRUCT;
    t_ModuleCfgInfo : BSINT
	    [
	    1 IsInterfaceSource,
      2 IsInterfaceDest,
      3 IsOptional,
	    ];
	  t_ModuleCfg : STRUCT
	    Info : t_ModuleCfgInfo;
      SafetyNbr : HDINT;
      InterfaceCRC : HDINT;
      DestCRCNo : USINT;
      pDestCRCs : ^HDINT;
	    PathLen : UINT;
	    pPath : ^USINT;
      CompPathLen : UINT;
      pCompPath : ^USINT;
      PdoOutLen : USINT;
	  END_STRUCT;
    t_ModuleListElem : STRUCT
      ModuleInfo : t_ModuleCfg;
      pNext : ^t_ModuleListElem;
    END_STRUCT;
    t_PdoListElem : STRUCT
      PdoInfo : t_PdoCfg;
      pNext : ^t_PdoListElem;
    END_STRUCT;
    t_SlaveListElem : STRUCT
      SlaveInfo : t_SlaveCfg;
      pNext : ^t_SlaveListElem;
    END_STRUCT;
    t_CfgListElem : STRUCT
      SafetyNbr : HDINT;
      pFirstModuleCfg : ^t_ModuleListElem;
      pFirstPdoCfg : ^t_PdoListElem;
      pFirstSlaveCfg : ^t_SlaveListElem;
      pNext : ^t_CfgListElem;
    END_STRUCT;
    t_LocalCfgListElem : STRUCT
      SafetyNbr : HDINT;
      ConfigSent2Master : BOOL;
      ConfigSize : UINT;
      pConfig : ^void;
      pNext : ^t_LocalCfgListElem;
    END_STRUCT;
	  t_SourceDest :
	  (
	    SourceDest_None:=0,
      SourceDest_IsSource:=1,
	    SourceDest_IsDest:=2,
      SourceDest_IsSourceAndDest:=3,
      SourceDest_IsForwarder:=4
	  )$USINT;
	  t_UnsafeVarType :
	  (
	    NormalUnsafe:=0,
      BDINTOutput:=1,
      ExternalInput:=2,
	    ExternalOutput:=3,
      ExternalBDINTOutput:=4,
      ExternalInputLocalSvr:=5,
	    ExternalOutputLocalSvr:=6,
      ExternalBDINTOutputLocalSvr:=7
	  )$USINT;
	  t_ConfigStateType :
	  (
	    ConfigState_NotInitialized:=0,  // <Type Comment="IO Modules got no config" Name="t_ConfigStateType.ConfigState_NotInitialized"/>
      ConfigState_Old:=1,
      ConfigState_New:=2
	  )$USINT;
	  t_SafetyFrameType :
	  (
	    SSDO_MOD:=0,
      SSDO_CFG:=1,
      SSDO_MOD_TP:=2,
      SSDO_CFG_TP:=3,
      SDO_STD:=5,
      SPDO_LORES:=8,
      STDO_LORES:=16,
      SPDO_INTERFACE_LORES:=32,
      SPDO_HIRES:=72,
      STDO_HIRES:=80,
      SPDO_INTERFACE_HIRES:=96,
      SSDO_MOD_RSP:=128,
      SSDO_CFG_RSP:=129,
      SDO_STD_RSP:=133,
      STDO_LORES_RSP:=144,
      STDO_HIRES_RSP:=208
	  )$USINT;
    t_SDOStdHeader    : STRUCT
      CRC         : UDINT;
      Cmd         : USINT;
      Typ         : t_SafetyFrameType;
      SeqNr       : USINT;
      Len         : USINT;
    END_STRUCT;
#pragma pack(pop)
  END_TYPE 
#endif
