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

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/minot/4IR/Projet-Systeme-Informatique/RISC_Processor/Banc_Registres.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;
extern char *IEEE_P_3620187407;

int ieee_p_1242562249_sub_17802405650254020620_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1439684516_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t12;
    char *t13;
    int t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned char t18;
    char *t19;
    char *t20;

LAB0:    t1 = (t0 + 3944U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);

LAB6:    t2 = (t0 + 4760);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t5 = (t0 + 4760);
    *((int *)t5) = 0;
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t6 = (t4 == (unsigned char)2);
    if (t6 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t2 = (t0 + 8200U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t5, t2);
    t15 = (t14 - 0);
    t12 = (t15 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t14);
    t16 = (8U * t12);
    t17 = (0 + t16);
    t7 = (t3 + t17);
    t8 = (t0 + 4872);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t7, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t2 = (t0 + 8216U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t5, t2);
    t15 = (t14 - 0);
    t12 = (t15 * 1);
    xsi_vhdl_check_range_of_index(0, 15, 1, t14);
    t16 = (8U * t12);
    t17 = (0 + t16);
    t7 = (t3 + t17);
    t8 = (t0 + 4936);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t7, 8U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t6 = (t4 == (unsigned char)3);
    if (t6 != 0)
        goto LAB13;

LAB15:
LAB14:
LAB9:    goto LAB2;

LAB5:    t3 = (t0 + 1952U);
    t4 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t4 == 1)
        goto LAB4;
    else
        goto LAB6;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(60, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t5 = t2;
    memset(t5, (unsigned char)2, 8U);
    t7 = (t0 + 4872);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 8U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(61, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t3 = t2;
    memset(t3, (unsigned char)2, 8U);
    t5 = (t0 + 4936);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(62, ng0);
    t2 = xsi_get_transient_memory(128U);
    memset(t2, 0, 128U);
    t3 = t2;
    t5 = (t0 + 8535);
    t4 = (8U != 0);
    if (t4 == 1)
        goto LAB11;

LAB12:    t8 = (t0 + 5000);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t2, 128U);
    xsi_driver_first_trans_fast(t8);
    goto LAB9;

LAB11:    t12 = (128U / 8U);
    xsi_mem_set_data(t3, t5, 8U, t12);
    goto LAB12;

LAB13:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t2 = (t0 + 8232U);
    t7 = (t0 + 1032U);
    t8 = *((char **)t7);
    t7 = (t0 + 8200U);
    t18 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t5, t2, t8, t7);
    if (t18 != 0)
        goto LAB16;

LAB18:    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 8232U);
    t5 = (t0 + 1192U);
    t7 = *((char **)t5);
    t5 = (t0 + 8216U);
    t4 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t2, t7, t5);
    if (t4 != 0)
        goto LAB19;

LAB20:
LAB17:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t2 = (t0 + 8232U);
    t14 = ieee_p_1242562249_sub_17802405650254020620_1035706684(IEEE_P_1242562249, t5, t2);
    t15 = (t14 - 0);
    t12 = (t15 * 1);
    t16 = (8U * t12);
    t17 = (0U + t16);
    t7 = (t0 + 5000);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 8U);
    xsi_driver_first_trans_delta(t7, t17, 8U, 0LL);
    goto LAB14;

LAB16:    xsi_set_current_line(68, ng0);
    t9 = (t0 + 1672U);
    t10 = *((char **)t9);
    t9 = (t0 + 4872);
    t11 = (t9 + 56U);
    t13 = *((char **)t11);
    t19 = (t13 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t10, 8U);
    xsi_driver_first_trans_fast(t9);
    goto LAB17;

LAB19:    xsi_set_current_line(70, ng0);
    t8 = (t0 + 1672U);
    t9 = *((char **)t8);
    t8 = (t0 + 4936);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t13 = (t11 + 56U);
    t19 = *((char **)t13);
    memcpy(t19, t9, 8U);
    xsi_driver_first_trans_fast(t8);
    goto LAB17;

}

static void work_a_1439684516_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(78, ng0);

LAB3:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 5064);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4776);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1439684516_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(79, ng0);

LAB3:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    t1 = (t0 + 5128);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4792);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1439684516_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1439684516_3212880686_p_0,(void *)work_a_1439684516_3212880686_p_1,(void *)work_a_1439684516_3212880686_p_2};
	xsi_register_didat("work_a_1439684516_3212880686", "isim/test_banc_registres_isim_beh.exe.sim/work/a_1439684516_3212880686.didat");
	xsi_register_executes(pe);
}
