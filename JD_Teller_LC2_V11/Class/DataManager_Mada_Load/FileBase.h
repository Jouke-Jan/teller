(*
 *
 *)

#ifndef cMaxAsciiLine
	#define	cMaxAsciiLine	4096 // 1024			// Max length of an ASCII line ( 1024)
#endif

#ifndef cSeparator
  #define cSeparator		';'			// Separator between two elements
#endif

#ifndef cTestChar
  #define cTestChar		' '			// Test character
#endif

(* ===============================================================================================
 * functions of the string library
 * ===============================================================================================
 * #define STRING_STR
 *
 *	FUNCTION GLOBAL _strcpy
 *		VAR_INPUT	dest            : ^CHAR;
 *					src             : ^CHAR;
 *	FUNCTION GLOBAL _strcat
 *		VAR_INPUT	dest            : ^CHAR;
 *	 				src             : ^CHAR;
 *	FUNCTION GLOBAL _memmove
 *		VAR_INPUT	dest            : ^void;
 *					src             : ^void;
 *					anz             : UDINT;
 *	FUNCTION GLOBAL _strupr
 *		VAR_INPUT	str				: ^Char;
 *	FUNCTION GLOBAL _memicmp
 *		VAR_INPUT	str1            : ^void;
 *					str2            : ^void;
 *					len             : UDINT;
 *		VAR_OUTPUT	result          : UDINT;
 *	FUNCTION GLOBAL _strcmp
 *		VAR_INPUT	str1            : ^char;
 *					str2            : ^char;
 *		VAR_OUTPUT	retcode         : UINT;
 *	FUNCTION GLOBAL _stricmp
 *		VAR_INPUT	str1            : ^char;
 *					str2            : ^char;
 *		VAR_OUTPUT	retcode         : UDINT;
 *	FUNCTION GLOBAL _strchr
 *		VAR_INPUT	src             : ^char;
 *					chr             : CHAR;
 *		VAR_OUTPUT	dest            : ^CHAR;
 *	FUNCTION GLOBAL _strlen
 *		VAR_INPUT	src             : ^CHAR;
 *		VAR_OUTPUT	retcode         : UDINT;
 *	FUNCTION GLOBAL _memcmp
 *		VAR_INPUT	ptr1			: ^void;
 *					ptr2			: ^void;
 *					cntr			: UDINT;
 *		VAR_OUTPUT	notequal		: UDINT;
 *	FUNCTION GLOBAL _strncpy
 *		VAR_INPUT	dest            : ^CHAR;
 *					src             : ^CHAR;
 *					max             : UDINT;
 *	FUNCTION GLOBAL _memcpy
 *		VAR_INPUT	ptr1			: ^void;
 *					ptr2			: ^void;
 *					cntr			: UDINT;
 *	FUNCTION GLOBAL _memset
 *		VAR_INPUT	dest			: ^void;
 *					usByte			: USINT;
 *					cntr			: UDINT;
 *	FUNCTION GLOBAL _itoa
 *		VAR_INPUT	udNumber		: UDINT;
 *					pString			: ^CHAR;
 *
 *)