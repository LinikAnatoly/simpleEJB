
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


public class workerListFromKadryShort implements Serializable {

    public int tabn = Integer.MIN_VALUE;
    public String podr_nazv;
    public int podr_id = Integer.MIN_VALUE;
    public String fio;
    public String post_fin;
    public int norma_vrem_days = Integer.MIN_VALUE;
    public BigDecimal norma_vrem_hours;
    public BigDecimal norma_vrem_hours_without_hours;
    public BigDecimal sumhoursotpusk;
    public int main_podr_id = Integer.MIN_VALUE;
    public String podr_nazv_main;
    public String shortname;

    public String getShortname() {
		return shortname;
	}

	public void setShortname(String shortname) {
		this.shortname = shortname;
	}

	public void setTabn(int aValue){
       tabn = aValue;
    }

    public int getTabn(){
       return tabn;
    }
    public void setPodr_nazv(String aValue){
       podr_nazv = aValue;
    }

    public String getPodr_nazv(){
       return podr_nazv;
    }
    public void setPodr_id(int aValue){
       podr_id = aValue;
    }

    public int getPodr_id(){
       return podr_id;
    }
    public void setFio(String aValue){
       fio = aValue;
    }

    public String getFio(){
       return fio;
    }
    public void setPost_fin(String aValue){
       post_fin = aValue;
    }

    public String getPost_fin(){
       return post_fin;
    }
    public void setNorma_vrem_days(int aValue){
       norma_vrem_days = aValue;
    }

    public int getNorma_vrem_days(){
       return norma_vrem_days;
    }
    public void setNorma_vrem_hours(BigDecimal aValue){
       norma_vrem_hours = aValue;
    }

    public BigDecimal getNorma_vrem_hours(){
       return norma_vrem_hours;
    }
    public void setNorma_vrem_hours_without_hours(BigDecimal aValue){
       norma_vrem_hours_without_hours = aValue;
    }

    public BigDecimal getNorma_vrem_hours_without_hours(){
       return norma_vrem_hours_without_hours;
    }
    public void setSumhoursotpusk(BigDecimal aValue){
       sumhoursotpusk = aValue;
    }

    public BigDecimal getSumhoursotpusk(){
       return sumhoursotpusk;
    }
    public void setMain_podr_id(int aValue){
       main_podr_id = aValue;
    }

    public int getMain_podr_id(){
       return main_podr_id;
    }
    public void setPodr_nazv_main(String aValue){
       podr_nazv_main = aValue;
    }

    public String getPodr_nazv_main(){
       return podr_nazv_main;
    }




}