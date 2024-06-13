#ifdef LASAL_VERSION
#if LASAL_VERSION > 57
//LASAL_INCLUDES
 #pragma once
 
#endif//LASALVERSION > 57
#endif//LASAL_VERSION


#define _CNC_MAXOVERRIDE	        1000		// Maximalwert für Override im CNC, Falls jemand die Einheit nicht kennt, dass dies abgefangen ist
#define _CNC_MINOVERRIDE	           0		// Minimalwert für Override im CNC --> damit man mit Minuswerten nicht in die falsche Richtung fahren kann

#define _CNC_MIN_POS       -16#7000000    // default MINPOS when INITvalue=0
#define _CNC_MAX_POS        16#7000000    // default MAXPOS when INITvalue=0

#define _CNC_OVERVFLOW_POS  16#6000000    // MAX POSITION for checking overflow

#define POLYNOM_V0          0             // CoupleGearPosCatch wenn Slave steht
#define POLYNOM_V           1             // CoupleGearPosCatch wenn Slave fährt

#define INTERVAL            10            // original = 10

#define _CNC_MAX_MASTERDELAY         7    // maximum cycles for delaying the coupling to the master


//+++++++++ einbau spline HP 7.9.2011 +++++++++++++++++++++++++

#define FACTOR_JMAX         10
#define FACTOR_T_VAL_X      0.80
#define FACTOR_T_VAL_Z      0.80
#define MIN_TICKS           0

// #define CALC_V_EXACT
#undef CALC_V_EXACT

// #define CALC_ACC_EXACT
#undef CALC_ACC_EXACT

// #define TRACE_SPLINE
#undef TRACE_SPLINE

// #define DEBUG_TIMEMEASURE
#undef DEBUG_TIMEMEASURE

#ifdef DEBUG_TIMEMEASURE
  #define METER_COUPLEGEARPOSCATCH_V
  #define METER_POLYLOCK_V
  #define METER_CHECK_EXT__3_5
  #define METER_CHECK_EXT__3_4_1_4
  #define METER_GET_COUPLESPEED

  #define METER_SPLINE__3_5_SX
  #define METER_SPLINE__3_5_SY
  #define METER_SPLINE_4_1_4_SW
  #define METER_SPLINE_4_1_4_SX
  #define METER_SPLINE_4_1_4_SY
  #define METER_SPLINE__4_1_4_SZ
#else
  #undef METER_COUPLEGEARPOSCATCH_V
  #undef METER_POLYLOCK_V
  #undef METER_CHECK_EXT__3_5
  #undef METER_CHECK_EXT__3_4_1_4
  #undef METER_GET_COUPLESPEED

  #undef METER_SPLINE__3_5_SX
  #undef METER_SPLINE__3_5_SY
  #undef METER_SPLINE_4_1_4_SW
  #undef METER_SPLINE_4_1_4_SX
  #undef METER_SPLINE_4_1_4_SY
  #undef METER_SPLINE__4_1_4_SZ
#endif

//+++++++++ einbau spline HP 7.9.2011 +++++++++++++++++++++++++

/////////////////////
// Polynom 5ten Grades
#define _Poly_Pos_A     2.5
#define _Poly_Pos_B     3.0
#define _Poly_Pos_C     1.0

//////////////////////
// Bewegungsrichtungen
#define MOVE_ANY_WAY              0       // beide Richtungen
#define MOVE_NEG_DIR              1       // nur negative Bewegungsrichtung
#define MOVE_SHORTEST_WAY         2       // kürzester Weg (beide Richtungen)
#define MOVE_POS_DIR              3       // nur positive Bewegungsrichtung

//////////////////////
// Parameter-Nummern
//////////////////////
#define PARNO_RD_V_MAX            0       // returns speed in application/internal units
#define PARNO_RD_A_MAX            1       // returns acceleration in application/internal units
#define PARNO_RD_EXT_UNITS        2       // returns the external units
#define PARNO_RD_INT_UNITS        3       // returns the internal units
#define PARNO_RD_RES_FACT         4       // returns the value from cResolutionFact
#define PARNO_RD_SEMAPHOR         5       // Status des Semaphors lesen
#define PARNO_RD_REF_POS          6       // Referenzposition lesen
#define PARNO_RD_MODULO           7       // Modulowert der Achse lesen (0 = kein Modulobetrieb)
#define PARNO_RD_MASTERLOCK_8     8       // 0 = nicht auf Master aufgelocked, 1 = synchron mit Master
#define PARNO_RD_MASTERLOCK_9     9       // keine Kopplung mit Achse => 0, sonst Wert vom MasterLock (siehe 8)
#define PARNO_RD_MAX_MODULO       10      // Maxmodulowert lesen
#define PARNO_RD_BINOFFSET        16      // get BinOffset
#define PARNO_RD_POSMODE          17      // PosMode //HasHan 08.06.2011 11:11 to get the PolyLock and PolySync 
#define PARNO_RD_SHAPE_SPLINE     18      // Splinegestalt einstellen
#define PARNO_RD_COUPLE_ERROR     19
#define PARNO_RD_MASTER_DELAY     20      // Anzahl der verzoegerten Zyklen beim koppeln
#define PARNO_RD_DYN_SW_LIMIT     21      // returns the selected DynSWLimit is activ
#define PARNO_RD_DEC_ACT          22      // returns deceleration in application/internal units



#define PARNO_WR_COUPLING_MODE    0       // Setzen des Koppelmodus
#define PARNO_WR_DESTINATION      1       // Setzen einer neuen Zielposition
#define PARNO_WR_OVERRIDE         2       // Setzen eines neuen Overrides
#define PARNO_WR_LOGMODE          3       // Ändern des Loggings
#define PARNO_RESET_REF_STATE     4       // Status der Referenzierung rücksetzen
#define PARNO_CHANGE_SW_LIMITS    5       // Ändern der SW Endlagenüberwachungseinstellungen
#define PARNO_JERK_LIMITATION     6       // Ruckbegrenzung aktivieren/deaktivieren
#define PARNO_SHIFT_BREAKPOS      7       // Bremspunktverschiebung
#define PARNO_WR_OVERFLOW_POS     8       // Setzen einer neuen Overflow Position anstatt _CNC_OVERVFLOW_POS
#define PARNO_WR_MIN_POSITION     9       // Setzen einer neuen Min Position anstatt _CNC_MIN_POS
#define PARNO_WR_MAX_POSITION     10      // Setzen einer neuen Max Position anstatt _CNC_MAX_POS
#define PARNO_HARDLOCK            11      // Grenzen von Geschwindigkeit, Beschleunigung und Verzögerung überwachen (J/N)
#define PARNO_SWLIM_STANDSTILL    12      // Überwachung der SW Endlagen im Stillstand (J/N)
#define PARNO_SWLIM_DIR_CHANGE    13      // Überwachung der SW Endlagen bei Richtungsumkehr (J/N)
#define PARNO_SWLIM_MOVING        14      // Überwachung der SW Endlagen in der Bewegung (J/N)
#define PARNO_INIT_JERK_FILTER    15      // Ruckfilter bei ControllerOn init (J/N)
#define PARNO_WR_BINOFFSET        16      // set BinOffset
#define PARNO_WR_VJUMP            17      // bNoStop und bVconst in CNCProfile sind gesetzt
#define PARNO_SET_SW_LIMIT_FLAGS  18      // Einstellen wann SwMin, SwMax gesetzt werden
#define PARNO_SET_SW_LIM_WINDOW   19      // Toleranzfenster zur Überwachung der SW-Endlagen im Stillstand
#define PARNO_SET_MOVE_DIR        20      // zulässige Bewegungsrichtung einstellen
#define PARNO_SET_SHAPE_SPLINE    21      // Splinegestalt einstellen
#define PARNO_AVOID_OVERFLOWERROR 22      // Verhindert OverflowError bei Achskopplungen 
#define PARNO_MODIFY_CMD_SEMA     23      // Kommando-Semaphore setzen / löschen
#define PARNO_WR_JMAX             24      // Ruckfaktor setzen
#define PARNO_WR_MASTER_DELAY     25      // Anzahl der verzoegerten Zyklen beim koppeln setzen

#define Max_V_FILTER_SIZE   100

