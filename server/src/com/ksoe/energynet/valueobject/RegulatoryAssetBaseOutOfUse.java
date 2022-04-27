
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for RegulatoryAssetBaseOutOfUse;  	
  */

import java.util.Comparator;
import java.util.Date;
import java.util.Objects;
import java.io.Serializable;

import  com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseRef;

public class RegulatoryAssetBaseOutOfUse implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public Date dateStart;
    public Date dateFinish;

    public RegulatoryAssetBaseRef assetRef = new RegulatoryAssetBaseRef();

    public static final String tableName = "REGULATORYASSETBASETFS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "REGULATORYASSETBASETFS.CODE";
    public static final String dateStart_Attr = "dateStart";
    public static final String dateStart_Field = "DATESTART";
    public static final String dateStart_QFielld = "REGULATORYASSETBASETFS.DATESTART";
    public static final String dateFinish_Attr = "dateFinish";
    public static final String dateFinish_Field = "DATEFINISH";
    public static final String dateFinish_QFielld = "REGULATORYASSETBASETFS.DATEFINISH";

    public static final String assetRef_Attr = "assetRef";
    public static final String assetRef_Field = "ASSETREFCODE";
    public static final String  assetRef_QFielld = "REGULATORYASSETBASETFS.ASSETREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public Date getDateStart(){
       return dateStart;
    }

    public void setDateStart(Date dateStart){
       this.dateStart = dateStart;
    }


    public Date getDateFinish(){
       return dateFinish;
    }

    public void setDateFinish(Date dateFinish){
       this.dateFinish = dateFinish;
    }

    public RegulatoryAssetBaseRef getAssetRef(){
       return assetRef;
    }
    
    public void setAssetRef(RegulatoryAssetBaseRef assetRef){
       this.assetRef = assetRef;
    }
    
    @Override
    public boolean equals(Object object) {
		if(object == null || object.getClass() != this.getClass()) return false;
		if(this == object) return true;
		RegulatoryAssetBaseOutOfUse another = (RegulatoryAssetBaseOutOfUse)object;
		
		return Objects.equals(this.code, another.code)
				&& Objects.compare(this.dateStart, another.dateStart, Comparator.nullsFirst(Date::compareTo)) == 0
				&& Objects.compare(this.dateFinish, another.dateFinish, Comparator.nullsFirst(Date::compareTo)) == 0;
	}
    
    public boolean checkIfRecalculationIsNeeded(RegulatoryAssetBaseOutOfUse another) {
    	return !(Objects.compare(this.dateStart, another.dateStart, Comparator.nullsFirst(Date::compareTo)) == 0
				&& Objects.compare(this.dateFinish, another.dateFinish, Comparator.nullsFirst(Date::compareTo)) == 0);
    }

} // end of RegulatoryAssetBaseOutOfUseValueObject

