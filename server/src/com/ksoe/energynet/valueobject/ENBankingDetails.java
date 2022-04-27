
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBankingDetails;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.ENBankingBillTypeRef;

public class ENBankingDetails implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public String  bankname; 
    public String  bankokpo; 
    public int  bankmfo = Integer.MIN_VALUE;
    public String  bankaccount; 
    public String  partnercode; 
    public String  contract; 
    public int  useDefault = Integer.MIN_VALUE;
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public ENBankingBillTypeRef billTypeRef = new ENBankingBillTypeRef();
    public static final String tableName = "ENBANKINGDETAILS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBANKINGDETAILS.CODE";
    public static final String bankname_Attr = "bankname";
    public static final String bankname_Field = "BANKNAME";
    public static final String bankname_QFielld = "ENBANKINGDETAILS.BANKNAME";
    public static final String bankokpo_Attr = "bankokpo";
    public static final String bankokpo_Field = "BANKOKPO";
    public static final String bankokpo_QFielld = "ENBANKINGDETAILS.BANKOKPO";
    public static final String bankmfo_Attr = "bankmfo";
    public static final String bankmfo_Field = "BANKMFO";
    public static final String bankmfo_QFielld = "ENBANKINGDETAILS.BANKMFO";
    public static final String bankaccount_Attr = "bankaccount";
    public static final String bankaccount_Field = "BANKACCOUNT";
    public static final String bankaccount_QFielld = "ENBANKINGDETAILS.BANKACCOUNT";
    public static final String partnercode_Attr = "partnercode";
    public static final String partnercode_Field = "PARTNERCODE";
    public static final String partnercode_QFielld = "ENBANKINGDETAILS.PARTNERCODE";
    public static final String contract_Attr = "contract";
    public static final String contract_Field = "CONTRACT";
    public static final String contract_QFielld = "ENBANKINGDETAILS.CONTRACT";
    public static final String useDefault_Attr = "useDefault";
    public static final String useDefault_Field = "USEDEFAULT";
    public static final String useDefault_QFielld = "ENBANKINGDETAILS.USEDEFAULT";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENBANKINGDETAILS.DEPARTMENTREFCODE";
    public static final String billTypeRef_Attr = "billTypeRef";
    public static final String billTypeRef_Field = "BILLTYPEREFCODE";
    public static final String  billTypeRef_QFielld = "ENBANKINGDETAILS.BILLTYPEREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setBankname(String aValue){
       bankname = aValue;
    }

    public String getBankname(){
       return bankname;
    }


    public void setBankokpo(String aValue){
       bankokpo = aValue;
    }

    public String getBankokpo(){
       return bankokpo;
    }


    public void setBankmfo(int aValue){
       bankmfo = aValue;
    }

    public int getBankmfo(){
       return bankmfo;
    }


    public void setBankaccount(String aValue){
       bankaccount = aValue;
    }

    public String getBankaccount(){
       return bankaccount;
    }


    public void setPartnercode(String aValue){
       partnercode = aValue;
    }

    public String getPartnercode(){
       return partnercode;
    }


    public void setContract(String aValue){
       contract = aValue;
    }

    public String getContract(){
       return contract;
    }


    public void setUseDefault(int aValue){
       useDefault = aValue;
    }

    public int getUseDefault(){
       return useDefault;
    }

    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }
    public void setBillTypeRef(ENBankingBillTypeRef aValue){
       billTypeRef = aValue;
    }

    public ENBankingBillTypeRef getBillTypeRef(){
       return billTypeRef;
    }

} // end of ENBankingDetailsValueObject

