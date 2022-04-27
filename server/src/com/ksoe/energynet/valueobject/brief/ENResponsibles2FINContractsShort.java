
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENResponsibles2FINContracts;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENResponsibles2FINContractsShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int responsiblesRefCode = Integer.MIN_VALUE;
    public String responsiblesRefFIO;
    public int responsiblesRefTabNumber = Integer.MIN_VALUE;
    public String responsiblesRefPosition;
    public String responsiblesRefDepName;
    public String responsiblesRefDepCode;
    public String responsiblesRefPhone;
    public int finContractsCode = Integer.MIN_VALUE;
    public String finContractsContractNumber;
    public Date finContractsContractDate;
    public String finContractsFinDocCode;
    public int finContractsFinDocID = Integer.MIN_VALUE;
    public int finContractsOrgCode = Integer.MIN_VALUE;
    public String finContractsOrgName;

    public int getFinContractsOrgCode() {
		return finContractsOrgCode;
	}

	public void setFinContractsOrgCode(int finContractsOrgCode) {
		this.finContractsOrgCode = finContractsOrgCode;
	}

	public String getFinContractsOrgName() {
		return finContractsOrgName;
	}

	public void setFinContractsOrgName(String finContractsOrgName) {
		this.finContractsOrgName = finContractsOrgName;
	}

	public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setResponsiblesRefCode(int aValue){
       responsiblesRefCode = aValue;
    }
    public int getResponsiblesRefCode(){
       return responsiblesRefCode;
    }

    public void setResponsiblesRefFIO(String aValue){
       responsiblesRefFIO = aValue;
    }
    public String getResponsiblesRefFIO(){
       return responsiblesRefFIO;
    }

    public void setResponsiblesRefTabNumber(int aValue){
       responsiblesRefTabNumber = aValue;
    }
    public int getResponsiblesRefTabNumber(){
       return responsiblesRefTabNumber;
    }

    public void setResponsiblesRefPosition(String aValue){
       responsiblesRefPosition = aValue;
    }
    public String getResponsiblesRefPosition(){
       return responsiblesRefPosition;
    }

    public void setResponsiblesRefDepName(String aValue){
       responsiblesRefDepName = aValue;
    }
    public String getResponsiblesRefDepName(){
       return responsiblesRefDepName;
    }

    public void setResponsiblesRefDepCode(String aValue){
       responsiblesRefDepCode = aValue;
    }
    public String getResponsiblesRefDepCode(){
       return responsiblesRefDepCode;
    }

    public void setResponsiblesRefPhone(String aValue){
       responsiblesRefPhone = aValue;
    }
    public String getResponsiblesRefPhone(){
       return responsiblesRefPhone;
    }

    public void setFinContractsCode(int aValue){
       finContractsCode = aValue;
    }
    public int getFinContractsCode(){
       return finContractsCode;
    }

    public void setFinContractsContractNumber(String aValue){
       finContractsContractNumber = aValue;
    }
    public String getFinContractsContractNumber(){
       return finContractsContractNumber;
    }


    public void setFinContractsContractDate(Date aValue){
       finContractsContractDate = aValue;
    }
    public Date getFinContractsContractDate(){
       return finContractsContractDate;
    }

    public void setFinContractsFinDocCode(String aValue){
       finContractsFinDocCode = aValue;
    }
    public String getFinContractsFinDocCode(){
       return finContractsFinDocCode;
    }

    public void setFinContractsFinDocID(int aValue){
       finContractsFinDocID = aValue;
    }
    public int getFinContractsFinDocID(){
       return finContractsFinDocID;
    }



}