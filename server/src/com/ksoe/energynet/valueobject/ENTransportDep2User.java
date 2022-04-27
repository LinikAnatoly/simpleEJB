
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportDep2User;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.ENTransportDepartment;

public class ENTransportDep2User implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public int  userCode = Integer.MIN_VALUE;

    public ENTransportDepartment transportDepartment = new ENTransportDepartment();

    public static final String tableName = "ENTRANSPORTDEP2USER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSPORTDEP2USER.CODE";
    public static final String userCode_Attr = "userCode";
    public static final String userCode_Field = "USERCODE";
    public static final String userCode_QFielld = "ENTRANSPORTDEP2USER.USERCODE";

    public static final String transportDepartment_Attr = "transportDepartment";
    public static final String transportDepartment_Field = "TRANSPORTDEPARTMENTCOD";
    public static final String  transportDepartment_QFielld = "ENTRANSPORTDEP2USER.TRANSPORTDEPARTMENTCOD";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public int getUserCode(){
       return userCode;
    }
    
    public void setUserCode(int userCode){
       this.userCode = userCode;
    }

    public ENTransportDepartment getTransportDepartment(){
       return transportDepartment;
    }
    
    public void setTransportDepartment(ENTransportDepartment transportDepartment){
       this.transportDepartment = transportDepartment;
    }

} // end of ENTransportDep2UserValueObject

