/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//cs1/CS_Students/enichols16/CS401_CA/EX04/MIPS_CPU_FPGA_AND_SIM_V4/mips_controller.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_2545490612_503743352(char *, unsigned char , unsigned char );


static void work_a_1208337864_3708392848_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned char t17;
    char *t18;
    char *t19;
    unsigned char t20;
    unsigned char t21;
    unsigned char t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(37, ng0);

LAB3:    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t3 = (0 - 1);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 1352U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t11 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t7, t10);
    t8 = (t0 + 2952U);
    t12 = *((char **)t8);
    t13 = (1 - 1);
    t14 = (t13 * -1);
    t15 = (1U * t14);
    t16 = (0 + t15);
    t8 = (t12 + t16);
    t17 = *((unsigned char *)t8);
    t18 = (t0 + 1352U);
    t19 = *((char **)t18);
    t20 = *((unsigned char *)t19);
    t21 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t17, t20);
    t22 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t11, t21);
    t18 = (t0 + 4512);
    t23 = (t18 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    *((unsigned char *)t26) = t22;
    xsi_driver_first_trans_fast_port(t18);

LAB2:    t27 = (t0 + 4432);
    *((int *)t27) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1208337864_3708392848_init()
{
	static char *pe[] = {(void *)work_a_1208337864_3708392848_p_0};
	xsi_register_didat("work_a_1208337864_3708392848", "isim/testbench_isim_beh.exe.sim/work/a_1208337864_3708392848.didat");
	xsi_register_executes(pe);
}
