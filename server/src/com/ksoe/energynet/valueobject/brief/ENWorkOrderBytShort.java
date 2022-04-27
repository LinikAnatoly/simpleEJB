
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENWorkOrderByt;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENWorkOrderBytShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String numberGen;
    public Date dateGen ;
    public String commentGen;
    public Date dateAdd ;
    public Date dateEdit ;
    public String userAdd;
    public String userEdit;
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
    public int siteRefCode = Integer.MIN_VALUE;
    public String siteRefName;
    public String siteRefSiteaddress;
    public String siteRefSitephone;
    public int finWorkerCode = Integer.MIN_VALUE;
    public String finWorkerName;
    public String finWorkerTabNumber;
    public String finWorkerPositionName;
    public int finWorkerPositionCode = Integer.MIN_VALUE;
    public String finWorkerDepartmentName;
    public String finWorkerDepartmentCode;
    public BigDecimal finWorkerPriceGen;
    public int finWorkerCategor = Integer.MIN_VALUE;
    public int finWorkerFinCode = Integer.MIN_VALUE;
    public int finWorkerIsSentAssignment = Integer.MIN_VALUE;
    public BigDecimal finWorkerChargePercent;
    public int finWorkerCategorId = Integer.MIN_VALUE;
    public String finWorkerCategorName;
    public String finWorkerWorkTimeId;
    public String finWorkerPositionId;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;
    public int statusRefCode = Integer.MIN_VALUE;
    public String statusRefName;


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }

    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }

    public void setUserEdit(String aValue){
       userEdit = aValue;
    }

    public String getUserEdit(){
       return userEdit;
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

    public void setSiteRefCode(int aValue){
       siteRefCode = aValue;
    }
    public int getSiteRefCode(){
       return siteRefCode;
    }

    public void setSiteRefName(String aValue){
       siteRefName = aValue;
    }
    public String getSiteRefName(){
       return siteRefName;
    }

    public void setSiteRefSiteaddress(String aValue){
       siteRefSiteaddress = aValue;
    }
    public String getSiteRefSiteaddress(){
       return siteRefSiteaddress;
    }

    public void setSiteRefSitephone(String aValue){
       siteRefSitephone = aValue;
    }
    public String getSiteRefSitephone(){
       return siteRefSitephone;
    }

    public void setFinWorkerCode(int aValue){
       finWorkerCode = aValue;
    }
    public int getFinWorkerCode(){
       return finWorkerCode;
    }

    public void setFinWorkerName(String aValue){
       finWorkerName = aValue;
    }
    public String getFinWorkerName(){
       return finWorkerName;
    }

    public void setFinWorkerTabNumber(String aValue){
       finWorkerTabNumber = aValue;
    }
    public String getFinWorkerTabNumber(){
       return finWorkerTabNumber;
    }

    public void setFinWorkerPositionName(String aValue){
       finWorkerPositionName = aValue;
    }
    public String getFinWorkerPositionName(){
       return finWorkerPositionName;
    }

    public void setFinWorkerPositionCode(int aValue){
       finWorkerPositionCode = aValue;
    }
    public int getFinWorkerPositionCode(){
       return finWorkerPositionCode;
    }

    public void setFinWorkerDepartmentName(String aValue){
       finWorkerDepartmentName = aValue;
    }
    public String getFinWorkerDepartmentName(){
       return finWorkerDepartmentName;
    }

    public void setFinWorkerDepartmentCode(String aValue){
       finWorkerDepartmentCode = aValue;
    }
    public String getFinWorkerDepartmentCode(){
       return finWorkerDepartmentCode;
    }

    public void setFinWorkerPriceGen(BigDecimal aValue){
       finWorkerPriceGen = aValue;
    }
    public BigDecimal getFinWorkerPriceGen(){
       return finWorkerPriceGen;
    }

    public void setFinWorkerCategor(int aValue){
       finWorkerCategor = aValue;
    }
    public int getFinWorkerCategor(){
       return finWorkerCategor;
    }

    public void setFinWorkerFinCode(int aValue){
       finWorkerFinCode = aValue;
    }
    public int getFinWorkerFinCode(){
       return finWorkerFinCode;
    }

    public void setFinWorkerIsSentAssignment(int aValue){
       finWorkerIsSentAssignment = aValue;
    }
    public int getFinWorkerIsSentAssignment(){
       return finWorkerIsSentAssignment;
    }

    public void setFinWorkerChargePercent(BigDecimal aValue){
       finWorkerChargePercent = aValue;
    }
    public BigDecimal getFinWorkerChargePercent(){
       return finWorkerChargePercent;
    }

    public void setFinWorkerCategorId(int aValue){
       finWorkerCategorId = aValue;
    }
    public int getFinWorkerCategorId(){
       return finWorkerCategorId;
    }

    public void setFinWorkerCategorName(String aValue){
       finWorkerCategorName = aValue;
    }
    public String getFinWorkerCategorName(){
       return finWorkerCategorName;
    }

    public void setFinWorkerWorkTimeId(String aValue){
       finWorkerWorkTimeId = aValue;
    }
    public String getFinWorkerWorkTimeId(){
       return finWorkerWorkTimeId;
    }

    public void setFinWorkerPositionId(String aValue){
       finWorkerPositionId = aValue;
    }
    public String getFinWorkerPositionId(){
       return finWorkerPositionId;
    }

    public void setTypeRefCode(int aValue){
       typeRefCode = aValue;
    }
    public int getTypeRefCode(){
       return typeRefCode;
    }

    public void setTypeRefName(String aValue){
       typeRefName = aValue;
    }
    public String getTypeRefName(){
       return typeRefName;
    }

    public void setStatusRefCode(int aValue){
       statusRefCode = aValue;
    }
    public int getStatusRefCode(){
       return statusRefCode;
    }

    public void setStatusRefName(String aValue){
       statusRefName = aValue;
    }
    public String getStatusRefName(){
       return statusRefName;
    }



}