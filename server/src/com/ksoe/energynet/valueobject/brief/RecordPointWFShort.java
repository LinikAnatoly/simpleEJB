
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for RecordPointWF;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class RecordPointWFShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String accountnumber;
    public String contractnumber;
    public String contragentname;
    public String contragentaddress;
    public String contragentpassport;
    public String contragentokpo;
    public int cnpackcode = Integer.MIN_VALUE;
    public int cnsubsystemtyperefcode = Integer.MIN_VALUE;
    public int rencode = Integer.MIN_VALUE;
    public int isbyt = Integer.MIN_VALUE;
    public int phasityrefcode = Integer.MIN_VALUE;
    public int techcondservicesrefcod = Integer.MIN_VALUE;
    public int iscounterinst = Integer.MIN_VALUE;
    public int rpcode = Integer.MIN_VALUE;
    public String rpname;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setAccountnumber(String aValue){
       accountnumber = aValue;
    }

    public String getAccountnumber(){
       return accountnumber;
    }
    public void setContractnumber(String aValue){
       contractnumber = aValue;
    }

    public String getContractnumber(){
       return contractnumber;
    }
    public void setContragentname(String aValue){
       contragentname = aValue;
    }

    public String getContragentname(){
       return contragentname;
    }
    public void setContragentaddress(String aValue){
       contragentaddress = aValue;
    }

    public String getContragentaddress(){
       return contragentaddress;
    }
    public void setContragentpassport(String aValue){
       contragentpassport = aValue;
    }

    public String getContragentpassport(){
       return contragentpassport;
    }
    public void setContragentokpo(String aValue){
       contragentokpo = aValue;
    }

    public String getContragentokpo(){
       return contragentokpo;
    }
    public void setCnpackcode(int aValue){
       cnpackcode = aValue;
    }

    public int getCnpackcode(){
       return cnpackcode;
    }
    public void setCnsubsystemtyperefcode(int aValue){
       cnsubsystemtyperefcode = aValue;
    }

    public int getCnsubsystemtyperefcode(){
       return cnsubsystemtyperefcode;
    }
    public void setRencode(int aValue){
       rencode = aValue;
    }

    public int getRencode(){
       return rencode;
    }
    public void setIsbyt(int aValue){
       isbyt = aValue;
    }

    public int getIsbyt(){
       return isbyt;
    }
    public void setPhasityrefcode(int aValue){
       phasityrefcode = aValue;
    }

    public int getPhasityrefcode(){
       return phasityrefcode;
    }
    public void setTechcondservicesrefcod(int aValue){
       techcondservicesrefcod = aValue;
    }

    public int getTechcondservicesrefcod(){
       return techcondservicesrefcod;
    }
    public void setIscounterinst(int aValue){
       iscounterinst = aValue;
    }

    public int getIscounterinst(){
       return iscounterinst;
    }
    public void setRpcode(int aValue){
       rpcode = aValue;
    }

    public int getRpcode(){
       return rpcode;
    }
    public void setRpname(String aValue){
       rpname = aValue;
    }

    public String getRpname(){
       return rpname;
    }




}