//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "InterpolateXY_D"
	Revision           = "1.2"
	GUID               = "{7284C29F-20A2-4192-9E70-EBC61DC83831}"
	RealtimeTask       = "false"
	CyclicTask         = "false"
	BackgroundTask     = "false"
	Sigmatek           = "true"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	IconPath           = ".\Class\InterpolateXY\interpol.ico"
	SharedCommandTable = "true"
	Objectsize         = "(338,120)"
	Comment            = "Class to interpolate a value [INT] with a table (with XY Tableformat and Bytevalues)&#13;&#10;&#13;&#10; *********************************************************************&#13;&#10; *        Class to interpolate a value into a table&#13;&#10; * ------------------------------------------------------------------&#13;&#10; * This function supports interpolating of values in a curve which&#13;&#10; *  is defined in a TABLE. Each X value, which will be inputed,&#13;&#10; *  is defined by a Y value.&#13;&#10; *  !!! The X values in the table have to grow up.        !!!&#13;&#10; *  !!! The smallest starts, and it ends with the biggest !!!&#13;&#10; *               X            Y&#13;&#10; * EXAMPLE:  -1000$INT,    2000$INT,&#13;&#10; *           - 500$INT,    1000$INT,&#13;&#10; *           - 200$INT,     200$INT,&#13;&#10; *             100$INT,     100$INT,&#13;&#10; *             300$INT,   - 300$INT,&#13;&#10; *                    !!! ATTENTION !!!&#13;&#10; *  There has to be no X value,which is twice declared&#13;&#10; * ------------------------------------------------------------------&#13;&#10; *&#13;&#10; * CLIENT : value  : value to be interpolated&#13;&#10; *          table  : ptr of table&#13;&#10; *&#13;&#10; * Server : result :  Error_S=0 : interpolated value&#13;&#10; *                    Error_S=1 :   -32768&#13;&#10; *           Error_S: 0-&gt; OK&#13;&#10; *                    1-&gt;value to be interpolated out of Tablerange&#13;&#10; * ------------------------------------------------------------------&#13;&#10; *   created   :   RM    :   KW46/01&#13;&#10; *********************************************************************">
	<Channels>
		<Server Name="Error_S" GUID="{74E20400-112E-4116-8421-76A82FD1D726}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false" Comment="0-&gt; OK     &#13;&#10;1-&gt;value to be interpolated out of Tablerange"/>
		<Server Name="result" GUID="{DF7541ED-434F-4D0F-91DF-206531F6D792}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false" Comment="result of the interpolation&#13;&#10;if value out of tablerange &#13;&#10;result : -32768"/>
		<Client Name="Table" Required="true" Internal="false" Comment="Pointer of Table"/>
		<Client Name="value" Required="true" Internal="false" Comment="The value to be interpolated"/>
	</Channels>
	<RevDoku>
		<Owner Company="Sigmatek"/>
		<Dokumentation Revision="1.2" Date="30.04.09" Author="h�tant" Company="Sigmatek" Description="Changed LSL_TARGETARCH_ARM to _LSL_TARGETARCH_ARM"/>
		<Dokumentation Revision="1.1" Date="04.02.09" Author="h�tant" Company="Sigmatek" Description="AWL to ST (to guarantee compatibility for other processors) "/>
	</RevDoku>
</Class>
*)
InterpolateXY_D : CLASS
  //Servers:
	result 	: SvrChCmd_DINT;
	Error_S 	: SvrCh_DINT;
  //Clients:
	value 	: CltCh_DINT;
	Table 	: CltCh_DINT;
  //Variables:
		lower_y 	: DINT;
		lower_x 	: DINT;
		upper_y 	: DINT;
		upper_x 	: DINT;
  //Functions:
				//! <Function Comment="// *********************************************************************&#13;&#10;// *        Function to interpolate a value into a table&#13;&#10;// * ------------------------------------------------------------------&#13;&#10;// * This function supports interpolating of values in a curve which&#13;&#10;// *  is defined in a TABLE. Each X value, which will be inputed,&#13;&#10;// *  is defined by a Y value.&#13;&#10;// *  !!! The X values in the table have to grow up.        !!!&#13;&#10;// *  !!! The smallest starts, and it ends with the biggest !!!&#13;&#10;// *               X            Y&#13;&#10;// * EXAMPLE:  -1000$INT,    2000$INT,&#13;&#10;// *           - 500$INT,    1000$INT,&#13;&#10;// *           - 200$INT,     200$INT,&#13;&#10;// *             100$INT,     100$INT,&#13;&#10;// *             300$INT,   - 300$INT,&#13;&#10;// *                    !!! ATTENTION !!!&#13;&#10;// *  There has to be no X value,which is twice declared&#13;&#10;// * ------------------------------------------------------------------&#13;&#10;//  INPUT_VAL   pTable    : ^DINT : pointer to the table&#13;&#10;//              value_in  : INT  : Wert f�r Interpolation&#13;&#10;//&#13;&#10;//  OUTPUT_VAL  value_out : INT  : interpolated value&#13;&#10;// *********************************************************************&#13;&#10;&#13;&#10;&#13;&#10;" Name="interpolXY_D"/>
	FUNCTION AWL GLOBAL interpolXY_D
		VAR_INPUT
			in_value 	: DINT;			//! <Variable Comment="value that should be interpolated" Name="interpolXY_D.in_value"/>
			pTable 	: ^DINT;			//! <Variable Comment="pointer to the table" Name="interpolXY_D.pTable"/>
		END_VAR
		VAR_OUTPUT
			out_value 	: DINT;			//! <Variable Comment="the interpolated value" Name="interpolXY_D.out_value"/>
		END_VAR;
	
	FUNCTION findValue
		VAR_INPUT
			parameter 	: ^DINT;
			in_value 	: DINT;
			pTable 	: ^DINT;
		END_VAR;
				//! <Function Comment=" *********************************************************************&#13;&#10; * CLIENT : value : value to be interpolated&#13;&#10; *          table : ptr of table&#13;&#10; *&#13;&#10; * Server :  result : Error_S=0:interpolated value&#13;&#10; *                    Error_S=1:-32768&#13;&#10; *           Error_S : 0-&gt; OK&#13;&#10; *                     1-&gt; in_value not in the field of the table&#13;&#10; *&#13;&#10; * ------------------------------------------------------------------&#13;&#10; *   created   :   RM    :   KW46/01&#13;&#10; *********************************************************************&#13;&#10;&#13;&#10; **********************************************************************&#13;&#10; *  CLIENT:&#13;&#10; *   value : Der zu interpolierende Wert&#13;&#10; *   table : Pointer auf die Tabelle mit den Interpolationswerten X Y&#13;&#10; *&#13;&#10; *  SERVER:&#13;&#10; *   result : Error_S=0:interpolierter Wert&#13;&#10; *             Error_S=1:-32768&#13;&#10; *   Error_S: 0-&gt; OK&#13;&#10; *             1-&gt; in_value nicht im Tabellenbereich&#13;&#10; **********************************************************************&#13;&#10;" Name="result.Read"/>
	FUNCTION VIRTUAL GLOBAL result::Read
		VAR_OUTPUT
			output (EAX) 	: DINT;
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

//}}LSL_DECLARATION


FUNCTION GLOBAL TAB InterpolateXY_D::@CT_
0$UINT,
2#0100000000000000$UINT, //TY_INTERPOLATEXY_D
1$UINT, 2$UINT, (SIZEOF(::InterpolateXY_D))$UINT, 
2$UINT, 2$UINT, 0$UINT, 
TO_UDINT(2724379695), "InterpolateXY_D", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::InterpolateXY_D.result.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(3817997973), "result", 
(::InterpolateXY_D.Error_S.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3955508119), "Error_S", 
//Clients:
(::InterpolateXY_D.value.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(3928201860), "value", 
(::InterpolateXY_D.Table.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(24989174), "Table", 
END_FUNCTION


#define USER_CNT_InterpolateXY_D 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_InterpolateXY_D] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION InterpolateXY_D::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_InterpolateXY_D, pCmd := #vmt.CmdTable);
	vmt.CmdTable.Read		:= #Read();
	vmt.CmdTable.Write		:= #M_WR_DIRECT();
	result.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF result.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	Error_S.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF Error_S.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION


//*********************Inserted from .\code\C_InterpolateXY_D.st*********************



 



//[#ENGLISH]
// *********************************************************************
// *      Class to interpolate a value into a table
// * ------------------------------------------------------------------
// * This function supports interpolating of values in a curve which
// *  is defined in a TABLE. Each X value, which will be inputed,
// *  is defined by a Y value.
// *  !!! The X values in the table have to grow up.        !!!
// *  !!! The smallest starts, and it ends with the biggest !!!
// *               X            Y
// * EXAMPLE:  -1000$DINT,    2000$DINT,
// *           - 500$DINT,    1000$DINT,
// *           - 200$DINT,     200$DINT,
// *             100$DINT,     100$DINT,
// *             300$DINT,   - 300$DINT,
// *                    !!! ATTENTION !!!
// *  There has to be no X value,which is twice declared
// * ------------------------------------------------------------------
// *
// * CLIENT : value: value to be interpolated
// *          table: ptr of table
// *
// *   result : Error_S=0:Interpolated value
// *            Error_S=1:-2147483648
// *   Error_S : 0-> OK
// *             1-> in_value not in the field of the table
// * ------------------------------------------------------------------
// * 		created			:		 RM  	 : 		KW46/01
// *********************************************************************
//[#DEUTSCH]
// **********************************************************************
// * Interpolationsklasse mit X und Y St�tzpunkttabelle
// *  f�r  !!!!  DINT  !!!!  Werte
// * ------------------------------------------------------------------
// * Das interpolationsmakro INTERPOLATE XY unterst�tzt das Interpolieren
// * von Werten in einer St�tzpunktkurve. Diese Kurve ist durch
// * St�tzpunkte definiert, welche in einer Tabelle �bergeben werden.
// * Jedem �bergebenen Wert X wird ein Wert Y zugewiesen.
// * !!! Die Werte X m�ssen Aritmetisch vom Kleinsten beginnend !!!
// * !!!  bis zum Gr��ten aufsteigend eingegeben werden.        !!!
// *         X             Y
// * z.B.  -1000$DINT,    2000$DINT,
// *       - 500$DINT,    1000$DINT,
// *       - 200$DINT,     200$DINT,
// *         100$DINT,     100$DINT,
// *         300$DINT,   - 300$DINT,
// * !!! Achtung !!!
// * Es darf keine X Gr��e doppelt deklariert sein.
// * ------------------------------------------------------------------
// *  CLIENT:
// *   value   : Der zu interpolierende Wert
// *   table   : Pointer auf die Tabelle mit den Interpolationswerten X Y
// *
// *  SERVER:
// *   result : Error_S=0:Interpolierter Wert
// *            Error_S=1:-2147483648
// *   Error_S : 0-> OK
// *             1-> in_value nicht im Tabellenbereich
// **********************************************************************


//[#ENGLISH]
// *********************************************************************
// *        Function to interpolate a value into a table
// * ------------------------------------------------------------------
// * This function supports interpolating of values in a curve which
// *  is defined in a TABLE. Each X value, which will be inputed,
// *  is defined by a Y value.
// *  !!! The X values in the table have to grow up.        !!!
// *  !!! The smallest starts, and it ends with the biggest !!!
// *               X            Y
// * EXAMPLE:  -1000$INT,    2000$INT,
// *           - 500$INT,    1000$INT,
// *           - 200$INT,     200$INT,
// *             100$INT,     100$INT,
// *             300$INT,   - 300$INT,
// *                    !!! ATTENTION !!!
// *  There has to be no X value,which is twice declared
// * ------------------------------------------------------------------
//  INPUT_VAL   pTable 	  : ^DINT : pointer to the table
//              value_in  : DINT  : Wert f�r Interpolation
//
//  OUTPUT_VAL  value_out : DINT  : interpolated value
// *********************************************************************

FUNCTION VIRTUAL GLOBAL interpolateXY_D::Read
VAR_OUTPUT
	output		: DINT;
END_VAR

	value   := value.read();   // reading clients
    Table := Table.read();
    
	// interpolate
    result := interpolXY_D(in_value:=value, pTable:=Table$^DINT);
	output   := result;

END_FUNCTION //VIRTUAL GLOBAL interpolateXY_D::Read

#ifdef _LSL_TARGETARCH_ARM

FUNCTION GLOBAL InterpolateXY_D::interpolXY_D
	VAR_INPUT
		in_value 	: DINT;
		pTable 	: ^DINT;
	END_VAR
	VAR_OUTPUT
		out_value 	: DINT;
	END_VAR
  VAR
    i              : ^DINT;
    len            :  DINT;
    last_v,first_v :  DINT;
    where          :  DINT;
  END_VAR
  
  i       := NIL;
  where   := 0;
  len     := pTable^;
  
// -------  find last and first value -------

  first_v := (pTable+4)^;
  last_v  := (pTable-4+len)^;

// -------  searching for lower value -------
  
  if last_v < in_value then
    Error_S    := 1;
    out_value  := -2147483648;
    return;
  end_if;
  
// -------  searching for upper value -------
  
  if first_v > in_value then
    Error_S    := 1;
    out_value  := -2147483648;
    return;
  end_if;
  
// -------  everything OK - calcualte value -------
 
  if in_value < (pTable+((len/16)*8)+4)^ then
    
   
    if in_value < (pTable+((len/32)*8)+4)^ then      
      where := 1;
    elsif in_value > (pTable+((len/32)*8)+4)^ then
      where := 2;
    else
      i := (pTable+((len/32)*8)+4);
    end_if;

  
  elsif in_value > (pTable+((len/16)*8)+4)^ then
    
    
    if in_value < (pTable+((len/32)*24)+4)^ then
      where := 3;
    elsif in_value > (pTable+((len/32)*24)+4)^ then
      where := 4;
    else      
      i := (pTable+((len/32)*24)+4);
    end_if;
    
  
  else
    
    
    i := (pTable+((len/16)*8)+4);
  
  
  end_if;
  
  
  
  case where of
  
  0: 
   
    if i <> NIL then
    
      lower_x := (i+0)^;
      lower_y := (i+4)^;
    
      upper_x := (i+8)^;
      upper_y := (i+12)^;
    
    end_if;
  
  1:
  
    findValue(pTable+4, in_value, pTable);
  
  2:
  
    findValue((pTable+((len/32)*8)+4), in_value, pTable);
  
  3:
  
    findValue((pTable+((len/32)*16)+4), in_value, pTable);
  
  4:
  
    findValue((pTable+((len/32)*24)+4), in_value, pTable);
  
  end_case;
  
  Error_S   := 0;
  out_value := (((in_value-lower_x)*(upper_y-lower_y))/(upper_x-lower_x)) + lower_y;


END_FUNCTION //VIRTUAL GLOBAL interpolateXY::interpolXY


FUNCTION InterpolateXY_D::findValue
	VAR_INPUT
		parameter 	: ^DINT;
		in_value 	  :  DINT;
		pTable 	    : ^DINT;
	END_VAR
  VAR
  	i           :  DINT;
  END_VAR
  
  i := 0;

  while (i+parameter)^ < in_value do   
    i += 8;  
  end_while;

  lower_x := (i-8+parameter)^;
  lower_y := (i-8+parameter+4)^;
  
  upper_x := (i-8+parameter+8)^;
  upper_y := (i-8+parameter+12)^;
  
END_FUNCTION

#else

FUNCTION AWL interpolateXY_D::interpolXY_D
VAR_INPUT
	in_value		: DINT;
	pTable		: ^DINT;
END_VAR
VAR_OUTPUT
	out_value		: DINT;
END_VAR

         PUSH		EAX
// -------  search a value -------

         L.EAX     in_value
         L.EDI     pTable
         L.ECX 	   (EDI)		// length of the table
                 
         CMP.EAX   (EDI+ECX-004)// checking if value in range of table
         JG       _WRONG         // last x value = the highest x
         
         ADD.EDI   004          // to the first value 
         CMP.EAX   (EDI)        // first x value = the lowest x
         JL       _WRONG   
		 
         L.D      Error_S, 000    // No Error
         SHR.ECX   00003        // div 8 = number of lines

 
_SUCHU   CMP.EAX   (EDI)         // looking for a higher value
         JE			   _EQUAL
				 JL        _WERTU
         ADD.EDI    00008
         LOOP      _SUCHU

_EQUAL   L.EAX			(EDI+4)
         S.EAX      out_value
         JMP       _ENDE

_WERTU   L.EAX     (EDI-008)     //lower x value
         S.EAX      lower_x
				 L.EAX     (EDI-004)     //lower y value
         S.EAX      lower_y

// -------  Weitersuchen nach oberen Wert -------
//       ich wei� ja schon meinen upper wert
//         L.EAX     in_value
//_SUCHO   L.EBX     (EDI)
//         S.EBX  	 t
//				 CMP.EAX   (EDI)
//         JL        _WERTO
//         ADD.EDI    00008
//         LOOP      _SUCHO       
//_WERTO   
         L.EAX     (EDI)		//upper x value	
         S.EAX      upper_x
         L.EAX     (EDI+004) //upper y value
         S.EAX      upper_y

// -----  get the Delta value_in to the bottom value

         L.EAX      in_value
         SUB.EAX    lower_x
         S.EAX      EBX            // lower line - upper line
         L.EAX      upper_y
         SUB.EAX    lower_y
         IMUL       EBX
         L.EBX      upper_x
         SUB.EBX    lower_x
         JZ					_WRONG
				 IDIV       EBX
         ADD.EAX    lower_y
         S.EAX      out_value
         JMP        _ENDE
_WRONG
         L.D        out_value, -2147483648 	// Wrong Value for interpolation 
         L.D        Error_S, 001    		// Error

_ENDE	   POP		    EAX

END_FUNCTION //VIRTUAL GLOBAL interpolateXY_D::interpolXY_D

#endif