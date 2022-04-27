
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSettingForDFDecree;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSettingForDFDecreeShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public int dfDocTypeCode = Integer.MIN_VALUE;
	public String dfDocTypeName;
	public int catalogCode = Integer.MIN_VALUE;
	public String catalogName;
	public int dfDocPrefixCode = Integer.MIN_VALUE;
	public String dfDocPrefixName;
	public String prefixSignerTabN;
	public String prefixSignerFio;
	public String prefixSignerPostInfo;
	public String initiatorTabn;
	public String initiatorFio;
	public String initiatorPodrName;
	public int initiatorPodrCode = Integer.MIN_VALUE;
	public String designatedTabn;
	public String designatedFio;
	public String designatedpostInfo;
	public int departmentRefCode = Integer.MIN_VALUE;
	public String departmentRefShortName;
	public Date departmentRefDateStart;
	public Date departmentRefDateFinal;
	public int departmentRefRenCode = Integer.MIN_VALUE;
	public String departmentRefShpzBalans;
	public int departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
	public String departmentRefKau_1884;
	public String departmentRefName_1884;
	public String departmentRefHrmorganizationid;
	public int responsRefCode = Integer.MIN_VALUE;
	public String responsRefNumbergen;
	public String responsRefName;
	public String responsRefWarrantFIO;
	public String responsRefWarrantShortFIO;
	public String responsRefWarrantPosition;
	public String responsRefGenitiveFIO;
	public String responsRefGenitivePosition;
	public String responsRefPassport;
	public String responsRefAddress;
	public int responsRefPower = Integer.MIN_VALUE;
	public BigDecimal responsRefMaxSum;
	public String responsRefDepartmentName;
	public String responsRefDepartmentNameGenitive;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setDfDocTypeCode(int aValue){
		dfDocTypeCode = aValue;
	}

	public int getDfDocTypeCode(){
		return dfDocTypeCode;
	}

	public void setDfDocTypeName(String aValue){
		dfDocTypeName = aValue;
	}

	public String getDfDocTypeName(){
		return dfDocTypeName;
	}

	public void setCatalogCode(int aValue){
		catalogCode = aValue;
	}

	public int getCatalogCode(){
		return catalogCode;
	}

	public void setCatalogName(String aValue){
		catalogName = aValue;
	}

	public String getCatalogName(){
		return catalogName;
	}

	public void setDfDocPrefixCode(int aValue){
		dfDocPrefixCode = aValue;
	}

	public int getDfDocPrefixCode(){
		return dfDocPrefixCode;
	}

	public void setDfDocPrefixName(String aValue){
		dfDocPrefixName = aValue;
	}

	public String getDfDocPrefixName(){
		return dfDocPrefixName;
	}

	public void setPrefixSignerTabN(String aValue){
		prefixSignerTabN = aValue;
	}

	public String getPrefixSignerTabN(){
		return prefixSignerTabN;
	}

	public void setPrefixSignerFio(String aValue){
		prefixSignerFio = aValue;
	}

	public String getPrefixSignerFio(){
		return prefixSignerFio;
	}

	public void setPrefixSignerPostInfo(String aValue){
		prefixSignerPostInfo = aValue;
	}

	public String getPrefixSignerPostInfo(){
		return prefixSignerPostInfo;
	}

	public void setInitiatorTabn(String aValue){
		initiatorTabn = aValue;
	}

	public String getInitiatorTabn(){
		return initiatorTabn;
	}

	public void setInitiatorFio(String aValue){
		initiatorFio = aValue;
	}

	public String getInitiatorFio(){
		return initiatorFio;
	}

	public void setInitiatorPodrName(String aValue){
		initiatorPodrName = aValue;
	}

	public String getInitiatorPodrName(){
		return initiatorPodrName;
	}

	public void setInitiatorPodrCode(int aValue){
		initiatorPodrCode = aValue;
	}

	public int getInitiatorPodrCode(){
		return initiatorPodrCode;
	}

	public void setDesignatedTabn(String aValue){
		designatedTabn = aValue;
	}

	public String getDesignatedTabn(){
		return designatedTabn;
	}

	public void setDesignatedFio(String aValue){
		designatedFio = aValue;
	}

	public String getDesignatedFio(){
		return designatedFio;
	}

	public void setDesignatedpostInfo(String aValue){
		designatedpostInfo = aValue;
	}

	public String getDesignatedpostInfo(){
		return designatedpostInfo;
	}


	public void setDepartmentRefCode(int aValue){
		departmentRefCode = aValue;
	}
	public int getDepartmentRefCode(){
		return departmentRefCode;
	}

	public void setDepartmentRefShortName(String aValue){
		departmentRefShortName = aValue;
	}
	public String getDepartmentRefShortName(){
		return departmentRefShortName;
	}

	public void setDepartmentRefDateStart(Date aValue){
		departmentRefDateStart = aValue;
	}
	public Date getDepartmentRefDateStart(){
		return departmentRefDateStart;
	}

	public void setDepartmentRefDateFinal(Date aValue){
		departmentRefDateFinal = aValue;
	}
	public Date getDepartmentRefDateFinal(){
		return departmentRefDateFinal;
	}

	public void setDepartmentRefRenCode(int aValue){
		departmentRefRenCode = aValue;
	}
	public int getDepartmentRefRenCode(){
		return departmentRefRenCode;
	}

	public void setDepartmentRefShpzBalans(String aValue){
		departmentRefShpzBalans = aValue;
	}
	public String getDepartmentRefShpzBalans(){
		return departmentRefShpzBalans;
	}

	public void setDepartmentRefKau_table_id_1884(int aValue){
		departmentRefKau_table_id_1884 = aValue;
	}
	public int getDepartmentRefKau_table_id_1884(){
		return departmentRefKau_table_id_1884;
	}

	public void setDepartmentRefKau_1884(String aValue){
		departmentRefKau_1884 = aValue;
	}
	public String getDepartmentRefKau_1884(){
		return departmentRefKau_1884;
	}

	public void setDepartmentRefName_1884(String aValue){
		departmentRefName_1884 = aValue;
	}
	public String getDepartmentRefName_1884(){
		return departmentRefName_1884;
	}

	public void setDepartmentRefHrmorganizationid(String aValue){
		departmentRefHrmorganizationid = aValue;
	}
	public String getDepartmentRefHrmorganizationid(){
		return departmentRefHrmorganizationid;
	}

	public void setResponsRefCode(int aValue){
		responsRefCode = aValue;
	}
	public int getResponsRefCode(){
		return responsRefCode;
	}

	public void setResponsRefNumbergen(String aValue){
		responsRefNumbergen = aValue;
	}
	public String getResponsRefNumbergen(){
		return responsRefNumbergen;
	}

	public void setResponsRefName(String aValue){
		responsRefName = aValue;
	}
	public String getResponsRefName(){
		return responsRefName;
	}

	public void setResponsRefWarrantFIO(String aValue){
		responsRefWarrantFIO = aValue;
	}
	public String getResponsRefWarrantFIO(){
		return responsRefWarrantFIO;
	}

	public void setResponsRefWarrantShortFIO(String aValue){
		responsRefWarrantShortFIO = aValue;
	}
	public String getResponsRefWarrantShortFIO(){
		return responsRefWarrantShortFIO;
	}

	public void setResponsRefWarrantPosition(String aValue){
		responsRefWarrantPosition = aValue;
	}
	public String getResponsRefWarrantPosition(){
		return responsRefWarrantPosition;
	}

	public void setResponsRefGenitiveFIO(String aValue){
		responsRefGenitiveFIO = aValue;
	}
	public String getResponsRefGenitiveFIO(){
		return responsRefGenitiveFIO;
	}

	public void setResponsRefGenitivePosition(String aValue){
		responsRefGenitivePosition = aValue;
	}
	public String getResponsRefGenitivePosition(){
		return responsRefGenitivePosition;
	}

	public void setResponsRefPassport(String aValue){
		responsRefPassport = aValue;
	}
	public String getResponsRefPassport(){
		return responsRefPassport;
	}

	public void setResponsRefAddress(String aValue){
		responsRefAddress = aValue;
	}
	public String getResponsRefAddress(){
		return responsRefAddress;
	}

	public void setResponsRefPower(int aValue){
		responsRefPower = aValue;
	}
	public int getResponsRefPower(){
		return responsRefPower;
	}

	public void setResponsRefMaxSum(BigDecimal aValue){
		responsRefMaxSum = aValue;
	}
	public BigDecimal getResponsRefMaxSum(){
		return responsRefMaxSum;
	}

	public void setResponsRefDepartmentName(String aValue){
		responsRefDepartmentName = aValue;
	}
	public String getResponsRefDepartmentName(){
		return responsRefDepartmentName;
	}

	public void setResponsRefDepartmentNameGenitive(String aValue){
		responsRefDepartmentNameGenitive = aValue;
	}
	public String getResponsRefDepartmentNameGenitive(){
		return responsRefDepartmentNameGenitive;
	}



}
