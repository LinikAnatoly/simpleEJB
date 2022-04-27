
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDepartment;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENDepartmentShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String shortName;
    public Date dateStart ;
    public Date dateFinal ;
    public int renCode = Integer.MIN_VALUE;
    public String shpzBalans;
    public int kau_table_id_1884 = Integer.MIN_VALUE;
    public String kau_1884;
    public String name_1884;
    public String hrmorganizationid;
    public int parentRefCode = Integer.MIN_VALUE;
    public String parentRefShortName;
    public Date parentRefDateStart;
    public Date parentRefDateFinal;
    public int parentRefRenCode = Integer.MIN_VALUE;
    public String parentRefShpzBalans;
    public int parentRefKau_table_id_1884 = Integer.MIN_VALUE;
    public String parentRefKau_1884;
    public String parentRefName_1884;
    public String parentRefHrmorganizationid;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;
    public int managementRefCode = Integer.MIN_VALUE;
    public String managementRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setShortName(String aValue){
       shortName = aValue;
    }

    public String getShortName(){
       return shortName;
    }

    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }

    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
    }
    public void setRenCode(int aValue){
       renCode = aValue;
    }

    public int getRenCode(){
       return renCode;
    }
    public void setShpzBalans(String aValue){
       shpzBalans = aValue;
    }

    public String getShpzBalans(){
       return shpzBalans;
    }
    public void setKau_table_id_1884(int aValue){
       kau_table_id_1884 = aValue;
    }

    public int getKau_table_id_1884(){
       return kau_table_id_1884;
    }
    public void setKau_1884(String aValue){
       kau_1884 = aValue;
    }

    public String getKau_1884(){
       return kau_1884;
    }
    public void setName_1884(String aValue){
       name_1884 = aValue;
    }

    public String getName_1884(){
       return name_1884;
    }
    public void setHrmorganizationid(String aValue){
       hrmorganizationid = aValue;
    }

    public String getHrmorganizationid(){
       return hrmorganizationid;
    }


    public void setParentRefCode(int aValue){
       parentRefCode = aValue;
    }
    public int getParentRefCode(){
       return parentRefCode;
    }

    public void setParentRefShortName(String aValue){
       parentRefShortName = aValue;
    }
    public String getParentRefShortName(){
       return parentRefShortName;
    }


    public void setParentRefDateStart(Date aValue){
       parentRefDateStart = aValue;
    }
    public Date getParentRefDateStart(){
       return parentRefDateStart;
    }


    public void setParentRefDateFinal(Date aValue){
       parentRefDateFinal = aValue;
    }
    public Date getParentRefDateFinal(){
       return parentRefDateFinal;
    }

    public void setParentRefRenCode(int aValue){
       parentRefRenCode = aValue;
    }
    public int getParentRefRenCode(){
       return parentRefRenCode;
    }

    public void setParentRefShpzBalans(String aValue){
       parentRefShpzBalans = aValue;
    }
    public String getParentRefShpzBalans(){
       return parentRefShpzBalans;
    }

    public void setParentRefKau_table_id_1884(int aValue){
       parentRefKau_table_id_1884 = aValue;
    }
    public int getParentRefKau_table_id_1884(){
       return parentRefKau_table_id_1884;
    }

    public void setParentRefKau_1884(String aValue){
       parentRefKau_1884 = aValue;
    }
    public String getParentRefKau_1884(){
       return parentRefKau_1884;
    }

    public void setParentRefName_1884(String aValue){
       parentRefName_1884 = aValue;
    }
    public String getParentRefName_1884(){
       return parentRefName_1884;
    }

    public void setParentRefHrmorganizationid(String aValue){
       parentRefHrmorganizationid = aValue;
    }
    public String getParentRefHrmorganizationid(){
       return parentRefHrmorganizationid;
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

    public void setManagementRefCode(int aValue){
       managementRefCode = aValue;
    }
    public int getManagementRefCode(){
       return managementRefCode;
    }

    public void setManagementRefName(String aValue){
       managementRefName = aValue;
    }
    public String getManagementRefName(){
       return managementRefName;
    }



}