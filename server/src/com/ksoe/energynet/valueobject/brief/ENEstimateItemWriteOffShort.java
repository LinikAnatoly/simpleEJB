
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENEstimateItem;
  */

import java.io.Serializable;
import java.math.BigDecimal;


public class ENEstimateItemWriteOffShort implements Serializable {

    public int estimateitemrefcode = Integer.MIN_VALUE;
    public String enmatname;
    public int enmeasurementcode = Integer.MIN_VALUE;
    public String enmeasurementname;
    public String fmmatname;
    public String fmmeasurementname;
    public int fmmeasurementcode = Integer.MIN_VALUE;
    public String nn;
    public String div_code;
    public String div_name;
    public int party_id = Integer.MIN_VALUE;
    public String bal_sch;
    public String tabnumber;
    public String fio;
    public String profesion;
    public String depname;
    public int sizcode = Integer.MIN_VALUE;
    public String dateloadexpl;
    public BigDecimal countgen;
    public int checkplan = Integer.MIN_VALUE;
    public String countmonth_txt;
    public BigDecimal countgenForView;
    
	public String getBal_sch() {
		return bal_sch;
	}
	public void setBal_sch(String bal_sch) {
		this.bal_sch = bal_sch;
	}
	public BigDecimal getCountgen() {
		return countgen;
	}
	public void setCountgen(BigDecimal countgen) {
		this.countgen = countgen;
	}
	public String getDateloadexpl() {
		return dateloadexpl;
	}
	public void setDateloadexpl(String dateloadexpl) {
		this.dateloadexpl = dateloadexpl;
	}
	public String getDepname() {
		return depname;
	}
	public void setDepname(String depname) {
		this.depname = depname;
	}
	public String getDiv_code() {
		return div_code;
	}
	public void setDiv_code(String div_code) {
		this.div_code = div_code;
	}
	public String getDiv_name() {
		return div_name;
	}
	public void setDiv_name(String div_name) {
		this.div_name = div_name;
	}
	public String getEnmatname() {
		return enmatname;
	}
	public void setEnmatname(String enmatname) {
		this.enmatname = enmatname;
	}
	public int getEnmeasurementcode() {
		return enmeasurementcode;
	}
	public void setEnmeasurementcode(int enmeasurementcode) {
		this.enmeasurementcode = enmeasurementcode;
	}
	public String getEnmeasurementname() {
		return enmeasurementname;
	}
	public void setEnmeasurementname(String enmeasurementname) {
		this.enmeasurementname = enmeasurementname;
	}
	public int getEstimateitemrefcode() {
		return estimateitemrefcode;
	}
	public void setEstimateitemrefcode(int estimateitemrefcode) {
		this.estimateitemrefcode = estimateitemrefcode;
	}
	public String getFio() {
		return fio;
	}
	public void setFio(String fio) {
		this.fio = fio;
	}
	public String getFmmatname() {
		return fmmatname;
	}
	public void setFmmatname(String fmmatname) {
		this.fmmatname = fmmatname;
	}
	public int getFmmeasurementcode() {
		return fmmeasurementcode;
	}
	public void setFmmeasurementcode(int fmmeasurementcode) {
		this.fmmeasurementcode = fmmeasurementcode;
	}
	public String getFmmeasurementname() {
		return fmmeasurementname;
	}
	public void setFmmeasurementname(String fmmeasurementname) {
		this.fmmeasurementname = fmmeasurementname;
	}
	public String getNn() {
		return nn;
	}
	public void setNn(String nn) {
		this.nn = nn;
	}
	public int getParty_id() {
		return party_id;
	}
	public void setParty_id(int party_id) {
		this.party_id = party_id;
	}
	public String getProfesion() {
		return profesion;
	}
	public void setProfesion(String profesion) {
		this.profesion = profesion;
	}
	public int getSizcode() {
		return sizcode;
	}
	public void setSizcode(int sizcode) {
		this.sizcode = sizcode;
	}
	public String getTabnumber() {
		return tabnumber;
	}
	public void setTabnumber(String tabnumber) {
		this.tabnumber = tabnumber;
	}
	public int getCheckplan() {
		return checkplan;
	}
	public void setCheckplan(int checkplan) {
		this.checkplan = checkplan;
	}
	public String getCountmonth_txt() {
		return countmonth_txt;
	}
	public void setCountmonth_txt(String countmonth_txt) {
		this.countmonth_txt = countmonth_txt;
	}
	public BigDecimal getCountgenForView() {
		return countgenForView;
	}
	public void setCountgenForView(BigDecimal countgenForView) {
		this.countgenForView = countgenForView;
	}
	
	
    
	 
   

    

}