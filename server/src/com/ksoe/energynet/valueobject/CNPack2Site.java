
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for CNPack2Site;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.CNSubsystemTypeRef;
    import  com.ksoe.energynet.valueobject.references.CNPackRef;

public class CNPack2Site implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  is_reg = Integer.MIN_VALUE; 
    public String  customeremail; 
    public String  phone; 
    public int  customertype = Integer.MIN_VALUE; 
    public CNSubsystemTypeRef subsystemRef = new CNSubsystemTypeRef();
    public CNPackRef cnPackRef = new CNPackRef();
    public static final String tableName = "CNPACK2SITE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "CNPACK2SITE.CODE";
    public static final String is_reg_Attr = "is_reg";
    public static final String is_reg_Field = "IS_REG";
    public static final String is_reg_QFielld = "CNPACK2SITE.IS_REG";
    public static final String customeremail_Attr = "customeremail";
    public static final String customeremail_Field = "CUSTOMEREMAIL";
    public static final String customeremail_QFielld = "CNPACK2SITE.CUSTOMEREMAIL";
    public static final String phone_Attr = "phone";
    public static final String phone_Field = "PHONE";
    public static final String phone_QFielld = "CNPACK2SITE.PHONE";
    public static final String customertype_Attr = "customertype";
    public static final String customertype_Field = "CUSTOMERTYPE";
    public static final String customertype_QFielld = "CNPACK2SITE.CUSTOMERTYPE";
    public static final String subsystemRef_Attr = "subsystemRef";
    public static final String subsystemRef_Field = "SUBSYSTEMREFCODE";
    public static final String  subsystemRef_QFielld = "CNPACK2SITE.SUBSYSTEMREFCODE";
    public static final String cnPackRef_Attr = "cnPackRef";
    public static final String cnPackRef_Field = "CNPACKREFCODE";
    public static final String  cnPackRef_QFielld = "CNPACK2SITE.CNPACKREFCODE";

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setIs_reg(int aValue){
       is_reg = aValue;
    }

    public int getIs_reg(){
       return is_reg;
    }

    public void setCustomeremail(String aValue){
       customeremail = aValue;
    }

    public String getCustomeremail(){
       return customeremail;
    }

    public void setPhone(String aValue){
       phone = aValue;
    }

    public String getPhone(){
       return phone;
    }

    public void setCustomertype(int aValue){
       customertype = aValue;
    }

    public int getCustomertype(){
       return customertype;
    }

    public void setSubsystemRef(CNSubsystemTypeRef aValue){
       subsystemRef = aValue;
    }

    public CNSubsystemTypeRef getSubsystemRef(){
       return subsystemRef;
    }
    public void setCnPackRef(CNPackRef aValue){
       cnPackRef = aValue;
    }

    public CNPackRef getCnPackRef(){
       return cnPackRef;
    }

} // end of CNPack2SiteValueObject