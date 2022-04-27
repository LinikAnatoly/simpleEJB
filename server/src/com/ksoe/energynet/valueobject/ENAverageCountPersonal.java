
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAverageCountPersonal;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENAverageCountPersonal implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  codePodr; 
    public String  namePodr; 
    public String  codeCeh; 
    public String  nameCeh; 
    public Date calculateDate ;
    public Date dateEdit ;
    public BigDecimal  countGen; 
    public String  personalVidId; 
    public String  personalVidName; 
    public String  userGen; 
    public long  modify_time = Long.MIN_VALUE;
    public static final String tableName = "ENAVERAGECOUNTPERSONAL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENAVERAGECOUNTPERSONAL.CODE";
    public static final String codePodr_Attr = "codePodr";
    public static final String codePodr_Field = "CODEPODR";
    public static final String codePodr_QFielld = "ENAVERAGECOUNTPERSONAL.CODEPODR";
    public static final String namePodr_Attr = "namePodr";
    public static final String namePodr_Field = "NAMEPODR";
    public static final String namePodr_QFielld = "ENAVERAGECOUNTPERSONAL.NAMEPODR";
    public static final String codeCeh_Attr = "codeCeh";
    public static final String codeCeh_Field = "CODECEH";
    public static final String codeCeh_QFielld = "ENAVERAGECOUNTPERSONAL.CODECEH";
    public static final String nameCeh_Attr = "nameCeh";
    public static final String nameCeh_Field = "NAMECEH";
    public static final String nameCeh_QFielld = "ENAVERAGECOUNTPERSONAL.NAMECEH";
    public static final String calculateDate_Attr = "calculateDate";
    public static final String calculateDate_Field = "CALCULATEDATE";
    public static final String calculateDate_QFielld = "ENAVERAGECOUNTPERSONAL.CALCULATEDATE";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENAVERAGECOUNTPERSONAL.DATEEDIT";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENAVERAGECOUNTPERSONAL.COUNTGEN";
    public static final String personalVidId_Attr = "personalVidId";
    public static final String personalVidId_Field = "PERSONALVIDID";
    public static final String personalVidId_QFielld = "ENAVERAGECOUNTPERSONAL.PERSONALVIDID";
    public static final String personalVidName_Attr = "personalVidName";
    public static final String personalVidName_Field = "PERSONALVIDNAME";
    public static final String personalVidName_QFielld = "ENAVERAGECOUNTPERSONAL.PERSONALVIDNAME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENAVERAGECOUNTPERSONAL.USERGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENAVERAGECOUNTPERSONAL.MODIFY_TIME";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setCodePodr(String aValue){
       codePodr = aValue;
    }

    public String getCodePodr(){
       return codePodr;
    }


    public void setNamePodr(String aValue){
       namePodr = aValue;
    }

    public String getNamePodr(){
       return namePodr;
    }


    public void setCodeCeh(String aValue){
       codeCeh = aValue;
    }

    public String getCodeCeh(){
       return codeCeh;
    }


    public void setNameCeh(String aValue){
       nameCeh = aValue;
    }

    public String getNameCeh(){
       return nameCeh;
    }


    public void setCalculateDate(Date aValue){
       calculateDate = aValue;
    }

    public Date getCalculateDate(){
       return calculateDate;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }


    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }


    public void setPersonalVidId(String aValue){
       personalVidId = aValue;
    }

    public String getPersonalVidId(){
       return personalVidId;
    }


    public void setPersonalVidName(String aValue){
       personalVidName = aValue;
    }

    public String getPersonalVidName(){
       return personalVidName;
    }


    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }


} // end of ENAverageCountPersonalValueObject

