
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActPostingKind;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


    	
public class ENActPostingKind implements Serializable {
	
	public static final int SERVICES_CONTRACT_PROJECT = 1; // Послуги на сторону (Договора проектування) 
	public static final int SERVICES_CONTRACT = 2; // Послуги на сторону і договора оренди 
	public static final int SERVICES_CONTRACT_PROJECT_PRICONNECTION = 3; // Роботи на сторону або  Проектування по приєднанню 
	public static final int SERVICES_CONTRACT_INSTALL_COUNTER = 4; // Послуги на сторону(Установка многофункционального счетчика) Вид робіт з послуг = 0E
	public static final int SERVICES_CONTRACT_PARAMETERIZATION = 5; // Роботи на сторону (безоплатні) калькуляція 2.2.04…..(параметризація)
	public static final int SERVICES_CONTRACT_PROGRAMMING = 6; // Роботи на сторону (безоплатні) калькуляція 2.1.07…..(програмування)
	public static final int SERVICES_PRICONNECTION_AFTER_01062021 = 7; // Послуги з  приєднання (починаючи з 01.06.2021)
	//public static final int SERVICES_CONTRACT_LUZOD_ASKOE = 7; // «Договори на виконання робіт» щодо щодобового формування та передачі погодинних даних з ЛУЗОД (АСКОЕ)  (кальк. 020206…)
	public static final int SERVICES_SUPPLIER_CONTRACT = 10; // Послуги по Договори на відшкодування з постачальниками е/е
	

    public int  code = Integer.MIN_VALUE;
    public String  numberGen; 
    public String  name; 
    public Date dateTemplate;
    public String  account_expense; 
    public String  kau_expense; 
    public String  account_closing; 
    public String  kau_closing; 
    public String  typeOperMatetialsAct; 
    public String  typeOperMatetialsOrder; 
    public String  typeOperCountersAct; 


    public static final String tableName = "ENACTPOSTINGKIND";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTPOSTINGKIND.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENACTPOSTINGKIND.NUMBERGEN";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENACTPOSTINGKIND.NAME";
    public static final String dateTemplate_Attr = "dateTemplate";
    public static final String dateTemplate_Field = "DATETEMPLATE";
    public static final String dateTemplate_QFielld = "ENACTPOSTINGKIND.DATETEMPLATE";
    public static final String account_expense_Attr = "account_expense";
    public static final String account_expense_Field = "ACCOUNT_EXPENSE";
    public static final String account_expense_QFielld = "ENACTPOSTINGKIND.ACCOUNT_EXPENSE";
    public static final String kau_expense_Attr = "kau_expense";
    public static final String kau_expense_Field = "KAU_EXPENSE";
    public static final String kau_expense_QFielld = "ENACTPOSTINGKIND.KAU_EXPENSE";
    public static final String account_closing_Attr = "account_closing";
    public static final String account_closing_Field = "ACCOUNT_CLOSING";
    public static final String account_closing_QFielld = "ENACTPOSTINGKIND.ACCOUNT_CLOSING";
    public static final String kau_closing_Attr = "kau_closing";
    public static final String kau_closing_Field = "KAU_CLOSING";
    public static final String kau_closing_QFielld = "ENACTPOSTINGKIND.KAU_CLOSING";
    public static final String typeOperMatetialsAct_Attr = "typeOperMatetialsAct";
    public static final String typeOperMatetialsAct_Field = "TYPEOPERMATETIALSACT";
    public static final String typeOperMatetialsAct_QFielld = "ENACTPOSTINGKIND.TYPEOPERMATETIALSACT";
    public static final String typeOperMatetialsOrder_Attr = "typeOperMatetialsOrder";
    public static final String typeOperMatetialsOrder_Field = "TYPEOPERMATETIALSORDER";
    public static final String typeOperMatetialsOrder_QFielld = "ENACTPOSTINGKIND.TYPEOPERMATETIALSORDER";
    public static final String typeOperCountersAct_Attr = "typeOperCountersAct";
    public static final String typeOperCountersAct_Field = "TYPEOPERCOUNTERSACT";
    public static final String typeOperCountersAct_QFielld = "ENACTPOSTINGKIND.TYPEOPERCOUNTERSACT";




    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getNumberGen(){
       return numberGen;
    }
    
    public void setNumberGen(String numberGen){
       this.numberGen = numberGen;
    }


    public String getName(){
       return name;
    }
    
    public void setName(String name){
       this.name = name;
    }


    public Date getDateTemplate(){
       return dateTemplate;
    }

    public void setDateTemplate(Date dateTemplate){
       this.dateTemplate = dateTemplate;
    }


    public String getAccount_expense(){
       return account_expense;
    }
    
    public void setAccount_expense(String account_expense){
       this.account_expense = account_expense;
    }


    public String getKau_expense(){
       return kau_expense;
    }
    
    public void setKau_expense(String kau_expense){
       this.kau_expense = kau_expense;
    }


    public String getAccount_closing(){
       return account_closing;
    }
    
    public void setAccount_closing(String account_closing){
       this.account_closing = account_closing;
    }


    public String getKau_closing(){
       return kau_closing;
    }
    
    public void setKau_closing(String kau_closing){
       this.kau_closing = kau_closing;
    }


    public String getTypeOperMatetialsAct(){
       return typeOperMatetialsAct;
    }
    
    public void setTypeOperMatetialsAct(String typeOperMatetialsAct){
       this.typeOperMatetialsAct = typeOperMatetialsAct;
    }


    public String getTypeOperMatetialsOrder(){
       return typeOperMatetialsOrder;
    }
    
    public void setTypeOperMatetialsOrder(String typeOperMatetialsOrder){
       this.typeOperMatetialsOrder = typeOperMatetialsOrder;
    }


    public String getTypeOperCountersAct(){
       return typeOperCountersAct;
    }
    
    public void setTypeOperCountersAct(String typeOperCountersAct){
       this.typeOperCountersAct = typeOperCountersAct;
    }


} // end of ENActPostingKindValueObject

