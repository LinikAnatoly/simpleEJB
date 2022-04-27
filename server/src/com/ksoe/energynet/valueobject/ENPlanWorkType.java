
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanWorkTypeENPlanWorkType;
  */

import java.io.Serializable;


public class ENPlanWorkType implements Serializable {

    public static final int PLANOVIE = 1;
    public static final int AVR = 2;
    public static final int PREDPISANIE = 3; // predpisanie :)
    public static final int INVEST = 5;
    public static final int ENERGYSBYT = 6;
    public static final int PRIEDNANNY = 7;
    public static final int WORK_IN_OUT = 8; // Работы на сторону
    public static final int RESORE_CABLE_LINE = 9;
    public static final int NOT_PLANED = 10;

    public static final int TRUCKING = 11;
    public static final int WRITINGS = 12;

    public static final int SIZ = 13;

    public static final int TMC_TRANSFER = 14; // Акт виконаних робіт договорів підряду

    public static final int TRANSPORT_RELOCATION = 15;  //  транспорт/перебазування

    public static final int RESTOCKING = 16;   //   ПВЗ

    //public static final int REFINEMENT_BY_CONTRACT___ = 17; // доробка по договорам подряда - юзать будем 8 ...
    public static final int REFINEMENT = 17; // доробка

    public static final int WRITINGOFFPROTECTION = 18; // списання засобів захисту
    public static final int SERVICES_FROM_SIDE = 19; // работы со стороны
    public static final int SERVICES_FROM_SIDE_INVEST = 20; // работы со стороны (инвестпрограмма)

    /** 21-й тип плана "Обеспечение транспорта"
    * (для закупки шин, аккумуляторов) */
    public static final int TRANSPORT_SERVICES = 21;


    /** 22-й тип плана "Проектирование (хоз. способом)" */
    public static final int DESIGNING_TECHCONDITIONS = 22;

    /** 24-й тип плана "Реализация товаров" */
    public static final int SALE_PRODUCTS = 24;

    /** 25-й тип плана "Благодійна допомога" */
    public static final int GIFT = 25;
    
    /** 26-й тип плана "Списание ОС" */
    public static final int ENPLANWORKTYPE_WRITEOFF_OS = 26;



    // ЭНЕРГОСБЫТ
    public static final int EZ_PLANED_CHANGE_COUNTER = 100;
    public static final int EZ_PLANED_ROUND = 101;
    public static final int EZ_NOPLANED_CHANGE_COUNTER = 102;
    public static final int EZ_NOPLANED_SETUP_COUNTER = 103;
    public static final int EZ_NOPLANED_UNSETUP_COUNTER = 104;
    public static final int EZ_TECH_VALIDATE = 105;
    public static final int EZ_SETUP_ZKU = 106;
    public static final int EZ_OFF_ONN = 107;
    public static final int EZ_PLANNED = 108;
    public static final int EZ_NOT_PLANNED = 109;
    public static final int EZ_CONTROL_MEASUREMENT = 110;
    public static final int EZ_CHANGE_ZKU = 111;
    public static final int EZ_CHANGE_COUNTER_IN_ZKU = 112;
    public static final int EZ_PLANED_ROUND_ADD = 113;
    public static final int EZ_RAID = 114;
    /** Работы на сторону (Послуги на сторону (госп. спосіб))*/
    public static final int WORK_IN_OUT_ECONOMIC_METHOD = 115;

    public int  code = Integer.MIN_VALUE;
    public String  name;
    public String  shortName;
    public static final String tableName = "ENPLANWORKTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANWORKTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENPLANWORKTYPE.NAME";
    public static final String shortName_Attr = "shortName";
    public static final String shortName_Field = "SHORTNAME";
    public static final String shortName_QFielld = "ENPLANWORKTYPE.SHORTNAME";


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


} // end of ENPlanWorkTypeValueObject

