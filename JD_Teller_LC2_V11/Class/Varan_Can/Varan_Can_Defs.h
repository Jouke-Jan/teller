//HFILTER:1
#ifndef VARAN_CAN_DEFS_H
//HFILTER:
//HFILTER:2
#pragma once
//HFILTER:
#define VARAN_CAN_DEFS_H

//***********************************************************************************
//** Varan - Can Headerfile     	                                               **
//***********************************************************************************

//***********************************************
//** Defines                                   **
//***********************************************
#define VARAN_CAN_GLOBAL_CONFIG_OFFSET		16#1000

#define VARAN_CAN_ISO_TX_OFFSET_CONTROL		16#0
#define VARAN_CAN_ISO_TX_OFFSET_DATA		16#200
#define VARAN_CAN_ISO_MAX_TX_OBJ			14

#define VARAN_CAN_ISO_RX_OFFSET_CONTROL		16#800
#define VARAN_CAN_ISO_RX_OFFSET_DATA		16#A00
#define VARAN_CAN_ISO_MAX_RX_OBJ			14

#define VARAN_CAN_ISO_RX_HANDLE_MASK		16#0001_0000
#define VARAN_CAN_ISO_TX_HANDLE_MASK		16#0002_0000


//HFILTER:1
#endif
//HFILTER:
