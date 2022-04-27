
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENReportAdditionZbytMetrology;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENReportAdditionZbytMetrology implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  workCode; 
    public String  name; 
    public int  isServices = Integer.MIN_VALUE; 
    public String  zbytOrmetrology; 
    public Date dateStart ;
    public Date dateFinal ;
    public static final String tableName = "ENREPORTADDITNZBTMTRLG";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENREPORTADDITNZBTMTRLG.CODE";
    public static final String workCode_Attr = "workCode";
    public static final String workCode_Field = "WORKCODE";
    public static final String workCode_QFielld = "ENREPORTADDITNZBTMTRLG.WORKCODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENREPORTADDITNZBTMTRLG.NAME";
    public static final String isServices_Attr = "isServices";
    public static final String isServices_Field = "ISSERVICES";
    public static final String isServices_QFielld = "ENREPORTADDITNZBTMTRLG.ISSERVICES";
    public static final String zbytOrmetrology_Attr = "zbytOrmetrology";
    public static final String zbytOrmetrology_Field = "ZBYTORMETROLOGY";
    public static final String zbytOrmetrology_QFielld = "ENREPORTADDITNZBTMTRLG.ZBYTORMETROLOGY";
    public static final String dateStart_Attr = "dateStart";
    public static final String dateStart_Field = "DATESTART";
    public static final String dateStart_QFielld = "ENREPORTADDITNZBTMTRLG.DATESTART";
    public static final String dateFinal_Attr = "dateFinal";
    public static final String dateFinal_Field = "DATEFINAL";
    public static final String dateFinal_QFielld = "ENREPORTADDITNZBTMTRLG.DATEFINAL";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setWorkCode(String aValue){
       workCode = aValue;
    }

    public String getWorkCode(){
       return workCode;
    }


    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }


    public void setIsServices(int aValue){
       isServices = aValue;
    }

    public int getIsServices(){
       return isServices;
    }


    public void setZbytOrmetrology(String aValue){
       zbytOrmetrology = aValue;
    }

    public String getZbytOrmetrology(){
       return zbytOrmetrology;
    }


    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }


    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
    }


} // end of ENReportAdditionZbytMetrologyValueObject

