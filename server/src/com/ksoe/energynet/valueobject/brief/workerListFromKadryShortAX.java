
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for workerListFromKadry;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class workerListFromKadryShortAX implements Serializable {
	
	public String tabn ;
    public String podr_nazv;
    public String podr_id;
    public String fio;
    public String post_fin;
    public BigDecimal norma_vrem_hours;
    public BigDecimal fact_workdays;
    public BigDecimal sumhoursotpusk;
    public String main_podr_id;
    public String podr_nazv_main;
    public String shortname;
    public String tradecategoryid;
    public Date datestart;
    public Date datefinal;
    public String positionid;
    public String podrIdConcat; // коды подразделений по сотруднику в которых он был за период - для додатка 3
    public String rate;
    public BigDecimal fact_workhours; // отработанное время факт по табелю
    public BigDecimal fact_workhours_overall; // отработанное время факт по табелю (за все время без длления на оргаиизации)
    
    public BigDecimal getFact_workhours_overall() {
		return fact_workhours_overall;
	}
	public void setFact_workhours_overall(BigDecimal fact_workhours) {
		this.fact_workhours_overall = fact_workhours;
	}
    public BigDecimal getFact_workhours() {
		return fact_workhours;
	}
	public void setFact_workhours(BigDecimal fact_workhours) {
		this.fact_workhours = fact_workhours;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getPodrIdConcat() {
		return podrIdConcat;
	}
	public void setPodrIdConcat(String podrIdConcat) {
		this.podrIdConcat = podrIdConcat;
	}
	public String getPositionid() {
		return positionid;
	}
	public void setPositionid(String positionid) {
		this.positionid = positionid;
	}
	public Date getDatestart() {
		return datestart;
	}
	public void setDatestart(Date datestart) {
		this.datestart = datestart;
	}
	public Date getDatefinal() {
		return datefinal;
	}
	public void setDatefinal(Date datefinal) {
		this.datefinal = datefinal;
	}	

    public String getTradecategoryid() {
		return tradecategoryid;
	}
	public void setTradecategoryid(String tradecategoryid) {
		this.tradecategoryid = tradecategoryid;
	}
	public String getTabn() {
		return tabn;
	}
	public void setTabn(String tabn) {
		this.tabn = tabn;
	}
	public String getPodr_nazv() {
		return podr_nazv;
	}
	public void setPodr_nazv(String podr_nazv) {
		this.podr_nazv = podr_nazv;
	}
	public String getPodr_id() {
		return podr_id;
	}
	public void setPodr_id(String podr_id) {
		this.podr_id = podr_id;
	}
	public String getFio() {
		return fio;
	}
	public void setFio(String fio) {
		this.fio = fio;
	}
	public String getPost_fin() {
		return post_fin;
	}
	public void setPost_fin(String post_fin) {
		this.post_fin = post_fin;
	}
	public BigDecimal getNorma_vrem_hours() {
		return norma_vrem_hours;
	}
	public void setNorma_vrem_hours(BigDecimal norma_vrem_hours) {
		this.norma_vrem_hours = norma_vrem_hours;
	}
	public BigDecimal getSumhoursotpusk() {
		return sumhoursotpusk;
	}
	public void setSumhoursotpusk(BigDecimal sumhoursotpusk) {
		this.sumhoursotpusk = sumhoursotpusk;
	}
	public String getMain_podr_id() {
		return main_podr_id;
	}
	public void setMain_podr_id(String main_podr_id) {
		this.main_podr_id = main_podr_id;
	}
	public String getPodr_nazv_main() {
		return podr_nazv_main;
	}
	public void setPodr_nazv_main(String podr_nazv_main) {
		this.podr_nazv_main = podr_nazv_main;
	}
	public String getShortname() {
		return shortname;
	}
	public void setShortname(String shortname) {
		this.shortname = shortname;
	}
	
	public BigDecimal getFact_workdays() {
		return fact_workdays;
	}
	public void setFact_workdays(BigDecimal fact_workdays) {
		this.fact_workdays = fact_workdays;
	}
   



}