//HFILTER:1
#ifndef VARAN_DATAMOVER_H
//HFILTER:
//HFILTER:2
#pragma once
//HFILTER:
#define VARAN_DATAMOVER_H


#define VM_DATAMOVER_ISO_TIME		//if activated ISO Time is read (needs a DataObject)

//-------------------------------------------------------------------------------------------------
//not for user
#define VM_DATAMOVER_HEADER			16#100
#define VM_LIST_CONFIG_OFFSET		16#20
#define VM_DATAMOVER_DIAS_ALIVE		16#F4
#define VM_DATAMOVER_DA_OFFSET		16#FA
#define VM_DATAMOVER_CODE_OFFEST	16#80

//opcodes for data mover
#define VM_DATAMOVER_END_OP			0
#define VM_DATAMOVER_MOVE_OP		1
#define VM_DATAMOVER_MOVE_EN_OP		2
#define VM_DATAMOVER_DELAY_OP		3

#define VM_DATAMOVER_MAX_DO			8

#ifndef _T_DA_LOCK_DEFS
#define _T_DA_LOCK_DEFS
#define LOCK_DA						if ( p_SemaHandle <> NIL ) then	 To_Multitask.Wait( p_SemaHandle );	end_if
#define UNLOCK_DA					if ( p_SemaHandle <> NIL ) then	 To_Multitask.Signal( p_SemaHandle );	end_if
#endif // _T_DA_LOCK_DEFS


//HFILTER:1
#endif
//HFILTER:
