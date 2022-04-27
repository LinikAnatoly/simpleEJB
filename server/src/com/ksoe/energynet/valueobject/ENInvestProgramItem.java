
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENInvestProgramItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENInvestProgramRef;
    import  com.ksoe.techcard.valueobject.references.TKMaterialsRef;

public class ENInvestProgramItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  commentGen; 
    public BigDecimal  countGen; 
    public BigDecimal  price; 
    public BigDecimal  sumGen; 
    public BigDecimal  quarter1count; 
    public BigDecimal  quarter1sum; 
    public BigDecimal  quarter2count; 
    public BigDecimal  quarter2sum; 
    public BigDecimal  quarter3count; 
    public BigDecimal  quarter3sum; 
    public BigDecimal  quarter4count; 
    public BigDecimal  quarter4sum; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public ENInvestProgramRef investProgramRef = new ENInvestProgramRef();
    public TKMaterialsRef materialRef = new TKMaterialsRef();
    public static final String tableName = "ENINVESTPROGRAMITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENINVESTPROGRAMITEM.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENINVESTPROGRAMITEM.NAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENINVESTPROGRAMITEM.COMMENTGEN";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENINVESTPROGRAMITEM.COUNTGEN";
    public static final String price_Attr = "price";
    public static final String price_Field = "PRICE";
    public static final String price_QFielld = "ENINVESTPROGRAMITEM.PRICE";
    public static final String sumGen_Attr = "sumGen";
    public static final String sumGen_Field = "SUMGEN";
    public static final String sumGen_QFielld = "ENINVESTPROGRAMITEM.SUMGEN";
    public static final String quarter1count_Attr = "quarter1count";
    public static final String quarter1count_Field = "QUARTER1COUNT";
    public static final String quarter1count_QFielld = "ENINVESTPROGRAMITEM.QUARTER1COUNT";
    public static final String quarter1sum_Attr = "quarter1sum";
    public static final String quarter1sum_Field = "QUARTER1SUM";
    public static final String quarter1sum_QFielld = "ENINVESTPROGRAMITEM.QUARTER1SUM";
    public static final String quarter2count_Attr = "quarter2count";
    public static final String quarter2count_Field = "QUARTER2COUNT";
    public static final String quarter2count_QFielld = "ENINVESTPROGRAMITEM.QUARTER2COUNT";
    public static final String quarter2sum_Attr = "quarter2sum";
    public static final String quarter2sum_Field = "QUARTER2SUM";
    public static final String quarter2sum_QFielld = "ENINVESTPROGRAMITEM.QUARTER2SUM";
    public static final String quarter3count_Attr = "quarter3count";
    public static final String quarter3count_Field = "QUARTER3COUNT";
    public static final String quarter3count_QFielld = "ENINVESTPROGRAMITEM.QUARTER3COUNT";
    public static final String quarter3sum_Attr = "quarter3sum";
    public static final String quarter3sum_Field = "QUARTER3SUM";
    public static final String quarter3sum_QFielld = "ENINVESTPROGRAMITEM.QUARTER3SUM";
    public static final String quarter4count_Attr = "quarter4count";
    public static final String quarter4count_Field = "QUARTER4COUNT";
    public static final String quarter4count_QFielld = "ENINVESTPROGRAMITEM.QUARTER4COUNT";
    public static final String quarter4sum_Attr = "quarter4sum";
    public static final String quarter4sum_Field = "QUARTER4SUM";
    public static final String quarter4sum_QFielld = "ENINVESTPROGRAMITEM.QUARTER4SUM";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENINVESTPROGRAMITEM.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENINVESTPROGRAMITEM.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENINVESTPROGRAMITEM.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENINVESTPROGRAMITEM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENINVESTPROGRAMITEM.DATEEDIT";
    public static final String investProgramRef_Attr = "investProgramRef";
    public static final String investProgramRef_Field = "INVESTPROGRAMREFCODE";
    public static final String  investProgramRef_QFielld = "ENINVESTPROGRAMITEM.INVESTPROGRAMREFCODE";
    public static final String materialRef_Attr = "materialRef";
    public static final String materialRef_Field = "MATERIALREFCODE";
    public static final String  materialRef_QFielld = "ENINVESTPROGRAMITEM.MATERIALREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
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

    public void setSumGen(BigDecimal aValue){
       sumGen = aValue;
    }

    public BigDecimal getSumGen(){
       return sumGen;
    }

    public void setQuarter1count(BigDecimal aValue){
       quarter1count = aValue;
    }

    public BigDecimal getQuarter1count(){
       return quarter1count;
    }

    public void setQuarter1sum(BigDecimal aValue){
       quarter1sum = aValue;
    }

    public BigDecimal getQuarter1sum(){
       return quarter1sum;
    }

    public void setQuarter2count(BigDecimal aValue){
       quarter2count = aValue;
    }

    public BigDecimal getQuarter2count(){
       return quarter2count;
    }

    public void setQuarter2sum(BigDecimal aValue){
       quarter2sum = aValue;
    }

    public BigDecimal getQuarter2sum(){
       return quarter2sum;
    }

    public void setQuarter3count(BigDecimal aValue){
       quarter3count = aValue;
    }

    public BigDecimal getQuarter3count(){
       return quarter3count;
    }

    public void setQuarter3sum(BigDecimal aValue){
       quarter3sum = aValue;
    }

    public BigDecimal getQuarter3sum(){
       return quarter3sum;
    }

    public void setQuarter4count(BigDecimal aValue){
       quarter4count = aValue;
    }

    public BigDecimal getQuarter4count(){
       return quarter4count;
    }

    public void setQuarter4sum(BigDecimal aValue){
       quarter4sum = aValue;
    }

    public BigDecimal getQuarter4sum(){
       return quarter4sum;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
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

    public void setInvestProgramRef(ENInvestProgramRef aValue){
       investProgramRef = aValue;
    }

    public ENInvestProgramRef getInvestProgramRef(){
       return investProgramRef;
    }
    public void setMaterialRef(TKMaterialsRef aValue){
       materialRef = aValue;
    }

    public TKMaterialsRef getMaterialRef(){
       return materialRef;
    }

} // end of ENInvestProgramItemValueObject

