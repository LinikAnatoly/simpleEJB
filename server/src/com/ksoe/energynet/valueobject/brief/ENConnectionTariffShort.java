
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENConnectionTariff;
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENConnectionTariffShort implements Serializable {

	private static final long serialVersionUID = 1L;
    public int code = Integer.MIN_VALUE;
    public String name;
    public String shortname;
    public String userGen;
    public int levelRefCode = Integer.MIN_VALUE;
    public String levelRefName;
    public int categoryRefCode = Integer.MIN_VALUE;
    public String categoryRefName;
    public int powerPointRefCode = Integer.MIN_VALUE;
    public String powerPointRefName;
    public int phasityRefCode = Integer.MIN_VALUE;
    public String phasityRefName;
    public int lineTypeRefCode = Integer.MIN_VALUE;
    public String lineTypeRefName;
    public int installationTypeRefCode = Integer.MIN_VALUE;
    public String installationTypeRefName;
    public int locationTypeRefCode = Integer.MIN_VALUE;
    public String locationTypeRefName;
    public int tarifTypeRefCode = Integer.MIN_VALUE;
    public String tarifTypeRefName;
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
    public int tariffEntryCode = Integer.MIN_VALUE;
    public BigDecimal value;
    public Date startDate;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }
    public void setShortname(String aValue){
       shortname = aValue;
    }

    public String getShortname(){
       return shortname;
    }
    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setLevelRefCode(int aValue){
       levelRefCode = aValue;
    }
    public int getLevelRefCode(){
       return levelRefCode;
    }

    public void setLevelRefName(String aValue){
       levelRefName = aValue;
    }
    public String getLevelRefName(){
       return levelRefName;
    }

    public void setCategoryRefCode(int aValue){
       categoryRefCode = aValue;
    }
    public int getCategoryRefCode(){
       return categoryRefCode;
    }

    public void setCategoryRefName(String aValue){
       categoryRefName = aValue;
    }
    public String getCategoryRefName(){
       return categoryRefName;
    }

    public void setPowerPointRefCode(int aValue){
       powerPointRefCode = aValue;
    }
    public int getPowerPointRefCode(){
       return powerPointRefCode;
    }

    public void setPowerPointRefName(String aValue){
       powerPointRefName = aValue;
    }
    public String getPowerPointRefName(){
       return powerPointRefName;
    }

    public void setPhasityRefCode(int aValue){
       phasityRefCode = aValue;
    }
    public int getPhasityRefCode(){
       return phasityRefCode;
    }

    public void setPhasityRefName(String aValue){
       phasityRefName = aValue;
    }
    public String getPhasityRefName(){
       return phasityRefName;
    }

public void setLineTypeRefCode(int aValue){
		lineTypeRefCode = aValue;
	}
	public int getLineTypeRefCode(){
		return lineTypeRefCode;
	}

	public void setLineTypeRefName(String aValue){
		lineTypeRefName = aValue;
	}
	public String getLineTypeRefName(){
		return lineTypeRefName;
	}

	public void setInstallationTypeRefCode(int aValue){
		installationTypeRefCode = aValue;
	}
	public int getInstallationTypeRefCode(){
		return installationTypeRefCode;
	}

	public void setInstallationTypeRefName(String aValue){
		installationTypeRefName = aValue;
	}
	public String getInstallationTypeRefName(){
		return installationTypeRefName;
	}

	public void setLocationTypeRefCode(int aValue){
		locationTypeRefCode = aValue;
	}
	public int getLocationTypeRefCode(){
		return locationTypeRefCode;
	}

	public void setLocationTypeRefName(String aValue){
		locationTypeRefName = aValue;
	}
	public String getLocationTypeRefName(){
		return locationTypeRefName;
	}

	public void setTarifTypeRefCode(int aValue){
		tarifTypeRefCode = aValue;
	}
	public int getTarifTypeRefCode(){
		return tarifTypeRefCode;
	}

	public void setTarifTypeRefName(String aValue){
		tarifTypeRefName = aValue;
	}
	public String getTarifTypeRefName(){
		return tarifTypeRefName;
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


	public final int getTariffEntryCode() {
		return tariffEntryCode;
	}

	public final void setTariffEntryCode(int tariffEntryCode) {
		this.tariffEntryCode = tariffEntryCode;
	}

	public final BigDecimal getValue() {
		return value;
	}

	public final void setValue(BigDecimal value) {
		this.value = value;
	}

	public final Date getStartDate() {
		return startDate;
	}

	public final void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


}