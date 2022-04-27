
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENRoadTypeDataENRoadTypeData;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENRoadTypeRef;

public class ENRoadTypeData implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  speed; 
    public BigDecimal  distance; 
    public int  isWinter = Integer.MIN_VALUE; 
    public BigDecimal  coeff; 
    public ENRoadTypeRef typeRef = new ENRoadTypeRef();
    public static final String tableName = "ENROADTYPEDATA";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENROADTYPEDATA.CODE";
    public static final String speed_Attr = "speed";
    public static final String speed_Field = "SPEED";
    public static final String speed_QFielld = "ENROADTYPEDATA.SPEED";
    public static final String distance_Attr = "distance";
    public static final String distance_Field = "DISTANCE";
    public static final String distance_QFielld = "ENROADTYPEDATA.DISTANCE";
    public static final String isWinter_Attr = "isWinter";
    public static final String isWinter_Field = "ISWINTER";
    public static final String isWinter_QFielld = "ENROADTYPEDATA.ISWINTER";
    public static final String coeff_Attr = "coeff";
    public static final String coeff_Field = "COEFF";
    public static final String coeff_QFielld = "ENROADTYPEDATA.COEFF";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENROADTYPEDATA.TYPEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setSpeed(BigDecimal aValue){
       speed = aValue;
    }

    public BigDecimal getSpeed(){
       return speed;
    }

    public void setDistance(BigDecimal aValue){
       distance = aValue;
    }

    public BigDecimal getDistance(){
       return distance;
    }

    public void setIsWinter(int aValue){
       isWinter = aValue;
    }

    public int getIsWinter(){
       return isWinter;
    }

    public void setCoeff(BigDecimal aValue){
       coeff = aValue;
    }

    public BigDecimal getCoeff(){
       return coeff;
    }

;
    public void setTypeRef(ENRoadTypeRef aValue){
       typeRef = aValue;
    }

    public ENRoadTypeRef getTypeRef(){
       return typeRef;
    }

} // end of ENRoadTypeDataValueObject

