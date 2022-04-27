
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanWorkStateENPlanWorkState;
  */

import java.io.Serializable;


public class ENPlanWorkState implements Serializable {

	public static final int TO = 3;
	public static final int CAPITAL_REPAIR = 1;
	public static final int CAPITAL_BUILDER = 4;

	/** 2 тип акта - "Реконструкція і модернізація" */
	public static final int RECONSTRUCTION_MODERNIZATION = 2;

	/** 5 тип акта - Поточний ремонт */
	public static final int CURRENT_REPAIR = 5;

	public static final int WORK_IN_OUT = 7; // Работы на сторону

	public static final int REFINEMENT = 8;

	public static final int PRODUCTION = 10;

	/** 11 тип акта - Вимірювання та випробування */
	public static final int MEASUREMENT = 11;

	public static final int TRUCKING = 12;
	public static final int WRITINGS_TMC = 13;

	public static final int WRITINGS_MBP = 15;
	public static final int WRITINGS_OS = 16;


	public static final int SIZ = 17; // спецодежда ...
	public static final int BSZ = 18; // бригадные средства защиты ...

	public static final int DISMANTLING = 19; // Демонтаж

	public static final int TMC_TRANSFER = 20; // (акт приема-передачи) Акт виконаних робіт договорів підряду

	public static final int REFINEMENT_BY_CONTRACT = 22; // доробка по договорам подряда
	public static final int WRITINGS_MNMA = 23;

	public static final int SERVICES_FROM_OUT = 24; // Послуги зі сторони

	public static final int WRITINGS_BUFET_REALIZATION = 25; // Списання ТМЦ (Реалізація, Буфет)
	public static final int WRITINGS_BUFET_NONEREALIZATION = 26; // Списання ТМЦ (Нереалізація, Буфет)
	public static final int WRITINGS_BUFET_REALIZATION_BEZNAL = 33; // Списання ТМЦ (Реалізація - безнал, Буфет)
	
	/** 27 тип акта - "Монтаж, переустановлення" */
	public static final int INSTALLATION_REINSTALLATION = 27;

	/** 28-й тип акта "Обеспечение транспорта"
	 * (для закупки шин, аккумуляторов) */
	public static final int TRANSPORT_SERVICES = 28;

	/** 29-й тип акта - "Проектирование" */
	public static final int DESIGNING = 29;

	/** 30-й тип акта - "Транспортні послуги" */
	public static final int TRANSPORT_SERVICES_4_SIDE = 30;

	/** 31-й тип акта - "Реализация товаров" */
	public static final int SALE_PRODUCTS = 31;
	
	/** 32-й тип акта - "Благодійна допомога" */
	public static final int GIFT = 32;
	
	/** Списание МБП (Инструменты)*/
	public static final int WRITINGS_MBP_INSTRUMENTS = 34;

	/** Списание (Лічильники)*/
	public static final int WRITINGS_COUNTERS = 35;
 
	/** Акт дефектации счетчиков */
	public static final int COUNTERS_ACT_DEFECT = 36;
	 
	/** Повірка лічильників */
	public static final int COUNTERS_STATE_VERIFICATION = 37;
	
	/** Параметризация счетчиков */
	public static final int COUNTERS_PARAMETRIZATION = 38;
	/** Параметризация счетчиков (безоплатная)*/ 
	public static final int COUNTERS_PARAMETRIZATION_FREE_OF_CHARGE = 39;
	
	/** Експертиза лічильників */
	public static final int COUNTERS_EXPERTISE = 41;

	/* Вообще-то это Подвиды работ - и они должны быть в ENPlanWorkType
	// энэргозбытовые виды ...
	public static final int EZ_PLANED_CHANGE_COUNTER = 100;
	public static final int EZ_PLANED_ROUND = 101;
	public static final int EZ_NOPLANED_CHANGE_COUNTER = 102;
	public static final int EZ_NOPLANED_SETUP_COUNTER = 103;
	public static final int EZ_NOPLANED_UNSETUP_COUNTER = 104;
	public static final int EZ_TECH_VALIDATE = 105;
	public static final int EZ_SETUP_ZKU = 106;
	public static final int EZ_OFF_ONN = 107;
    */

    public int  code = Integer.MIN_VALUE;
    public String  name;
    public String  shortName;
    public static final String tableName = "ENPLANWORKSTATE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANWORKSTATE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENPLANWORKSTATE.NAME";
    public static final String shortName_Attr = "shortName";
    public static final String shortName_Field = "SHORTNAME";
    public static final String shortName_QFielld = "ENPLANWORKSTATE.SHORTNAME";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setShortName(String aValue){
       shortName = aValue;
    }

    public String getShortName(){
       return shortName;
    }


} // end of ENPlanWorkStateValueObject
