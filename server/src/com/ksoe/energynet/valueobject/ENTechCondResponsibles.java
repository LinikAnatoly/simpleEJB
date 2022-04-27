
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTechCondResponsibles;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTechCondResponsibles implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  responsibleFIO; 
    public int  responsibleTabNumber = Integer.MIN_VALUE; 
    public String  responsiblePosition; 
    public String  responsibleDepName; 
    public String  responsibleDepCode; 
    public String  responsiblePhone; 
    public int  power = Integer.MIN_VALUE; 
    public static final String tableName = "ENTECHCONDRESPONSIBLES";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTECHCONDRESPONSIBLES.CODE";
    public static final String responsibleFIO_Attr = "responsibleFIO";
    public static final String responsibleFIO_Field = "RESPONSIBLEFIO";
    public static final String responsibleFIO_QFielld = "ENTECHCONDRESPONSIBLES.RESPONSIBLEFIO";
    public static final String responsibleTabNumber_Attr = "responsibleTabNumber";
    public static final String responsibleTabNumber_Field = "RESPONSIBLETABNUMBER";
    public static final String responsibleTabNumber_QFielld = "ENTECHCONDRESPONSIBLES.RESPONSIBLETABNUMBER";
    public static final String responsiblePosition_Attr = "responsiblePosition";
    public static final String responsiblePosition_Field = "RESPONSIBLEPOSITION";
    public static final String responsiblePosition_QFielld = "ENTECHCONDRESPONSIBLES.RESPONSIBLEPOSITION";
    public static final String responsibleDepName_Attr = "responsibleDepName";
    public static final String responsibleDepName_Field = "RESPONSIBLEDEPNAME";
    public static final String responsibleDepName_QFielld = "ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPNAME";
    public static final String responsibleDepCode_Attr = "responsibleDepCode";
    public static final String responsibleDepCode_Field = "RESPONSIBLEDEPCODE";
    public static final String responsibleDepCode_QFielld = "ENTECHCONDRESPONSIBLES.RESPONSIBLEDEPCODE";
    public static final String responsiblePhone_Attr = "responsiblePhone";
    public static final String responsiblePhone_Field = "RESPONSIBLEPHONE";
    public static final String responsiblePhone_QFielld = "ENTECHCONDRESPONSIBLES.RESPONSIBLEPHONE";
    public static final String power_Attr = "power";
    public static final String power_Field = "POWER";
    public static final String power_QFielld = "ENTECHCONDRESPONSIBLES.POWER";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setResponsibleFIO(String aValue){
       responsibleFIO = aValue;
    }

    public String getResponsibleFIO(){
       return responsibleFIO;
    }

    public void setResponsibleTabNumber(int aValue){
       responsibleTabNumber = aValue;
    }

    public int getResponsibleTabNumber(){
       return responsibleTabNumber;
    }

    public void setResponsiblePosition(String aValue){
       responsiblePosition = aValue;
    }

    public String getResponsiblePosition(){
       return responsiblePosition;
    }

    public void setResponsibleDepName(String aValue){
       responsibleDepName = aValue;
    }

    public String getResponsibleDepName(){
       return responsibleDepName;
    }

    public void setResponsibleDepCode(String aValue){
       responsibleDepCode = aValue;
    }

    public String getResponsibleDepCode(){
       return responsibleDepCode;
    }

    public void setResponsiblePhone(String aValue){
       responsiblePhone = aValue;
    }

    public String getResponsiblePhone(){
       return responsiblePhone;
    }

    public void setPower(int aValue){
       power = aValue;
    }

    public int getPower(){
       return power;
    }


} // end of ENTechCondResponsiblesValueObject

