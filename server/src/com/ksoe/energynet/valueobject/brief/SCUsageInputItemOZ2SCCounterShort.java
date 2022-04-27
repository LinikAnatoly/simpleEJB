
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for SCUsageInputItemOZ2SCCounter;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class SCUsageInputItemOZ2SCCounterShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int ozRefCode = Integer.MIN_VALUE;
    public String ozRefNumberDoc;
    public String ozRefCounterType;
    public String ozRefAccount;
    public BigDecimal ozRefCost;
    public int ozRefCountGen = Integer.MIN_VALUE;
    public int ozRefScCode = Integer.MIN_VALUE;
    public int scCounterRefCode = Integer.MIN_VALUE;
    public String scCounterRefInvNumber;
    public String scCounterRefName;
    public String scCounterRefBuildNumber;
    public String scCounterRefAccount;
    public String scCounterRefDepartmetFKCode;
    public String scCounterRefMolCode;
    public Date scCounterRefDateIn;
    public Date scCounterRefDateBuild;
    public Date scCounterRefDateCheck;
    public BigDecimal scCounterRefCost;
    public int scCounterRefScCode = Integer.MIN_VALUE;
    public String scCounterRefCounterType;
    public String scCounterRefInstallOrderNumber;
    public String scCounterRefReading;
    public Date scCounterRefDateEdit;

    
    
    public int scCounterEstimateItemRefCode = Integer.MIN_VALUE;
    
    
    public int getScCounterEstimateItemRefCode() {
		return scCounterEstimateItemRefCode;
	}

	public void setScCounterEstimateItemRefCode(int scCounterEstimateItemRefCode) {
		this.scCounterEstimateItemRefCode = scCounterEstimateItemRefCode;
	}

	public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setOzRefCode(int aValue){
       ozRefCode = aValue;
    }
    public int getOzRefCode(){
       return ozRefCode;
    }

    public void setOzRefNumberDoc(String aValue){
       ozRefNumberDoc = aValue;
    }
    public String getOzRefNumberDoc(){
       return ozRefNumberDoc;
    }

    public void setOzRefCounterType(String aValue){
       ozRefCounterType = aValue;
    }
    public String getOzRefCounterType(){
       return ozRefCounterType;
    }

    public void setOzRefAccount(String aValue){
       ozRefAccount = aValue;
    }
    public String getOzRefAccount(){
       return ozRefAccount;
    }

    public void setOzRefCost(BigDecimal aValue){
       ozRefCost = aValue;
    }
    public BigDecimal getOzRefCost(){
       return ozRefCost;
    }

    public void setOzRefCountGen(int aValue){
       ozRefCountGen = aValue;
    }
    public int getOzRefCountGen(){
       return ozRefCountGen;
    }

    public void setOzRefScCode(int aValue){
       ozRefScCode = aValue;
    }
    public int getOzRefScCode(){
       return ozRefScCode;
    }

    public void setScCounterRefCode(int aValue){
       scCounterRefCode = aValue;
    }
    public int getScCounterRefCode(){
       return scCounterRefCode;
    }

    public void setScCounterRefInvNumber(String aValue){
       scCounterRefInvNumber = aValue;
    }
    public String getScCounterRefInvNumber(){
       return scCounterRefInvNumber;
    }

    public void setScCounterRefName(String aValue){
       scCounterRefName = aValue;
    }
    public String getScCounterRefName(){
       return scCounterRefName;
    }

    public void setScCounterRefBuildNumber(String aValue){
       scCounterRefBuildNumber = aValue;
    }
    public String getScCounterRefBuildNumber(){
       return scCounterRefBuildNumber;
    }

    public void setScCounterRefAccount(String aValue){
       scCounterRefAccount = aValue;
    }
    public String getScCounterRefAccount(){
       return scCounterRefAccount;
    }

    public void setScCounterRefDepartmetFKCode(String aValue){
       scCounterRefDepartmetFKCode = aValue;
    }
    public String getScCounterRefDepartmetFKCode(){
       return scCounterRefDepartmetFKCode;
    }

    public void setScCounterRefMolCode(String aValue){
       scCounterRefMolCode = aValue;
    }
    public String getScCounterRefMolCode(){
       return scCounterRefMolCode;
    }


    public void setScCounterRefDateIn(Date aValue){
       scCounterRefDateIn = aValue;
    }
    public Date getScCounterRefDateIn(){
       return scCounterRefDateIn;
    }


    public void setScCounterRefDateBuild(Date aValue){
       scCounterRefDateBuild = aValue;
    }
    public Date getScCounterRefDateBuild(){
       return scCounterRefDateBuild;
    }


    public void setScCounterRefDateCheck(Date aValue){
       scCounterRefDateCheck = aValue;
    }
    public Date getScCounterRefDateCheck(){
       return scCounterRefDateCheck;
    }

    public void setScCounterRefCost(BigDecimal aValue){
       scCounterRefCost = aValue;
    }
    public BigDecimal getScCounterRefCost(){
       return scCounterRefCost;
    }

    public void setScCounterRefScCode(int aValue){
       scCounterRefScCode = aValue;
    }
    public int getScCounterRefScCode(){
       return scCounterRefScCode;
    }

    public void setScCounterRefCounterType(String aValue){
       scCounterRefCounterType = aValue;
    }
    public String getScCounterRefCounterType(){
       return scCounterRefCounterType;
    }

    public void setScCounterRefInstallOrderNumber(String aValue){
       scCounterRefInstallOrderNumber = aValue;
    }
    public String getScCounterRefInstallOrderNumber(){
       return scCounterRefInstallOrderNumber;
    }

    public void setScCounterRefReading(String aValue){
       scCounterRefReading = aValue;
    }
    public String getScCounterRefReading(){
       return scCounterRefReading;
    }


    public void setScCounterRefDateEdit(Date aValue){
       scCounterRefDateEdit = aValue;
    }
    public Date getScCounterRefDateEdit(){
       return scCounterRefDateEdit;
    }



}