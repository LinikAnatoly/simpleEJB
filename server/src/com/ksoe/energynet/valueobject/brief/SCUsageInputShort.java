
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for SCUsageInput;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class SCUsageInputShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String numberDoc;
	public Date dateGen ;
	public Date dateStart ;
	public Date dateFinal ;
	public String molCode;
	public String molName;
	public Date dateEdit ;
	public String molCodeCounter;
	public String molNameCounter;
	public int isDocsReceived = Integer.MIN_VALUE;
	public String userGen;
	public int departmentCode = Integer.MIN_VALUE;
	public String departmentShortName;
	public Date departmentDateStart;
	public Date departmentDateFinal;
	public int departmentRenCode = Integer.MIN_VALUE;
	public String departmentShpzBalans;
	public int departmentKau_table_id_1884 = Integer.MIN_VALUE;
	public String departmentKau_1884;
	public String departmentName_1884;
	public String departmentHrmorganizationid;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;

        /** ****************  */
        public int iszku;
        /** ****************  */

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getNumberDoc() {
		return numberDoc;
	}

	public void setNumberDoc(String numberDoc) {
		this.numberDoc = numberDoc;
	}


	public Date getDateGen() {
		return dateGen;
	}

	public void setDateGen(Date dateGen) {
		this.dateGen = dateGen;
	}

	public Date getDateStart() {
		return dateStart;
	}

	public void setDateStart(Date dateStart) {
		this.dateStart = dateStart;
	}

	public Date getDateFinal() {
		return dateFinal;
	}

	public void setDateFinal(Date dateFinal) {
		this.dateFinal = dateFinal;
	}

	public String getMolCode() {
		return molCode;
	}

	public void setMolCode(String molCode) {
		this.molCode = molCode;
	}

	public String getMolName() {
		return molName;
	}

	public void setMolName(String molName) {
		this.molName = molName;
	}


	public Date getDateEdit() {
		return dateEdit;
	}

	public void setDateEdit(Date dateEdit) {
		this.dateEdit = dateEdit;
	}



	public String getMolCodeCounter() {
		return molCodeCounter;
	}

	public void setMolCodeCounter(String molCodeCounter) {
		this.molCodeCounter = molCodeCounter;
	}

	public String getMolNameCounter() {
		return molNameCounter;
	}

	public void setMolNameCounter(String molNameCounter) {
		this.molNameCounter = molNameCounter;
	}


	public int getIsDocsReceived() {
		return isDocsReceived;
	}

	public void setIsDocsReceived(int isDocsReceived) {
		this.isDocsReceived = isDocsReceived;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}




	public int getDepartmentCode(){
		return departmentCode;
	}

	public void setDepartmentCode(int departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getDepartmentShortName(){
		return departmentShortName;
	}

	public void setDepartmentShortName(String departmentShortName) {
		this.departmentShortName = departmentShortName;
	}

	public Date getDepartmentDateStart(){
		return departmentDateStart;
	}

	public void setDepartmentDateStart(Date departmentDateStart) {
		this.departmentDateStart = departmentDateStart;
	}

	public Date getDepartmentDateFinal(){
		return departmentDateFinal;
	}

	public void setDepartmentDateFinal(Date departmentDateFinal) {
		this.departmentDateFinal = departmentDateFinal;
	}

	public int getDepartmentRenCode(){
		return departmentRenCode;
	}

	public void setDepartmentRenCode(int departmentRenCode) {
		this.departmentRenCode = departmentRenCode;
	}

	public String getDepartmentShpzBalans(){
		return departmentShpzBalans;
	}

	public void setDepartmentShpzBalans(String departmentShpzBalans) {
		this.departmentShpzBalans = departmentShpzBalans;
	}

	public int getDepartmentKau_table_id_1884(){
		return departmentKau_table_id_1884;
	}

	public void setDepartmentKau_table_id_1884(int departmentKau_table_id_1884) {
		this.departmentKau_table_id_1884 = departmentKau_table_id_1884;
	}

	public String getDepartmentKau_1884(){
		return departmentKau_1884;
	}

	public void setDepartmentKau_1884(String departmentKau_1884) {
		this.departmentKau_1884 = departmentKau_1884;
	}

	public String getDepartmentName_1884(){
		return departmentName_1884;
	}

	public void setDepartmentName_1884(String departmentName_1884) {
		this.departmentName_1884 = departmentName_1884;
	}

	public String getDepartmentHrmorganizationid(){
		return departmentHrmorganizationid;
	}

	public void setDepartmentHrmorganizationid(String departmentHrmorganizationid) {
		this.departmentHrmorganizationid = departmentHrmorganizationid;
	}

	public int getStatusRefCode(){
		return statusRefCode;
	}

	public void setStatusRefCode(int statusRefCode) {
		this.statusRefCode = statusRefCode;
	}

	public String getStatusRefName(){
		return statusRefName;
	}

	public void setStatusRefName(String statusRefName) {
		this.statusRefName = statusRefName;
	}

        public void setIsZKU(int aValue){
    	    iszku = aValue;
        }

        public int getIsZKU(){
            return iszku;
        }


}
