
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENReportAdditionZbytMetrology;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENReportAdditionZbytMetrologyShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String workCode;
    public String name;
    public int isServices = Integer.MIN_VALUE;
    public String zbytOrmetrology;
    public Date dateStart ;
    public Date dateFinal ;


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setWorkCode(String aValue){
       workCode = aValue;
    }

    public String getWorkCode(){
       return workCode;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setIsServices(int aValue){
       isServices = aValue;
    }

    public int getIsServices(){
       return isServices;
    }

    public void setZbytOrmetrology(String aValue){
       zbytOrmetrology = aValue;
    }

    public String getZbytOrmetrology(){
       return zbytOrmetrology;
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




}