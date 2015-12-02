/**
 * NumberBars.mq4
 * Script to add the index of each bar to the chart.
 *
 * Copyright 2015, Madyan Al-Jazaeri
 */

#property strict
#property copyright   "Copyright 2015, Madyan Al-Jazaeri"
#property link        "https://github.com/madyan94"
#property description "Script to add the index of each bar to the chart."
#property version     "1.00"
#property script_show_inputs

// Last bar that should be labeled
input int    Max    = 100;
// Label position offset above upper shaddows
input double Offset = 0.00075;

void OnStart() {
	// Clear all previously drawn bar labels by this script
    ObjectsDeleteAll(0, "barLabel[");

    // Label all bars with index 0 until Max
    for (int i = 0; i <= (Max < Bars ? Max : Bars - 1); i++) {
        ObjectCreate("barLabel[" + string(i) + "]", OBJ_TEXT, 0, Time[i], High[i] + Offset);
        ObjectSetText("barLabel[" + string(i) + "]", string(i), 10, "Arial Black", clrBlack);
    }
}
