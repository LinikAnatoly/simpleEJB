
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for RecordPointWF;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class RecordPointWF implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  accountnumber; 
    public String  contractnumber; 
    public String  contragentname; 
    public String  contragentaddress; 
    public String  contragentpassport; 
    public String  contragentokpo; 
    public int  cnpackcode = Integer.MIN_VALUE; 
    public int  cnsubsystemtyperefcode = Integer.MIN_VALUE; 
    public int  rencode = Integer.MIN_VALUE; 
    public int  isbyt = Integer.MIN_VALUE; 
    public int  phasityrefcode = Integer.MIN_VALUE; 
    public Date contractdate ;
    public int  techcondservicesrefcod = Integer.MIN_VALUE; 
    public int  iscounterinst = Integer.MIN_VALUE; 
    public int  rpcode = Integer.MIN_VALUE; 
    public String  rpname; 
    public static final String tableName = "RECORDPOINTWF";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "RECORDPOINTWF.CODE";
    public static final String accountnumber_Attr = "accountnumber";
    public static final String accountnumber_Field = "ACCOUNTNUMBER";
    public static final String accountnumber_QFielld = "RECORDPOINTWF.ACCOUNTNUMBER";
    public static final String contractnumber_Attr = "contractnumber";
    public static final String contractnumber_Field = "CONTRACTNUMBER";
    public static final String contractnumber_QFielld = "RECORDPOINTWF.CONTRACTNUMBER";
    public static final String contragentname_Attr = "contragentname";
    public static final String contragentname_Field = "CONTRAGENTNAME";
    public static final String contragentname_QFielld = "RECORDPOINTWF.CONTRAGENTNAME";
    public static final String contragentaddress_Attr = "contragentaddress";
    public static final String contragentaddress_Field = "CONTRAGENTADDRESS";
    public static final String contragentaddress_QFielld = "RECORDPOINTWF.CONTRAGENTADDRESS";
    public static final String contragentpassport_Attr = "contragentpassport";
    public static final String contragentpassport_Field = "CONTRAGENTPASSPORT";
    public static final String contragentpassport_QFielld = "RECORDPOINTWF.CONTRAGENTPASSPORT";
    public static final String contragentokpo_Attr = "contragentokpo";
    public static final String contragentokpo_Field = "CONTRAGENTOKPO";
    public static final String contragentokpo_QFielld = "RECORDPOINTWF.CONTRAGENTOKPO";
    public static final String cnpackcode_Attr = "cnpackcode";
    public static final String cnpackcode_Field = "CNPACKCODE";
    public static final String cnpackcode_QFielld = "RECORDPOINTWF.CNPACKCODE";
    public static final String cnsubsystemtyperefcode_Attr = "cnsubsystemtyperefcode";
    public static final String cnsubsystemtyperefcode_Field = "CNSUBSYSTEMTYPEREFCODE";
    public static final String cnsubsystemtyperefcode_QFielld = "RECORDPOINTWF.CNSUBSYSTEMTYPEREFCODE";
    public static final String rencode_Attr = "rencode";
    public static final String rencode_Field = "RENCODE";
    public static final String rencode_QFielld = "RECORDPOINTWF.RENCODE";
    public static final String isbyt_Attr = "isbyt";
    public static final String isbyt_Field = "ISBYT";
    public static final String isbyt_QFielld = "RECORDPOINTWF.ISBYT";
    public static final String phasityrefcode_Attr = "phasityrefcode";
    public static final String phasityrefcode_Field = "PHASITYREFCODE";
    public static final String phasityrefcode_QFielld = "RECORDPOINTWF.PHASITYREFCODE";
    public static final String contractdate_Attr = "contractdate";
    public static final String contractdate_Field = "CONTRACTDATE";
    public static final String contractdate_QFielld = "RECORDPOINTWF.CONTRACTDATE";
    public static final String techcondservicesrefcod_Attr = "techcondservicesrefcod";
    public static final String techcondservicesrefcod_Field = "TECHCONDSERVICESREFCOD";
    public static final String techcondservicesrefcod_QFielld = "RECORDPOINTWF.TECHCONDSERVICESREFCOD";
    public static final String iscounterinst_Attr = "iscounterinst";
    public static final String iscounterinst_Field = "ISCOUNTERINST";
    public static final String iscounterinst_QFielld = "RECORDPOINTWF.ISCOUNTERINST";
    public static final String rpcode_Attr = "rpcode";
    public static final String rpcode_Field = "RPCODE";
    public static final String rpcode_QFielld = "RECORDPOINTWF.RPCODE";
    public static final String rpname_Attr = "rpname";
    public static final String rpname_Field = "RPNAME";
    public static final String rpname_QFielld = "RECORDPOINTWF.RPNAME";


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


    public void setContractdate(Date aValue){
       contractdate = aValue;
    }

    public Date getContractdate(){
       return contractdate;
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


} // end of RecordPointWFValueObject

