
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENContractItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.TKMaterials;
    import  com.ksoe.energynet.valueobject.ENContract;

public class ENContractItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  countGen; 
    public BigDecimal  price; 
    public BigDecimal  cost; 
    public String  commentGen; 
    public BigDecimal  countReal; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public TKMaterials material = new TKMaterials();
    public ENContract contract = new ENContract();
    public static final String tableName = "ENCONTRACTITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCONTRACTITEM.CODE";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENCONTRACTITEM.COUNTGEN";
    public static final String price_Attr = "price";
    public static final String price_Field = "PRICE";
    public static final String price_QFielld = "ENCONTRACTITEM.PRICE";
    public static final String cost_Attr = "cost";
    public static final String cost_Field = "COST";
    public static final String cost_QFielld = "ENCONTRACTITEM.COST";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENCONTRACTITEM.COMMENTGEN";
    public static final String countReal_Attr = "countReal";
    public static final String countReal_Field = "COUNTREAL";
    public static final String countReal_QFielld = "ENCONTRACTITEM.COUNTREAL";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENCONTRACTITEM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENCONTRACTITEM.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCONTRACTITEM.MODIFY_TIME";
    public static final String material_Attr = "material";
    public static final String material_Field = "MATERIALCODE";
    public static final String  material_QFielld = "ENCONTRACTITEM.MATERIALCODE";
    public static final String contract_Attr = "contract";
    public static final String contract_Field = "CONTRACTCODE";
    public static final String  contract_QFielld = "ENCONTRACTITEM.CONTRACTCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }

    public void setPrice(BigDecimal aValue){
       price = aValue;
    }

    public BigDecimal getPrice(){
       return price;
    }

    public void setCost(BigDecimal aValue){
       cost = aValue;
    }

    public BigDecimal getCost(){
       return cost;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setCountReal(BigDecimal aValue){
       countReal = aValue;
    }

    public BigDecimal getCountReal(){
       return countReal;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setMaterial(TKMaterials aValue){
       material = aValue;
    }

    public TKMaterials getMaterial(){
       return material;
    }
    public void setContract(ENContract aValue){
       contract = aValue;
    }

    public ENContract getContract(){
       return contract;
    }

} // end of ENContractItemValueObject

