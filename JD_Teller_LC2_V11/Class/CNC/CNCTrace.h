

//Trace starten   -  UserGroup 0
//#define CNCTRACE


//Start- & Stopmarken für Trace
#define TRACE_START     ((TRECGRP_USER0 SHL 16) OR 16#01)
#define TRACE_STOP     (((TRECGRP_USER0 SHL 16) OR 16#01) OR 16#0100)

//-----------
// Kennungen 
//-----------

//Tasks
#define TraceCNCRt             1
#define TraceCNCCy             2
#define TraceRTtoController    3

//Private Methoden
#define TraceJerkFilt         10
#define TraceMoveAx           11
#define TraceMoveFunc         12
#define TraceFollow           13





