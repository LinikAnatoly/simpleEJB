
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDepartment2EPRen;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENDepartment2EPRenShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String billingServerIp;
	public String billingServerJnpPort;
	public String billingServerPort;
	public int finRenCode = Integer.MIN_VALUE;
	public String finCFOCode;
	public String finServicesCode;
	public int domainCode = Integer.MIN_VALUE;
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
	public int renRefCode = Integer.MIN_VALUE;
	public String renRefName;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setBillingServerIp(String aValue){
		billingServerIp = aValue;
	}

	public String getBillingServerIp(){
		return billingServerIp;
	}

	public void setBillingServerJnpPort(String aValue){
		billingServerJnpPort = aValue;
	}

	public String getBillingServerJnpPort(){
		return billingServerJnpPort;
	}

	public void setBillingServerPort(String aValue){
		billingServerPort = aValue;
	}

	public String getBillingServerPort(){
		return billingServerPort;
	}

	public void setFinRenCode(int aValue){
		finRenCode = aValue;
	}

	public int getFinRenCode(){
		return finRenCode;
	}

	public void setFinCFOCode(String aValue){
		finCFOCode = aValue;
	}

	public String getFinCFOCode(){
		return finCFOCode;
	}

	public void setFinServicesCode(String aValue){
		finServicesCode = aValue;
	}

	public String getFinServicesCode(){
		return finServicesCode;
	}

	public void setDomainCode(int aValue){
		domainCode = aValue;
	}

	public int getDomainCode(){
		return domainCode;
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

	public void setRenRefCode(int aValue){
		renRefCode = aValue;
	}
	public int getRenRefCode(){
		return renRefCode;
	}

	public void setRenRefName(String aValue){
		renRefName = aValue;
	}
	public String getRenRefName(){
		return renRefName;
	}



}
