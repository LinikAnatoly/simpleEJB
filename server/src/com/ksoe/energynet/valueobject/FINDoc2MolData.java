
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINDoc2MolData;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.FINMolData;
    import  com.ksoe.energynet.valueobject.references.FINDocTypeRef;

public class FINDoc2MolData implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  finDocCode = Integer.MIN_VALUE; 
    public int  finDocCode2 = Integer.MIN_VALUE; 
    public String  axJournalId; 
    public long  modify_time = Long.MIN_VALUE;
    public FINMolData molData = new FINMolData();
    public FINDocTypeRef finDocTypeRef = new FINDocTypeRef();
    public static final String tableName = "FINDOC2MOLDATA";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINDOC2MOLDATA.CODE";
    public static final String finDocCode_Attr = "finDocCode";
    public static final String finDocCode_Field = "FINDOCCODE";
    public static final String finDocCode_QFielld = "FINDOC2MOLDATA.FINDOCCODE";
    public static final String finDocCode2_Attr = "finDocCode2";
    public static final String finDocCode2_Field = "FINDOCCODE2";
    public static final String finDocCode2_QFielld = "FINDOC2MOLDATA.FINDOCCODE2";
    public static final String axJournalId_Attr = "axJournalId";
    public static final String axJournalId_Field = "AXJOURNALID";
    public static final String axJournalId_QFielld = "FINDOC2MOLDATA.AXJOURNALID";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "FINDOC2MOLDATA.MODIFY_TIME";
    public static final String molData_Attr = "molData";
    public static final String molData_Field = "MOLDATACODE";
    public static final String  molData_QFielld = "FINDOC2MOLDATA.MOLDATACODE";
    public static final String finDocTypeRef_Attr = "finDocTypeRef";
    public static final String finDocTypeRef_Field = "FINDOCTYPEREFCODE";
    public static final String  finDocTypeRef_QFielld = "FINDOC2MOLDATA.FINDOCTYPEREFCODE";
	public String  molCode;
	public boolean isPostingJournal;
	public boolean isRemoveJournal;
	public int molTypeCode= Integer.MIN_VALUE;
	
	public int getMolTypeCode() {
		return molTypeCode;
	}

	public void setMolTypeCode(int molTypeCode) {
		this.molTypeCode = molTypeCode;
	}

	public boolean isRemoveJournal() {
		return isRemoveJournal;
	}

	public void setRemoveJournal(boolean isRemoveJournal) {
		this.isRemoveJournal = isRemoveJournal;
	}

	public boolean isPostingJournal() {
		return isPostingJournal;
	}

	public void setPostingJournal(boolean isPostingJournal) {
		this.isPostingJournal = isPostingJournal;
	}

	public String getMolCode() {
		return molCode;
	}

	public void setMolCode(String molCode) {
		this.molCode = molCode;
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


    public void setFinDocCode2(int aValue){
       finDocCode2 = aValue;
    }

    public int getFinDocCode2(){
       return finDocCode2;
    }


    public void setAxJournalId(String aValue){
       axJournalId = aValue;
    }

    public String getAxJournalId(){
       return axJournalId;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setMolData(FINMolData aValue){
       molData = aValue;
    }

    public FINMolData getMolData(){
       return molData;
    }
    public void setFinDocTypeRef(FINDocTypeRef aValue){
       finDocTypeRef = aValue;
    }

    public FINDocTypeRef getFinDocTypeRef(){
       return finDocTypeRef;
    }

} // end of FINDoc2MolDataValueObject

