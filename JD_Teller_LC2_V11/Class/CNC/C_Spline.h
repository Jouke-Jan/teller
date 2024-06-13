#ifndef _C_SPLINE_H_
  #define _C_SPLINE_H_
 

FUNCTION GLOBAL __cdecl XT_Spline_5_Order
  VAR_INPUT
  	a1        : REAL;
  	a2        : REAL;
  	a3        : REAL;
  	a4        : REAL;
  	a5        : REAL;
  	tu        : REAL;
  	td        : REAL;   
  	t         : REAL;     
    ptr_retXt : ^REAL;	
  END_VAR;
 
FUNCTION GLOBAL __cdecl XT_Spline_4_Order
  VAR_INPUT
  	a1        : REAL;
  	a2        : REAL;
  	a3        : REAL;
  	a4        : REAL;
  	tu        : REAL;
  	td        : REAL;   
  	t         : REAL;     
    ptr_retXt : ^REAL;	
  END_VAR; 
  
FUNCTION GLOBAL __cdecl XT_Spline_3_Order
  VAR_INPUT
  	a1        : REAL;
  	a2        : REAL;
  	a3        : REAL;
  	tu        : REAL;
  	td        : REAL;   
  	t         : REAL;     
    ptr_retXt : ^REAL;	
  END_VAR;
  
FUNCTION GLOBAL __cdecl XT_Spline_2_Order
  VAR_INPUT
  	a1        : REAL;
  	a2        : REAL;
  	tu        : REAL;
  	td        : REAL;   
  	t         : REAL;     
    ptr_retXt : ^REAL;
  END_VAR;   
  

FUNCTION GLOBAL __cdecl VT_Spline_5_Order
  VAR_INPUT
  	a1        : REAL;
  	a2        : REAL;
  	a3        : REAL;
  	a4        : REAL;
  	a5        : REAL;
  	tu        : REAL;
  	td        : REAL;   
  	t         : REAL;     
    ptr_retXt : ^REAL;	
  END_VAR; 
  
FUNCTION GLOBAL __cdecl VT_Spline_4_Order
  VAR_INPUT
  	a1        : REAL;
  	a2        : REAL;
  	a3        : REAL;
  	a4        : REAL;
  	tu        : REAL;
  	td        : REAL;   
  	t         : REAL;     
    ptr_retXt : ^REAL;	
  END_VAR;   
  
FUNCTION GLOBAL __cdecl VT_Spline_3_Order
  VAR_INPUT
  	a1        : REAL;
  	a2        : REAL;
  	a3        : REAL;
  	tu        : REAL;
  	td        : REAL;   
  	t         : REAL;     
    ptr_retXt : ^REAL;	
  END_VAR; 
  
FUNCTION GLOBAL __cdecl VT_Spline_2_Order
  VAR_INPUT
  	a1        : REAL;
  	a2        : REAL;
  	tu        : REAL;
  	td        : REAL;   
  	t         : REAL;     
    ptr_retXt : ^REAL;
  END_VAR;   
  
FUNCTION GLOBAL __cdecl ACC_Spline_5_Order
  VAR_INPUT
  	a1        : REAL;
  	a2        : REAL;
  	a3        : REAL;
  	a4        : REAL;
  	a5        : REAL;
  	tu        : REAL;
  	td        : REAL;   
  	t         : REAL;     
    ptr_retXt : ^REAL;	
  END_VAR; 
  
FUNCTION GLOBAL __cdecl ACC_Spline_4_Order
  VAR_INPUT
  	a1        : REAL;
  	a2        : REAL;
  	a3        : REAL;
  	a4        : REAL;
  	tu        : REAL;
  	td        : REAL;   
  	t         : REAL;     
    ptr_retXt : ^REAL;	
  END_VAR;   
  
FUNCTION GLOBAL __cdecl ACC_Spline_3_Order
  VAR_INPUT
  	a1        : REAL;
  	a2        : REAL;
  	a3        : REAL;
  	tu        : REAL;
  	td        : REAL;   
  	t         : REAL;     
    ptr_retXt : ^REAL;	
  END_VAR;
  
FUNCTION GLOBAL __cdecl ACC_Spline_2_Order
  VAR_INPUT
  	a1        : REAL;
  	a2        : REAL;
  	t         : REAL;     
    ptr_retXt : ^REAL;	
  END_VAR;   

#endif
