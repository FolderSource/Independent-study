
current_design $design_name

create_clock -name clk -period $CLK_PERIOD -waveform [list 0 [expr $CLK_PERIOD / 2.0]] [get_ports clk]
set_clock_uncertainty $CLK_SKEW clk

create_clock -name rcc_clk -period [expr $CLK_PERIOD * $RCC_MULT] -waveform [list 0 [expr [expr $CLK_PERIOD * $RCC_MULT] / 2.0]] [get_ports rcc_clk]
set_clock_uncertainty $CLK_SKEW rcc_clk

set_clock_gating_check [all_clocks]

current_design $design_name

#/*********************************************************/
#/*                                                       */
