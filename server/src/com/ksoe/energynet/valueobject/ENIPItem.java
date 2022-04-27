
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENIPItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.TKMeasurement;
    import  com.ksoe.energynet.valueobject.references.ENIPItemStatusRef;
    import  com.ksoe.energynet.valueobject.references.ENInvestProgramGroupsRef;
    import  com.ksoe.energypro.valueobject.references.EPRenRef;
    import  com.ksoe.energynet.valueobject.references.ENIPPurposeProgramRef;
    import  com.ksoe.energynet.valueobject.references.ENIPRef;
    import  com.ksoe.energynet.valueobject.references.ENIPItemRef;
    import  com.ksoe.energynet.valueobject.references.ENMethodExecuteWorkRef;
    import  com.ksoe.energynet.valueobject.references.ENIPImplementationTypeRef;

public class ENIPItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  buhName; 
    public String  itemNumber; 
    public String  invNumber; 
    public int  isProjectDocument = Integer.MIN_VALUE; 
    public String  financing; 
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
    public BigDecimal  countGenInside; 
    public BigDecimal  priceInside; 
    public BigDecimal  sumGenInside; 
    public BigDecimal  mm1countInside; 
    public BigDecimal  mm1sumInside; 
    public BigDecimal  mm2countInside; 
    public BigDecimal  mm2sumInside; 
    public BigDecimal  mm3countInside; 
    public BigDecimal  mm3sumInside; 
    public BigDecimal  mm4countInside; 
    public BigDecimal  mm4sumInside; 
    public BigDecimal  mm5countInside; 
    public BigDecimal  mm5sumInside; 
    public BigDecimal  mm6countInside; 
    public BigDecimal  mm6sumInside; 
    public BigDecimal  mm7countInside; 
    public BigDecimal  mm7sumInside; 
    public BigDecimal  mm8countInside; 
    public BigDecimal  mm8sumInside; 
    public BigDecimal  mm9countInside; 
    public BigDecimal  mm9sumInside; 
    public BigDecimal  mm10countInside; 
    public BigDecimal  mm10sumInside; 
    public BigDecimal  mm11countInside; 
    public BigDecimal  mm11sumInside; 
    public BigDecimal  mm12countInside; 
    public BigDecimal  mm12sumInside; 
    public String  infoTenders; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public TKMeasurement measurement = new TKMeasurement();
    public ENIPItemStatusRef statusRef = new ENIPItemStatusRef();
    public ENInvestProgramGroupsRef invGroupRef = new ENInvestProgramGroupsRef();
    public EPRenRef renRef = new EPRenRef();
    public ENIPPurposeProgramRef purposeProgramRef = new ENIPPurposeProgramRef();
    public ENIPRef ipRef = new ENIPRef();
    public ENIPItemRef parentRef = new ENIPItemRef();
    public ENMethodExecuteWorkRef methodExecWorkRef = new ENMethodExecuteWorkRef();
    public ENIPImplementationTypeRef ipImplementTypeRef = new ENIPImplementationTypeRef();
    public static final String tableName = "ENIPITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENIPITEM.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENIPITEM.NAME";
    public static final String buhName_Attr = "buhName";
    public static final String buhName_Field = "BUHNAME";
    public static final String buhName_QFielld = "ENIPITEM.BUHNAME";
    public static final String itemNumber_Attr = "itemNumber";
    public static final String itemNumber_Field = "ITEMNUMBER";
    public static final String itemNumber_QFielld = "ENIPITEM.ITEMNUMBER";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "ENIPITEM.INVNUMBER";
    public static final String isProjectDocument_Attr = "isProjectDocument";
    public static final String isProjectDocument_Field = "ISPROJECTDOCUMENT";
    public static final String isProjectDocument_QFielld = "ENIPITEM.ISPROJECTDOCUMENT";
    public static final String financing_Attr = "financing";
    public static final String financing_Field = "FINANCING";
    public static final String financing_QFielld = "ENIPITEM.FINANCING";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENIPITEM.COMMENTGEN";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENIPITEM.COUNTGEN";
    public static final String price_Attr = "price";
    public static final String price_Field = "PRICE";
    public static final String price_QFielld = "ENIPITEM.PRICE";
    public static final String sumGen_Attr = "sumGen";
    public static final String sumGen_Field = "SUMGEN";
    public static final String sumGen_QFielld = "ENIPITEM.SUMGEN";
    public static final String quarter1count_Attr = "quarter1count";
    public static final String quarter1count_Field = "QUARTER1COUNT";
    public static final String quarter1count_QFielld = "ENIPITEM.QUARTER1COUNT";
    public static final String quarter1sum_Attr = "quarter1sum";
    public static final String quarter1sum_Field = "QUARTER1SUM";
    public static final String quarter1sum_QFielld = "ENIPITEM.QUARTER1SUM";
    public static final String quarter2count_Attr = "quarter2count";
    public static final String quarter2count_Field = "QUARTER2COUNT";
    public static final String quarter2count_QFielld = "ENIPITEM.QUARTER2COUNT";
    public static final String quarter2sum_Attr = "quarter2sum";
    public static final String quarter2sum_Field = "QUARTER2SUM";
    public static final String quarter2sum_QFielld = "ENIPITEM.QUARTER2SUM";
    public static final String quarter3count_Attr = "quarter3count";
    public static final String quarter3count_Field = "QUARTER3COUNT";
    public static final String quarter3count_QFielld = "ENIPITEM.QUARTER3COUNT";
    public static final String quarter3sum_Attr = "quarter3sum";
    public static final String quarter3sum_Field = "QUARTER3SUM";
    public static final String quarter3sum_QFielld = "ENIPITEM.QUARTER3SUM";
    public static final String quarter4count_Attr = "quarter4count";
    public static final String quarter4count_Field = "QUARTER4COUNT";
    public static final String quarter4count_QFielld = "ENIPITEM.QUARTER4COUNT";
    public static final String quarter4sum_Attr = "quarter4sum";
    public static final String quarter4sum_Field = "QUARTER4SUM";
    public static final String quarter4sum_QFielld = "ENIPITEM.QUARTER4SUM";
    public static final String countGenInside_Attr = "countGenInside";
    public static final String countGenInside_Field = "COUNTGENINSIDE";
    public static final String countGenInside_QFielld = "ENIPITEM.COUNTGENINSIDE";
    public static final String priceInside_Attr = "priceInside";
    public static final String priceInside_Field = "PRICEINSIDE";
    public static final String priceInside_QFielld = "ENIPITEM.PRICEINSIDE";
    public static final String sumGenInside_Attr = "sumGenInside";
    public static final String sumGenInside_Field = "SUMGENINSIDE";
    public static final String sumGenInside_QFielld = "ENIPITEM.SUMGENINSIDE";
    public static final String mm1countInside_Attr = "mm1countInside";
    public static final String mm1countInside_Field = "MM1COUNTINSIDE";
    public static final String mm1countInside_QFielld = "ENIPITEM.MM1COUNTINSIDE";
    public static final String mm1sumInside_Attr = "mm1sumInside";
    public static final String mm1sumInside_Field = "MM1SUMINSIDE";
    public static final String mm1sumInside_QFielld = "ENIPITEM.MM1SUMINSIDE";
    public static final String mm2countInside_Attr = "mm2countInside";
    public static final String mm2countInside_Field = "MM2COUNTINSIDE";
    public static final String mm2countInside_QFielld = "ENIPITEM.MM2COUNTINSIDE";
    public static final String mm2sumInside_Attr = "mm2sumInside";
    public static final String mm2sumInside_Field = "MM2SUMINSIDE";
    public static final String mm2sumInside_QFielld = "ENIPITEM.MM2SUMINSIDE";
    public static final String mm3countInside_Attr = "mm3countInside";
    public static final String mm3countInside_Field = "MM3COUNTINSIDE";
    public static final String mm3countInside_QFielld = "ENIPITEM.MM3COUNTINSIDE";
    public static final String mm3sumInside_Attr = "mm3sumInside";
    public static final String mm3sumInside_Field = "MM3SUMINSIDE";
    public static final String mm3sumInside_QFielld = "ENIPITEM.MM3SUMINSIDE";
    public static final String mm4countInside_Attr = "mm4countInside";
    public static final String mm4countInside_Field = "MM4COUNTINSIDE";
    public static final String mm4countInside_QFielld = "ENIPITEM.MM4COUNTINSIDE";
    public static final String mm4sumInside_Attr = "mm4sumInside";
    public static final String mm4sumInside_Field = "MM4SUMINSIDE";
    public static final String mm4sumInside_QFielld = "ENIPITEM.MM4SUMINSIDE";
    public static final String mm5countInside_Attr = "mm5countInside";
    public static final String mm5countInside_Field = "MM5COUNTINSIDE";
    public static final String mm5countInside_QFielld = "ENIPITEM.MM5COUNTINSIDE";
    public static final String mm5sumInside_Attr = "mm5sumInside";
    public static final String mm5sumInside_Field = "MM5SUMINSIDE";
    public static final String mm5sumInside_QFielld = "ENIPITEM.MM5SUMINSIDE";
    public static final String mm6countInside_Attr = "mm6countInside";
    public static final String mm6countInside_Field = "MM6COUNTINSIDE";
    public static final String mm6countInside_QFielld = "ENIPITEM.MM6COUNTINSIDE";
    public static final String mm6sumInside_Attr = "mm6sumInside";
    public static final String mm6sumInside_Field = "MM6SUMINSIDE";
    public static final String mm6sumInside_QFielld = "ENIPITEM.MM6SUMINSIDE";
    public static final String mm7countInside_Attr = "mm7countInside";
    public static final String mm7countInside_Field = "MM7COUNTINSIDE";
    public static final String mm7countInside_QFielld = "ENIPITEM.MM7COUNTINSIDE";
    public static final String mm7sumInside_Attr = "mm7sumInside";
    public static final String mm7sumInside_Field = "MM7SUMINSIDE";
    public static final String mm7sumInside_QFielld = "ENIPITEM.MM7SUMINSIDE";
    public static final String mm8countInside_Attr = "mm8countInside";
    public static final String mm8countInside_Field = "MM8COUNTINSIDE";
    public static final String mm8countInside_QFielld = "ENIPITEM.MM8COUNTINSIDE";
    public static final String mm8sumInside_Attr = "mm8sumInside";
    public static final String mm8sumInside_Field = "MM8SUMINSIDE";
    public static final String mm8sumInside_QFielld = "ENIPITEM.MM8SUMINSIDE";
    public static final String mm9countInside_Attr = "mm9countInside";
    public static final String mm9countInside_Field = "MM9COUNTINSIDE";
    public static final String mm9countInside_QFielld = "ENIPITEM.MM9COUNTINSIDE";
    public static final String mm9sumInside_Attr = "mm9sumInside";
    public static final String mm9sumInside_Field = "MM9SUMINSIDE";
    public static final String mm9sumInside_QFielld = "ENIPITEM.MM9SUMINSIDE";
    public static final String mm10countInside_Attr = "mm10countInside";
    public static final String mm10countInside_Field = "MM10COUNTINSIDE";
    public static final String mm10countInside_QFielld = "ENIPITEM.MM10COUNTINSIDE";
    public static final String mm10sumInside_Attr = "mm10sumInside";
    public static final String mm10sumInside_Field = "MM10SUMINSIDE";
    public static final String mm10sumInside_QFielld = "ENIPITEM.MM10SUMINSIDE";
    public static final String mm11countInside_Attr = "mm11countInside";
    public static final String mm11countInside_Field = "MM11COUNTINSIDE";
    public static final String mm11countInside_QFielld = "ENIPITEM.MM11COUNTINSIDE";
    public static final String mm11sumInside_Attr = "mm11sumInside";
    public static final String mm11sumInside_Field = "MM11SUMINSIDE";
    public static final String mm11sumInside_QFielld = "ENIPITEM.MM11SUMINSIDE";
    public static final String mm12countInside_Attr = "mm12countInside";
    public static final String mm12countInside_Field = "MM12COUNTINSIDE";
    public static final String mm12countInside_QFielld = "ENIPITEM.MM12COUNTINSIDE";
    public static final String mm12sumInside_Attr = "mm12sumInside";
    public static final String mm12sumInside_Field = "MM12SUMINSIDE";
    public static final String mm12sumInside_QFielld = "ENIPITEM.MM12SUMINSIDE";
    public static final String infoTenders_Attr = "infoTenders";
    public static final String infoTenders_Field = "INFOTENDERS";
    public static final String infoTenders_QFielld = "ENIPITEM.INFOTENDERS";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENIPITEM.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENIPITEM.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENIPITEM.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENIPITEM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENIPITEM.DATEEDIT";
    public static final String measurement_Attr = "measurement";
    public static final String measurement_Field = "MEASUREMENTCODE";
    public static final String  measurement_QFielld = "ENIPITEM.MEASUREMENTCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENIPITEM.STATUSREFCODE";
    public static final String invGroupRef_Attr = "invGroupRef";
    public static final String invGroupRef_Field = "INVGROUPREFCODE";
    public static final String  invGroupRef_QFielld = "ENIPITEM.INVGROUPREFCODE";
    public static final String renRef_Attr = "renRef";
    public static final String renRef_Field = "RENREFCODE";
    public static final String  renRef_QFielld = "ENIPITEM.RENREFCODE";
    public static final String purposeProgramRef_Attr = "purposeProgramRef";
    public static final String purposeProgramRef_Field = "PURPOSEPROGRAMREFCODE";
    public static final String  purposeProgramRef_QFielld = "ENIPITEM.PURPOSEPROGRAMREFCODE";
    public static final String ipRef_Attr = "ipRef";
    public static final String ipRef_Field = "IPREFCODE";
    public static final String  ipRef_QFielld = "ENIPITEM.IPREFCODE";
    public static final String parentRef_Attr = "parentRef";
    public static final String parentRef_Field = "PARENTREFCODE";
    public static final String  parentRef_QFielld = "ENIPITEM.PARENTREFCODE";
    public static final String methodExecWorkRef_Attr = "methodExecWorkRef";
    public static final String methodExecWorkRef_Field = "METHODEXECWORKREFCODE";
    public static final String  methodExecWorkRef_QFielld = "ENIPITEM.METHODEXECWORKREFCODE";
    public static final String ipImplementTypeRef_Attr = "ipImplementTypeRef";
    public static final String ipImplementTypeRef_Field = "IPIMPLEMENTTYPEREFCODE";
    public static final String  ipImplementTypeRef_QFielld = "ENIPITEM.IPIMPLEMENTTYPEREFCODE";


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

    public void setBuhName(String aValue){
       buhName = aValue;
    }

    public String getBuhName(){
       return buhName;
    }

    public void setItemNumber(String aValue){
       itemNumber = aValue;
    }

    public String getItemNumber(){
       return itemNumber;
    }

    public void setInvNumber(String aValue){
       invNumber = aValue;
    }

    public String getInvNumber(){
       return invNumber;
    }

    public void setIsProjectDocument(int aValue){
       isProjectDocument = aValue;
    }

    public int getIsProjectDocument(){
       return isProjectDocument;
    }

    public void setFinancing(String aValue){
       financing = aValue;
    }

    public String getFinancing(){
       return financing;
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

    public void setCountGenInside(BigDecimal aValue){
       countGenInside = aValue;
    }

    public BigDecimal getCountGenInside(){
       return countGenInside;
    }

    public void setPriceInside(BigDecimal aValue){
       priceInside = aValue;
    }

    public BigDecimal getPriceInside(){
       return priceInside;
    }

    public void setSumGenInside(BigDecimal aValue){
       sumGenInside = aValue;
    }

    public BigDecimal getSumGenInside(){
       return sumGenInside;
    }

    public void setMm1countInside(BigDecimal aValue){
       mm1countInside = aValue;
    }

    public BigDecimal getMm1countInside(){
       return mm1countInside;
    }

    public void setMm1sumInside(BigDecimal aValue){
       mm1sumInside = aValue;
    }

    public BigDecimal getMm1sumInside(){
       return mm1sumInside;
    }

    public void setMm2countInside(BigDecimal aValue){
       mm2countInside = aValue;
    }

    public BigDecimal getMm2countInside(){
       return mm2countInside;
    }

    public void setMm2sumInside(BigDecimal aValue){
       mm2sumInside = aValue;
    }

    public BigDecimal getMm2sumInside(){
       return mm2sumInside;
    }

    public void setMm3countInside(BigDecimal aValue){
       mm3countInside = aValue;
    }

    public BigDecimal getMm3countInside(){
       return mm3countInside;
    }

    public void setMm3sumInside(BigDecimal aValue){
       mm3sumInside = aValue;
    }

    public BigDecimal getMm3sumInside(){
       return mm3sumInside;
    }

    public void setMm4countInside(BigDecimal aValue){
       mm4countInside = aValue;
    }

    public BigDecimal getMm4countInside(){
       return mm4countInside;
    }

    public void setMm4sumInside(BigDecimal aValue){
       mm4sumInside = aValue;
    }

    public BigDecimal getMm4sumInside(){
       return mm4sumInside;
    }

    public void setMm5countInside(BigDecimal aValue){
       mm5countInside = aValue;
    }

    public BigDecimal getMm5countInside(){
       return mm5countInside;
    }

    public void setMm5sumInside(BigDecimal aValue){
       mm5sumInside = aValue;
    }

    public BigDecimal getMm5sumInside(){
       return mm5sumInside;
    }

    public void setMm6countInside(BigDecimal aValue){
       mm6countInside = aValue;
    }

    public BigDecimal getMm6countInside(){
       return mm6countInside;
    }

    public void setMm6sumInside(BigDecimal aValue){
       mm6sumInside = aValue;
    }

    public BigDecimal getMm6sumInside(){
       return mm6sumInside;
    }

    public void setMm7countInside(BigDecimal aValue){
       mm7countInside = aValue;
    }

    public BigDecimal getMm7countInside(){
       return mm7countInside;
    }

    public void setMm7sumInside(BigDecimal aValue){
       mm7sumInside = aValue;
    }

    public BigDecimal getMm7sumInside(){
       return mm7sumInside;
    }

    public void setMm8countInside(BigDecimal aValue){
       mm8countInside = aValue;
    }

    public BigDecimal getMm8countInside(){
       return mm8countInside;
    }

    public void setMm8sumInside(BigDecimal aValue){
       mm8sumInside = aValue;
    }

    public BigDecimal getMm8sumInside(){
       return mm8sumInside;
    }

    public void setMm9countInside(BigDecimal aValue){
       mm9countInside = aValue;
    }

    public BigDecimal getMm9countInside(){
       return mm9countInside;
    }

    public void setMm9sumInside(BigDecimal aValue){
       mm9sumInside = aValue;
    }

    public BigDecimal getMm9sumInside(){
       return mm9sumInside;
    }

    public void setMm10countInside(BigDecimal aValue){
       mm10countInside = aValue;
    }

    public BigDecimal getMm10countInside(){
       return mm10countInside;
    }

    public void setMm10sumInside(BigDecimal aValue){
       mm10sumInside = aValue;
    }

    public BigDecimal getMm10sumInside(){
       return mm10sumInside;
    }

    public void setMm11countInside(BigDecimal aValue){
       mm11countInside = aValue;
    }

    public BigDecimal getMm11countInside(){
       return mm11countInside;
    }

    public void setMm11sumInside(BigDecimal aValue){
       mm11sumInside = aValue;
    }

    public BigDecimal getMm11sumInside(){
       return mm11sumInside;
    }

    public void setMm12countInside(BigDecimal aValue){
       mm12countInside = aValue;
    }

    public BigDecimal getMm12countInside(){
       return mm12countInside;
    }

    public void setMm12sumInside(BigDecimal aValue){
       mm12sumInside = aValue;
    }

    public BigDecimal getMm12sumInside(){
       return mm12sumInside;
    }

    public void setInfoTenders(String aValue){
       infoTenders = aValue;
    }

    public String getInfoTenders(){
       return infoTenders;
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

    public void setMeasurement(TKMeasurement aValue){
       measurement = aValue;
    }

    public TKMeasurement getMeasurement(){
       return measurement;
    }
    public void setStatusRef(ENIPItemStatusRef aValue){
       statusRef = aValue;
    }

    public ENIPItemStatusRef getStatusRef(){
       return statusRef;
    }
    public void setInvGroupRef(ENInvestProgramGroupsRef aValue){
       invGroupRef = aValue;
    }

    public ENInvestProgramGroupsRef getInvGroupRef(){
       return invGroupRef;
    }
    public void setRenRef(EPRenRef aValue){
       renRef = aValue;
    }

    public EPRenRef getRenRef(){
       return renRef;
    }
    public void setPurposeProgramRef(ENIPPurposeProgramRef aValue){
       purposeProgramRef = aValue;
    }

    public ENIPPurposeProgramRef getPurposeProgramRef(){
       return purposeProgramRef;
    }
    public void setIpRef(ENIPRef aValue){
       ipRef = aValue;
    }

    public ENIPRef getIpRef(){
       return ipRef;
    }
    public void setParentRef(ENIPItemRef aValue){
       parentRef = aValue;
    }

    public ENIPItemRef getParentRef(){
       return parentRef;
    }
    public void setMethodExecWorkRef(ENMethodExecuteWorkRef aValue){
       methodExecWorkRef = aValue;
    }

    public ENMethodExecuteWorkRef getMethodExecWorkRef(){
       return methodExecWorkRef;
    }
    public void setIpImplementTypeRef(ENIPImplementationTypeRef aValue){
       ipImplementTypeRef = aValue;
    }

    public ENIPImplementationTypeRef getIpImplementTypeRef(){
       return ipImplementTypeRef;
    }

} // end of ENIPItemValueObject

