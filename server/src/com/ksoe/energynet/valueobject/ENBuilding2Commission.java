
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBuilding2Commission;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENBuildingRef;
    import  com.ksoe.energynet.valueobject.references.ENBuildingCommissionTypeRef;

public class ENBuilding2Commission implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  tabNumber; 
    public String  FIO; 
    public String  shortFIO; 
    public String  positionName; 

    public ENBuildingRef ENBuildingRef = new ENBuildingRef();
    public ENBuildingCommissionTypeRef ENBuildingCommissionTypeRef = new ENBuildingCommissionTypeRef();

    public static final String tableName = "ENBUILDING2COMMISSION";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBUILDING2COMMISSION.CODE";
    public static final String tabNumber_Attr = "tabNumber";
    public static final String tabNumber_Field = "TABNUMBER";
    public static final String tabNumber_QFielld = "ENBUILDING2COMMISSION.TABNUMBER";
    public static final String FIO_Attr = "FIO";
    public static final String FIO_Field = "FIO";
    public static final String FIO_QFielld = "ENBUILDING2COMMISSION.FIO";
    public static final String shortFIO_Attr = "shortFIO";
    public static final String shortFIO_Field = "SHORTFIO";
    public static final String shortFIO_QFielld = "ENBUILDING2COMMISSION.SHORTFIO";
    public static final String positionName_Attr = "positionName";
    public static final String positionName_Field = "POSITIONNAME";
    public static final String positionName_QFielld = "ENBUILDING2COMMISSION.POSITIONNAME";

    public static final String ENBuildingRef_Attr = "ENBuildingRef";
    public static final String ENBuildingRef_Field = "ENBUILDINGREFCODE";
    public static final String  ENBuildingRef_QFielld = "ENBUILDING2COMMISSION.ENBUILDINGREFCODE";
    public static final String ENBuildingCommissionTypeRef_Attr = "ENBuildingCommissionTypeRef";
    public static final String ENBuildingCommissionTypeRef_Field = "ENBUILDINGCMMSSNTPRFCD";
    public static final String  ENBuildingCommissionTypeRef_QFielld = "ENBUILDING2COMMISSION.ENBUILDINGCMMSSNTPRFCD";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getTabNumber(){
       return tabNumber;
    }
    
    public void setTabNumber(String tabNumber){
       this.tabNumber = tabNumber;
    }


    public String getFIO(){
       return FIO;
    }
    
    public void setFIO(String FIO){
       this.FIO = FIO;
    }


    public String getShortFIO(){
       return shortFIO;
    }
    
    public void setShortFIO(String shortFIO){
       this.shortFIO = shortFIO;
    }


    public String getPositionName(){
       return positionName;
    }
    
    public void setPositionName(String positionName){
       this.positionName = positionName;
    }

    public ENBuildingRef getENBuildingRef(){
       return ENBuildingRef;
    }
    
    public void setENBuildingRef(ENBuildingRef ENBuildingRef){
       this.ENBuildingRef = ENBuildingRef;
    }
    public ENBuildingCommissionTypeRef getENBuildingCommissionTypeRef(){
       return ENBuildingCommissionTypeRef;
    }
    
    public void setENBuildingCommissionTypeRef(ENBuildingCommissionTypeRef ENBuildingCommissionTypeRef){
       this.ENBuildingCommissionTypeRef = ENBuildingCommissionTypeRef;
    }

} // end of ENBuilding2CommissionValueObject

