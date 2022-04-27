
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FKTrans2AXTrans;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class FKTrans2AXTrans implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  monthGen = Integer.MIN_VALUE; 
    public int  yearGen = Integer.MIN_VALUE; 
    public String  taskOwner; 
    public static final String tableName = "FKTRANS2AXTRANS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FKTRANS2AXTRANS.CODE";
    public static final String monthGen_Attr = "monthGen";
    public static final String monthGen_Field = "MONTHGEN";
    public static final String monthGen_QFielld = "FKTRANS2AXTRANS.MONTHGEN";
    public static final String yearGen_Attr = "yearGen";
    public static final String yearGen_Field = "YEARGEN";
    public static final String yearGen_QFielld = "FKTRANS2AXTRANS.YEARGEN";
    public static final String taskOwner_Attr = "taskOwner";
    public static final String taskOwner_Field = "TASKOWNER";
    public static final String taskOwner_QFielld = "FKTRANS2AXTRANS.TASKOWNER";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setMonthGen(int aValue){
       monthGen = aValue;
    }

    public int getMonthGen(){
       return monthGen;
    }


    public void setYearGen(int aValue){
       yearGen = aValue;
    }

    public int getYearGen(){
       return yearGen;
    }


    public void setTaskOwner(String aValue){
       taskOwner = aValue;
    }

    public String getTaskOwner(){
       return taskOwner;
    }


} // end of FKTrans2AXTransValueObject

