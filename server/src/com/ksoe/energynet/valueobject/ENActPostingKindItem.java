
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActPostingKindItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.ENActPostingKind;
    import  com.ksoe.energynet.valueobject.ENActPostingTypeSum;
    import  com.ksoe.energynet.valueobject.ENActPostingForm;

public class ENActPostingKindItem implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  cehKt; 
    public String  accountKt; 
    public String  kauKt; 
    public String  cehDt; 
    public String  accountDt; 
    public String  kauDt; 
    public BigDecimal  summaGen; 
    public String  plusMinus; 
    public String  description; 

    public ENActPostingKind ENActPostingKind = new ENActPostingKind();
    public ENActPostingTypeSum ENActPostingTypeSum = new ENActPostingTypeSum();
    public ENActPostingForm ENActPostingForm = new ENActPostingForm();

    public static final String tableName = "ENACTPOSTINGKINDITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTPOSTINGKINDITEM.CODE";
    public static final String cehKt_Attr = "cehKt";
    public static final String cehKt_Field = "CEHKT";
    public static final String cehKt_QFielld = "ENACTPOSTINGKINDITEM.CEHKT";
    public static final String accountKt_Attr = "accountKt";
    public static final String accountKt_Field = "ACCOUNTKT";
    public static final String accountKt_QFielld = "ENACTPOSTINGKINDITEM.ACCOUNTKT";
    public static final String kauKt_Attr = "kauKt";
    public static final String kauKt_Field = "KAUKT";
    public static final String kauKt_QFielld = "ENACTPOSTINGKINDITEM.KAUKT";
    public static final String cehDt_Attr = "cehDt";
    public static final String cehDt_Field = "CEHDT";
    public static final String cehDt_QFielld = "ENACTPOSTINGKINDITEM.CEHDT";
    public static final String accountDt_Attr = "accountDt";
    public static final String accountDt_Field = "ACCOUNTDT";
    public static final String accountDt_QFielld = "ENACTPOSTINGKINDITEM.ACCOUNTDT";
    public static final String kauDt_Attr = "kauDt";
    public static final String kauDt_Field = "KAUDT";
    public static final String kauDt_QFielld = "ENACTPOSTINGKINDITEM.KAUDT";
    public static final String summaGen_Attr = "summaGen";
    public static final String summaGen_Field = "SUMMAGEN";
    public static final String summaGen_QFielld = "ENACTPOSTINGKINDITEM.SUMMAGEN";
    public static final String plusMinus_Attr = "plusMinus";
    public static final String plusMinus_Field = "PLUSMINUS";
    public static final String plusMinus_QFielld = "ENACTPOSTINGKINDITEM.PLUSMINUS";
    public static final String description_Attr = "description";
    public static final String description_Field = "DESCRIPTION";
    public static final String description_QFielld = "ENACTPOSTINGKINDITEM.DESCRIPTION";

    public static final String ENActPostingKind_Attr = "ENActPostingKind";
    public static final String ENActPostingKind_Field = "ENACTPOSTINGKINDCODE";
    public static final String  ENActPostingKind_QFielld = "ENACTPOSTINGKINDITEM.ENACTPOSTINGKINDCODE";
    public static final String ENActPostingTypeSum_Attr = "ENActPostingTypeSum";
    public static final String ENActPostingTypeSum_Field = "ENACTPOSTINGTYPESUMCOD";
    public static final String  ENActPostingTypeSum_QFielld = "ENACTPOSTINGKINDITEM.ENACTPOSTINGTYPESUMCOD";
    public static final String ENActPostingForm_Attr = "ENActPostingForm";
    public static final String ENActPostingForm_Field = "ENACTPOSTINGFORMCODE";
    public static final String  ENActPostingForm_QFielld = "ENACTPOSTINGKINDITEM.ENACTPOSTINGFORMCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getCehKt(){
       return cehKt;
    }
    
    public void setCehKt(String cehKt){
       this.cehKt = cehKt;
    }


    public String getAccountKt(){
       return accountKt;
    }
    
    public void setAccountKt(String accountKt){
       this.accountKt = accountKt;
    }


    public String getKauKt(){
       return kauKt;
    }
    
    public void setKauKt(String kauKt){
       this.kauKt = kauKt;
    }


    public String getCehDt(){
       return cehDt;
    }
    
    public void setCehDt(String cehDt){
       this.cehDt = cehDt;
    }


    public String getAccountDt(){
       return accountDt;
    }
    
    public void setAccountDt(String accountDt){
       this.accountDt = accountDt;
    }


    public String getKauDt(){
       return kauDt;
    }
    
    public void setKauDt(String kauDt){
       this.kauDt = kauDt;
    }


    public BigDecimal getSummaGen(){
       return summaGen;
    }
    
    public void setSummaGen(BigDecimal summaGen){
       this.summaGen = summaGen;
    }


    public String getPlusMinus(){
       return plusMinus;
    }
    
    public void setPlusMinus(String plusMinus){
       this.plusMinus = plusMinus;
    }


    public String getDescription(){
       return description;
    }
    
    public void setDescription(String description){
       this.description = description;
    }

    public ENActPostingKind getENActPostingKind(){
       return ENActPostingKind;
    }
    
    public void setENActPostingKind(ENActPostingKind ENActPostingKind){
       this.ENActPostingKind = ENActPostingKind;
    }
    public ENActPostingTypeSum getENActPostingTypeSum(){
       return ENActPostingTypeSum;
    }
    
    public void setENActPostingTypeSum(ENActPostingTypeSum ENActPostingTypeSum){
       this.ENActPostingTypeSum = ENActPostingTypeSum;
    }
    public ENActPostingForm getENActPostingForm(){
       return ENActPostingForm;
    }
    
    public void setENActPostingForm(ENActPostingForm ENActPostingForm){
       this.ENActPostingForm = ENActPostingForm;
    }

} // end of ENActPostingKindItemValueObject

