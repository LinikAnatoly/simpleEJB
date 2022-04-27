
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENNomenclaturesOperative;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENNomenclaturesOperative implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  id = Integer.MIN_VALUE; 
    public String  nn; 
    public String  bal_sch; 
    public String  name; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public static final String tableName = "ENNOMENCLATURESOPERATV";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENNOMENCLATURESOPERATV.CODE";
    public static final String id_Attr = "id";
    public static final String id_Field = "ID";
    public static final String id_QFielld = "ENNOMENCLATURESOPERATV.ID";
    public static final String nn_Attr = "nn";
    public static final String nn_Field = "NN";
    public static final String nn_QFielld = "ENNOMENCLATURESOPERATV.NN";
    public static final String bal_sch_Attr = "bal_sch";
    public static final String bal_sch_Field = "BAL_SCH";
    public static final String bal_sch_QFielld = "ENNOMENCLATURESOPERATV.BAL_SCH";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENNOMENCLATURESOPERATV.NAME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENNOMENCLATURESOPERATV.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENNOMENCLATURESOPERATV.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENNOMENCLATURESOPERATV.MODIFY_TIME";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setId(int aValue){
       id = aValue;
    }

    public int getId(){
       return id;
    }

    public void setNn(String aValue){
       nn = aValue;
    }

    public String getNn(){
       return nn;
    }

    public void setBal_sch(String aValue){
       bal_sch = aValue;
    }

    public String getBal_sch(){
       return bal_sch;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }


} // end of ENNomenclaturesOperativeValueObject

