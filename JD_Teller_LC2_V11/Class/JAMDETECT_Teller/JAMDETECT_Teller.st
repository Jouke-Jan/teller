//This file was generated by the LASAL2 CodeGenerator  -- 
//Please, do not edit this file (it might be overwritten by the next generator run)
//{{LSL_DECLARATION

(*!
<Class
	Name               = "JAMDETECT_Teller"
	Revision           = "1.0"
	GUID               = "{3E25A265-04AA-4CCC-8696-1F0CD672BFA8}"
	RealtimeTask       = "false"
	CyclicTask         = "true"
	BackgroundTask     = "false"
	Sigmatek           = "false"
	OSInterface        = "false"
	HighPriority       = "false"
	Automatic          = "false"
	UpdateMode         = "Prescan"
	SharedCommandTable = "true"
	Objectsize         = "(510,660)">
	<Channels>
		<Server Name="ClassSvr" GUID="{E4FBE5B8-0A24-4345-9182-24CBC9AA908C}" Visualized="false" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="HWTimer" GUID="{DC991BBB-9976-4051-BB75-5BCA33A29DDF}" Visualized="false" Initialize="false" WriteProtected="false" Retentive="false" Comment="Na een Jamdetect wordt het stopcircuit in de machine geschakeld&#13;&#10;&#13;&#10;Het reset signaal van de machine zit achter hetzelfde relais, dus is deze&#13;&#10;HW timer om weer te kunnen resetten.&#13;&#10;&#13;&#10;"/>
		<Server Name="JAM" GUID="{5BD2D944-808F-4AFC-A2B2-2155A905405C}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Server Name="Jam_Count" GUID="{86D665C3-D86B-4C5B-8BE5-D123907D296C}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="Jam_ID_Section" GUID="{C5D79E26-AD12-4E30-87F0-4B5B1C6C6EC8}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="Jam_ID_Unit" GUID="{65D8C1D3-52F7-4CF1-A52D-518693AA7A1E}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="Jam_RESET" GUID="{28A0B9B9-9B22-470B-848E-905DAE02E8E2}" Visualized="true" Initialize="false" WriteProtected="true" Retentive="false"/>
		<Server Name="JamReset" GUID="{4D4C1B3A-02F9-4FEB-8B5A-472E52B16C96}" Visualized="true" Initialize="false" WriteProtected="false" Retentive="false"/>
		<Client Name="cJam_Trombone" Required="true" Internal="false"/>
		<Client Name="cJamLSE" Required="true" Internal="false"/>
		<Client Name="cJamReset" Required="true" Internal="false"/>
		<Client Name="Jam01_01" Required="false" Internal="false" Comment="Jamdetect gedetecteerd in afzonderlijke class"/>
		<Client Name="Jam01_02" Required="false" Internal="false"/>
		<Client Name="Jam2HW" Required="false" Internal="false" Comment="Schakelen van Relais na Jam detect&#13;&#10;"/>
		<Client Name="Jam2Visu" Required="true" Internal="false" Comment="Naar Alarmclass na Jamdetect"/>
		<Client Name="JamKlok" Required="false" Internal="false"/>
		<Client Name="JamResetC001" Required="false" Internal="false" Comment="Na reset Alle Jam Classjes resetten"/>
		<Client Name="JamResetC002" Required="false" Internal="false"/>
		<Client Name="JamResetC003" Required="false" Internal="false"/>
		<Client Name="JamResetC004" Required="false" Internal="false"/>
		<Client Name="JamResetC005" Required="false" Internal="false"/>
		<Client Name="JamResetTanabe" Required="false" Internal="false" Comment="Jam reset via Start Buzzer in Tanabe&#13;&#10;of via START knop JD systeem. Via de server Jamreset&#13;&#10;kan ook een reset via het scherm gegeven worden. Dit werk parallel van elkaar&#13;&#10;"/>
	</Channels>
	<RevDoku>
		<Owner Company="JD" Author="SV"/>
		<Dokumentation Revision="1.0" Date="2014-09-04" Author="SV" Company="JD" Description="Kopie van JAMDETECT rev 1.1. Class is aangepast op teller etv. Clients en code zijn aangepast."/>
	</RevDoku>
</Class>
*)
JAMDETECT_Teller : CLASS
  //Servers:
	ClassSvr 	: SvrChCmd_DINT;
	JamReset 	: SvrCh_DINT;
	JAM 	: SvrCh_DINT;
	HWTimer 	: SvrCh_UDINT;
	Jam_RESET 	: SvrCh_DINT;
	Jam_ID_Section 	: SvrCh_DINT;
	Jam_ID_Unit 	: SvrCh_DINT;
	Jam_Count 	: SvrCh_DINT;
  //Clients:
	cJamReset 	: CltCh_DINT;
	cJam_Trombone 	: CltChCmd_RAMex;
	Jam01_01 	: CltCh_DINT;
	Jam01_02 	: CltCh_DINT;
	Jam2HW 	: CltCh_DINT;
	JamResetTanabe 	: CltCh_DINT;
	JamResetC001 	: CltCh_DINT;
	JamResetC002 	: CltCh_DINT;
	JamResetC003 	: CltCh_DINT;
	JamResetC004 	: CltCh_DINT;
	JamResetC005 	: CltCh_DINT;
	JamKlok 	: CltCh_DINT;
	cJamLSE 	: CltCh_DINT;
	Jam2Visu 	: CltCh_DINT;
  //Variables:
		CaseJam 	: DINT;
		timer 	: UDINT;
		CaseJamHWTimer 	: DINT;
		timer2 	: UDINT;
		initReset 	: DINT;
		JamMAS 	: ^tJamDetect;
		JamPrefold 	: ^tJamDetect;
		JamASectie 	: ^tJamDetect;
		JamBSectie 	: ^tJamDetect;
		JamFinalfold 	: ^tJamDetect;
		JamTrombone 	: ^tJamDetect;
		i 	: DINT;
		JamCountTeachIn 	: DINT;
		JamCountJam 	: DINT;
		JamDetPrevState 	: DINT;
  //Functions:
	
	FUNCTION VIRTUAL GLOBAL Init;
	
	FUNCTION VIRTUAL GLOBAL CyWork
		VAR_INPUT
			EAX 	: UDINT;
		END_VAR
		VAR_OUTPUT
			state (EAX) 	: UDINT;
		END_VAR;
  //Tables:
	FUNCTION @STD
		VAR_OUTPUT
			ret_code	: CONFSTATES;
		END_VAR;
	FUNCTION GLOBAL TAB @CT_;
END_CLASS;

#pragma usingLtd RAMex


//}}LSL_DECLARATION


FUNCTION GLOBAL TAB JAMDETECT_Teller::@CT_
0$UINT,
2#0100000000000010$UINT, //TY_JAMDETECT_TELLER
1$UINT, 0$UINT, (SIZEOF(::JAMDETECT_Teller))$UINT, 
8$UINT, 14$UINT, 0$UINT, 
TO_UDINT(2466162658), "JAMDETECT_Teller", //Class
TO_UDINT(0), 0, 0$UINT, 0$UINT, //Baseclass
//Servers:
(::JAMDETECT_Teller.ClassSvr.pMeth)$UINT, _CH_CMD$UINT, 2#0000000000000000$UINT, TO_UDINT(619352855), "ClassSvr", 
(::JAMDETECT_Teller.JamReset.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3979275475), "JamReset", 
(::JAMDETECT_Teller.JAM.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(1665372781), "JAM", 
(::JAMDETECT_Teller.HWTimer.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2695182232), "HWTimer", 
(::JAMDETECT_Teller.Jam_RESET.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(4050484031), "Jam_RESET", 
(::JAMDETECT_Teller.Jam_ID_Section.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(2234075135), "Jam_ID_Section", 
(::JAMDETECT_Teller.Jam_ID_Unit.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(3115353874), "Jam_ID_Unit", 
(::JAMDETECT_Teller.Jam_Count.pMeth)$UINT, _CH_SVR$UINT, 2#0000000000000000$UINT, TO_UDINT(606699536), "Jam_Count", 
//Clients:
(::JAMDETECT_Teller.cJamReset.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(2300188886), "cJamReset", 
(::JAMDETECT_Teller.cJam_Trombone.pCh)$UINT, _CH_CLT_OBJ$UINT, 2#0000000000000010$UINT, TO_UDINT(500337874), "cJam_Trombone", TO_UDINT(933570811), "RAMex", 1$UINT, 16$UINT, 
(::JAMDETECT_Teller.Jam01_01.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(2349538869), "Jam01_01", 
(::JAMDETECT_Teller.Jam01_02.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(352472975), "Jam01_02", 
(::JAMDETECT_Teller.Jam2HW.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(4188817684), "Jam2HW", 
(::JAMDETECT_Teller.JamResetTanabe.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(360519035), "JamResetTanabe", 
(::JAMDETECT_Teller.JamResetC001.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(1135825868), "JamResetC001", 
(::JAMDETECT_Teller.JamResetC002.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(3669623414), "JamResetC002", 
(::JAMDETECT_Teller.JamResetC003.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(2914857696), "JamResetC003", 
(::JAMDETECT_Teller.JamResetC004.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(869902147), "JamResetC004", 
(::JAMDETECT_Teller.JamResetC005.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(1155438549), "JamResetC005", 
(::JAMDETECT_Teller.JamKlok.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000000$UINT, TO_UDINT(3121270834), "JamKlok", 
(::JAMDETECT_Teller.cJamLSE.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(2751571877), "cJamLSE", 
(::JAMDETECT_Teller.Jam2Visu.pCh)$UINT, _CH_CLT_DATA$UINT, 2#0000000000000010$UINT, TO_UDINT(1285472264), "Jam2Visu", 
END_FUNCTION


#define USER_CNT_JAMDETECT_Teller 0

TYPE
	_LSL_STD_VMETH	: STRUCT
			CmdTable	: CMDMETH;
			UserFcts	: ARRAY[0..USER_CNT_JAMDETECT_Teller] OF ^Void;
	END_STRUCT;
END_TYPE

FUNCTION JAMDETECT_Teller::@STD
	VAR_OUTPUT
		ret_code	: CONFSTATES;
	END_VAR
	VAR
		vmt	: _LSL_STD_VMETH;
	END_VAR

	//Command Methods
	InitCmdTable (nCmd := nSTDCMD + USER_CNT_JAMDETECT_Teller, pCmd := #vmt.CmdTable);
	vmt.CmdTable.Init		:= #Init();
	vmt.CmdTable.CyWork		:= #CyWork();
	ClassSvr.pMeth		:= StoreCmd (pCmd := #vmt.CmdTable, SHARED);

	IF ClassSvr.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	JamReset.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF JamReset.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	JAM.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF JAM.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;
	HWTimer.pMeth			:= StoreMethod( #M_RD_DIRECT(), #M_WR_DIRECT() );
	IF HWTimer.pMeth THEN
		ret_code	:= C_OK;
	ELSE
		ret_code	:= C_OUTOF_NEAR;
		RETURN;
	END_IF;

END_FUNCTION

//{{LSL_IMPLEMENTATION

FUNCTION VIRTUAL GLOBAL JAMDETECT_Teller::Init


  if      cJam_Trombone.GetSize() <> sizeof(tJamDetect) then
          cJam_Trombone.SetSize(udSize:=sizeof(tJamDetect));
  end_if;


  if      _FirstScan then  
          JamTrombone   := (cJam_Trombone.GetDataPtr())$^tJamDetect;
          HWTimer := 1000;
          HWTimer.Write(input:=HWTimer);
          initReset := 0;
  end_if;  


END_FUNCTION


FUNCTION VIRTUAL GLOBAL JAMDETECT_Teller::CyWork
	VAR_INPUT
		EAX 	: UDINT;
	END_VAR
	VAR_OUTPUT
		state (EAX) 	: UDINT;
	END_VAR
  
  Jam01_01:=Jam01_01.Read();
  Jam01_02:=Jam01_02.Read();


  JamResetTanabe := JamResetTanabe.Read();

  if initReset = 0 then

      Jam_RESET :=0;
      initReset:=1;          
  end_if;

// Totaal aantal Jamdetecties tellen (gelijktijdig) //Normale Jam
   JamCountJam := 
     Jam01_01 + Jam01_02; 

    //Tellen hoeveel jamdetects bij TeachIn
    JamCountTeachIn := 0;
    for  i:= 1 to 16 do

         if   JamTrombone^.Status[i] = Jam_Detect  then
              JamCountTeachIn +=1;
         end_if;     
    end_for;
    //Hoeveel jams hebben we??
    if  JamCountJam >= JamCountTeachIn then
        Jam_Count := JamCountJam;
    else
        Jam_Count := JamCountTeachIn;
    end_if;


  case CaseJam of

  0:    

        //jam detecteren TeachIn
        for  i:= 1 to 16 do
      
        if   JamTrombone^.Status[i] = Jam_Detect  then
                  Jam_ID_Section :=11;
                  Jam_ID_Unit :=i;                  
                  CaseJam := 1;
                  
                  JAM:=1;
                  JamKlok:=1;
                  JamKlok.Write(JamKlok);
                  
                  Jam2Visu := 1;
                  Jam2Visu.Write(input:=Jam2Visu);
                  
                  Jam2HW := 1;
                  Jam2HW.Write(input:=Jam2HW);
                  timer := ops.tAbsolute;
                  CaseJamHWTimer:=1; 
             end_if;     
        end_for;

        //jam detecteren Normale Jam  
        if      Jam01_01 =1 | 
                Jam01_02 =1
        then    //Jam inschakelen
        
         // bepalen uit welke sectie de jam komt
   
         if Jam01_01 = 1 then
          Jam_ID_Section :=1;
          Jam_ID_Unit :=1;
         end_if;
         if Jam01_02 = 1 then
          Jam_ID_Section :=1;
          Jam_ID_Unit :=2;
         end_if;

          Jam_ID_Section.Write(Jam_ID_Section);
          Jam_ID_Unit.Write(Jam_ID_Unit);
          

        CaseJam := 1;
        
        JAM:=1;
        JamKlok:=1;
        JamKlok.Write(JamKlok);
        
        Jam2Visu := 1;
        Jam2Visu.Write(input:=Jam2Visu);
        
        Jam2HW := 1;
        Jam2HW.Write(input:=Jam2HW);
        timer := ops.tAbsolute;
        CaseJamHWTimer:=1; 


        end_if;
           
        

  1:    //wachten op reset

        if      JamReset = 1 | 
                JamResetTanabe = 1
                
        then    //Jam afschakelen
                JAM:=0;
                JamKlok:=0;
                JamKlok.Write(JamKlok);
                
                Jam2Visu := 0;
                Jam2Visu.Write(input:=Jam2Visu);
                Jam_Count :=0;
                
                cJamReset := 1;
                cJamReset.Write(input:=cJamReset); 
                
                Jam_RESET :=1;
                
                timer2:= ops.tAbsolute;
                CaseJam:=2;
        end_if;


  2:            // Reset 1000 ms op servers
                cJamReset.Write(input:=cJamReset);   
        
        if      ops.tAbsolute - timer2 > 1000    then
                cJamReset := 0;
                Jam_RESET :=0;
                Jam_ID_Section :=0;
                Jam_ID_Unit :=0;

                CaseJam := 0;
        end_if;

      

                
  end_case;




  case CaseJamHWTimer of

  0:

  1: //Na jam detect HW afschakelen en na een tijd weer inschakelen
        if      ops.tAbsolute - timer > HWTimer then

                Jam2HW := 0;
                Jam2HW.Write(input:=Jam2HW);
                CaseJamHWTimer := 0;
        end_if;


  end_case;


  Jam2Visu.Write (Jam2Visu);

  // De drukknop resetten (server die overeenkomt met reset op paneel)
  if not JAM then
    JamReset :=0;
  end_if;



  if JamDetPrevState <> JAM then // 20141028 SV client cJamLSE voor het tonen van het reset window in lse
    cJamLSE := JAM; 
    cJamLSE.Write(cJamLSE);
    JamDetPrevState := JAM;
  end_if;





	state := READY;

END_FUNCTION