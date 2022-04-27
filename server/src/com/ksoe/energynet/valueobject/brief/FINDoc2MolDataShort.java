
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FINDoc2MolData;  	
  */

import java.io.Serializable;


public class FINDoc2MolDataShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int finDocCode = Integer.MIN_VALUE; 
    public String axJournalId;
    public int molDataCode = Integer.MIN_VALUE; 
    public String molDataFinMolCode; 
    public String molDataFinMolName; 
    public int finDocTypeRefCode = Integer.MIN_VALUE; 
    public String finDocTypeRefName; 
    
    public int molDataTypeRefCode = Integer.MIN_VALUE;
    public String molDataTypeRefName;
    public int finDocCode2 = Integer.MIN_VALUE;
    
    public int getFinDocCode2() {
		return finDocCode2;
	}
	public void setFinDocCode2(int finDocCode2) {
		this.finDocCode2 = finDocCode2;
	}
	public int getMolDataTypeRefCode() {
		return molDataTypeRefCode;
	}
	public void setMolDataTypeRefCode(int molDataTypeRefCode) {
		this.molDataTypeRefCode = molDataTypeRefCode;
	}
	public String getMolDataTypeRefName() {
		return molDataTypeRefName;
	}
	public void setMolDataTypeRefName(String molDataTypeRefName) {
		this.molDataTypeRefName = molDataTypeRefName;
	}
	public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setFinDocCode(int aValue){
       finDocCode = aValue;
    }
    public int getFinDocCode(){
       return finDocCode;
    }
	
public void setAxJournalId(String aValue){
		axJournalId = aValue;
	}

	public String getAxJournalId(){
		return axJournalId;
	}

    public void setMolDataCode(int aValue){
       molDataCode = aValue;
    }
    public int getMolDataCode(){
       return molDataCode;
    }
	
    public void setMolDataFinMolCode(String aValue){
       molDataFinMolCode = aValue;
    }
    public String getMolDataFinMolCode(){
       return molDataFinMolCode;
    }
	
    public void setMolDataFinMolName(String aValue){
       molDataFinMolName = aValue;
    }
    public String getMolDataFinMolName(){
       return molDataFinMolName;
    }
	
    public void setFinDocTypeRefCode(int aValue){
       finDocTypeRefCode = aValue;
    }
    public int getFinDocTypeRefCode(){
       return finDocTypeRefCode;
    }
	
    public void setFinDocTypeRefName(String aValue){
       finDocTypeRefName = aValue;
    }
    public String getFinDocTypeRefName(){
       return finDocTypeRefName;
    }
	



}