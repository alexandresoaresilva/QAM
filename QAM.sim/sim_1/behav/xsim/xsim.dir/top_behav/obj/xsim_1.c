/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_100(char*, char *);
extern void execute_101(char*, char *);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void execute_104(char*, char *);
extern void execute_24(char*, char *);
extern void execute_25(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_76(char*, char *);
extern void execute_77(char*, char *);
extern void execute_78(char*, char *);
extern void execute_23(char*, char *);
extern void execute_73(char*, char *);
extern void execute_74(char*, char *);
extern void execute_15(char*, char *);
extern void execute_16(char*, char *);
extern void execute_48(char*, char *);
extern void execute_67(char*, char *);
extern void execute_68(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_70(char*, char *);
extern void execute_71(char*, char *);
extern void execute_72(char*, char *);
extern void execute_14(char*, char *);
extern void execute_58(char*, char *);
extern void execute_59(char*, char *);
extern void execute_60(char*, char *);
extern void execute_61(char*, char *);
extern void execute_62(char*, char *);
extern void execute_7(char*, char *);
extern void execute_49(char*, char *);
extern void execute_51(char*, char *);
extern void execute_52(char*, char *);
extern void execute_9(char*, char *);
extern void execute_18(char*, char *);
extern void execute_63(char*, char *);
extern void execute_65(char*, char *);
extern void execute_66(char*, char *);
extern void execute_37(char*, char *);
extern void execute_38(char*, char *);
extern void execute_39(char*, char *);
extern void execute_92(char*, char *);
extern void execute_93(char*, char *);
extern void execute_94(char*, char *);
extern void execute_95(char*, char *);
extern void execute_96(char*, char *);
extern void execute_97(char*, char *);
extern void execute_98(char*, char *);
extern void execute_99(char*, char *);
extern void execute_28(char*, char *);
extern void execute_29(char*, char *);
extern void execute_30(char*, char *);
extern void execute_84(char*, char *);
extern void execute_85(char*, char *);
extern void execute_86(char*, char *);
extern void execute_87(char*, char *);
extern void execute_34(char*, char *);
extern void execute_79(char*, char *);
extern void execute_81(char*, char *);
extern void execute_82(char*, char *);
extern void execute_45(char*, char *);
extern void execute_46(char*, char *);
extern void execute_47(char*, char *);
extern void execute_105(char*, char *);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_108(char*, char *);
extern void execute_109(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[69] = {(funcp)execute_100, (funcp)execute_101, (funcp)execute_102, (funcp)execute_103, (funcp)execute_104, (funcp)execute_24, (funcp)execute_25, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_76, (funcp)execute_77, (funcp)execute_78, (funcp)execute_23, (funcp)execute_73, (funcp)execute_74, (funcp)execute_15, (funcp)execute_16, (funcp)execute_48, (funcp)execute_67, (funcp)execute_68, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_70, (funcp)execute_71, (funcp)execute_72, (funcp)execute_14, (funcp)execute_58, (funcp)execute_59, (funcp)execute_60, (funcp)execute_61, (funcp)execute_62, (funcp)execute_7, (funcp)execute_49, (funcp)execute_51, (funcp)execute_52, (funcp)execute_9, (funcp)execute_18, (funcp)execute_63, (funcp)execute_65, (funcp)execute_66, (funcp)execute_37, (funcp)execute_38, (funcp)execute_39, (funcp)execute_92, (funcp)execute_93, (funcp)execute_94, (funcp)execute_95, (funcp)execute_96, (funcp)execute_97, (funcp)execute_98, (funcp)execute_99, (funcp)execute_28, (funcp)execute_29, (funcp)execute_30, (funcp)execute_84, (funcp)execute_85, (funcp)execute_86, (funcp)execute_87, (funcp)execute_34, (funcp)execute_79, (funcp)execute_81, (funcp)execute_82, (funcp)execute_45, (funcp)execute_46, (funcp)execute_47, (funcp)execute_105, (funcp)execute_106, (funcp)execute_107, (funcp)execute_108, (funcp)execute_109, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 69;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/top_behav/xsim.reloc",  (void **)funcTab, 69);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/top_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/top_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern int xsim_argc_copy ;
extern char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/top_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/top_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/top_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
