
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENWarrant;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENWarrantShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String numbergen;
	public String name;
	public String warrantFIO;
	public String warrantShortFIO;
	public String warrantPosition;
	public String genitiveFIO;
	public String genitivePosition;
	public String passport;
	public String address;
	public int power = Integer.MIN_VALUE;
	public BigDecimal maxSum;
	public String departmentName;
	public String departmentNameGenitive;
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
	public int warrantStatusRefCode = Integer.MIN_VALUE;
	public String warrantStatusRefName;
	public int warrantTypeRefCode = Integer.MIN_VALUE;
	public String warrantTypeRefName;
	public Date dateGen;


	public Date getDateGen() {
		return dateGen;
	}

	public void setDateGen(Date dateGen) {
		this.dateGen = dateGen;
	}

	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setNumbergen(String aValue){
		numbergen = aValue;
	}

	public String getNumbergen(){
		return numbergen;
	}

	public void setName(String aValue){
		name = aValue;
	}

	public String getName(){
		return name;
	}



	public void setWarrantFIO(String aValue){
		warrantFIO = aValue;
	}

	public String getWarrantFIO(){
		return warrantFIO;
	}

	public void setWarrantShortFIO(String aValue){
		warrantShortFIO = aValue;
	}

	public String getWarrantShortFIO(){
		return warrantShortFIO;
	}

	public void setWarrantPosition(String aValue){
		warrantPosition = aValue;
	}

	public String getWarrantPosition(){
		return warrantPosition;
	}

	public void setGenitiveFIO(String aValue){
		genitiveFIO = aValue;
	}

	public String getGenitiveFIO(){
		return genitiveFIO;
	}

	public void setGenitivePosition(String aValue){
		genitivePosition = aValue;
	}

	public String getGenitivePosition(){
		return genitivePosition;
	}







	public void setPassport(String aValue){
		passport = aValue;
	}

	public String getPassport(){
		return passport;
	}

	public void setAddress(String aValue){
		address = aValue;
	}

	public String getAddress(){
		return address;
	}


	public void setPower(int aValue){
		power = aValue;
	}

	public int getPower(){
		return power;
	}

	public void setMaxSum(BigDecimal aValue){
		maxSum = aValue;
	}

	public BigDecimal getMaxSum(){
		return maxSum;
	}



	public void setDepartmentName(String aValue){
		departmentName = aValue;
	}

	public String getDepartmentName(){
		return departmentName;
	}

	public void setDepartmentNameGenitive(String aValue){
		departmentNameGenitive = aValue;
	}

	public String getDepartmentNameGenitive(){
		return departmentNameGenitive;
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

	public void setWarrantStatusRefCode(int aValue){
		warrantStatusRefCode = aValue;
	}
	public int getWarrantStatusRefCode(){
		return warrantStatusRefCode;
	}

	public void setWarrantStatusRefName(String aValue){
		warrantStatusRefName = aValue;
	}
	public String getWarrantStatusRefName(){
		return warrantStatusRefName;
	}

	public void setWarrantTypeRefCode(int aValue){
		warrantTypeRefCode = aValue;
	}
	public int getWarrantTypeRefCode(){
		return warrantTypeRefCode;
	}

	public void setWarrantTypeRefName(String aValue){
		warrantTypeRefName = aValue;
	}
	public String getWarrantTypeRefName(){
		return warrantTypeRefName;
	}



}
