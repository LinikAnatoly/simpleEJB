
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENBankingDetails;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENBankingDetailsShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String bankname;
	public String bankokpo;
	public int bankmfo = Integer.MIN_VALUE;
	public String bankaccount;
	public String partnercode;
	public String contract;
	public int useDefault = Integer.MIN_VALUE;
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
	public int billTypeRefCode = Integer.MIN_VALUE;
	public String billTypeRefName;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setBankname(String aValue){
		bankname = aValue;
	}

	public String getBankname(){
		return bankname;
	}

	public void setBankokpo(String aValue){
		bankokpo = aValue;
	}

	public String getBankokpo(){
		return bankokpo;
	}

	public void setBankmfo(int aValue){
		bankmfo = aValue;
	}

	public int getBankmfo(){
		return bankmfo;
	}

	public void setBankaccount(String aValue){
		bankaccount = aValue;
	}

	public String getBankaccount(){
		return bankaccount;
	}

	public void setPartnercode(String aValue){
		partnercode = aValue;
	}

	public String getPartnercode(){
		return partnercode;
	}

	public void setContract(String aValue){
		contract = aValue;
	}

	public String getContract(){
		return contract;
	}

	public void setUseDefault(int aValue){
		useDefault = aValue;
	}

	public int getUseDefault(){
		return useDefault;
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

	public void setBillTypeRefCode(int aValue){
		billTypeRefCode = aValue;
	}
	public int getBillTypeRefCode(){
		return billTypeRefCode;
	}

	public void setBillTypeRefName(String aValue){
		billTypeRefName = aValue;
	}
	public String getBillTypeRefName(){
		return billTypeRefName;
	}



}
