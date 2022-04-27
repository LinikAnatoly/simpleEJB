
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENMol2GeoDepartment;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.ENMol;
    import  com.ksoe.energynet.valueobject.references.ENGeographicDepartmentRef;

public class ENMol2GeoDepartment implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public long  modify_time = Long.MIN_VALUE;

    public ENMol mol = new ENMol();
    public ENGeographicDepartmentRef geoDepartment = new ENGeographicDepartmentRef();

    public static final String tableName = "ENMOL2GEODEPARTMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENMOL2GEODEPARTMENT.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENMOL2GEODEPARTMENT.MODIFY_TIME";

    public static final String mol_Attr = "mol";
    public static final String mol_Field = "MOLCODE";
    public static final String  mol_QFielld = "ENMOL2GEODEPARTMENT.MOLCODE";
    public static final String geoDepartment_Attr = "geoDepartment";
    public static final String geoDepartment_Field = "GEODEPARTMENTCODE";
    public static final String  geoDepartment_QFielld = "ENMOL2GEODEPARTMENT.GEODEPARTMENTCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public long getModify_time(){
       return modify_time;
    }
    
    public void setModify_time(long modify_time){
       this.modify_time = modify_time;
    }

    public ENMol getMol(){
       return mol;
    }
    
    public void setMol(ENMol mol){
       this.mol = mol;
    }
    public ENGeographicDepartmentRef getGeoDepartment(){
       return geoDepartment;
    }
    
    public void setGeoDepartment(ENGeographicDepartmentRef geoDepartment){
       this.geoDepartment = geoDepartment;
    }

} // end of ENMol2GeoDepartmentValueObject

