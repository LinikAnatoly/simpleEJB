
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDistributionAgree;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENWarrantRef;

public class ENDistributionAgree implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  numberGen; 
    public Date dateGen ;
    public String  eic; 
    public String  objectname; 
    public String  objectaddress; 
    public BigDecimal  power; 
    public String  d2fusename; 
    public String  d3countername; 
    public String  d3countertype; 
    public BigDecimal  d3amperageratio; 
    public BigDecimal  d3voltageratio; 
    public BigDecimal  d3totalratio; 
    public String  d3place; 
    public String  d3voltageclass; 
    public String  d3workmode; 
    public String  d3tarifftype; 
    public String  d3accountingtype; 
    public String  d5feederlist; 
    public String  d6reliabilitypue; 
    public String  d6reliabilityguaranteed; 
    public String  d6balancesupplier; 
    public String  d6balanceclient; 
    public String  d6responsibilitysupplier; 
    public String  d6responsibilityclient; 
    public String  d6balancelimit; 
    public String  d7linesource; 
    public String  d7attachment; 
    public String  d8conditions; 
    public String  d8transformertype; 
    public BigDecimal  d8voltagebh; 
    public BigDecimal  d8voltagehh; 
    public BigDecimal  d8lossesxx; 
    public BigDecimal  d8losseskz; 
    public BigDecimal  d8amperage; 
    public BigDecimal  d8voltagekz; 
    public BigDecimal  d8linelength; 
    public BigDecimal  d8liner; 
    public BigDecimal  d8linex; 
    public int  d8hours = Integer.MIN_VALUE;
    public String  userGen; 
    public long  modify_time = Long.MIN_VALUE;
    public ENWarrantRef warrantRef = new ENWarrantRef();
    public static final String tableName = "ENDISTRIBUTIONAGREE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDISTRIBUTIONAGREE.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENDISTRIBUTIONAGREE.NUMBERGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENDISTRIBUTIONAGREE.DATEGEN";
    public static final String eic_Attr = "eic";
    public static final String eic_Field = "EIC";
    public static final String eic_QFielld = "ENDISTRIBUTIONAGREE.EIC";
    public static final String objectname_Attr = "objectname";
    public static final String objectname_Field = "OBJECTNAME";
    public static final String objectname_QFielld = "ENDISTRIBUTIONAGREE.OBJECTNAME";
    public static final String objectaddress_Attr = "objectaddress";
    public static final String objectaddress_Field = "OBJECTADDRESS";
    public static final String objectaddress_QFielld = "ENDISTRIBUTIONAGREE.OBJECTADDRESS";
    public static final String power_Attr = "power";
    public static final String power_Field = "POWER";
    public static final String power_QFielld = "ENDISTRIBUTIONAGREE.POWER";
    public static final String d2fusename_Attr = "d2fusename";
    public static final String d2fusename_Field = "D2FUSENAME";
    public static final String d2fusename_QFielld = "ENDISTRIBUTIONAGREE.D2FUSENAME";
    public static final String d3countername_Attr = "d3countername";
    public static final String d3countername_Field = "D3COUNTERNAME";
    public static final String d3countername_QFielld = "ENDISTRIBUTIONAGREE.D3COUNTERNAME";
    public static final String d3countertype_Attr = "d3countertype";
    public static final String d3countertype_Field = "D3COUNTERTYPE";
    public static final String d3countertype_QFielld = "ENDISTRIBUTIONAGREE.D3COUNTERTYPE";
    public static final String d3amperageratio_Attr = "d3amperageratio";
    public static final String d3amperageratio_Field = "D3AMPERAGERATIO";
    public static final String d3amperageratio_QFielld = "ENDISTRIBUTIONAGREE.D3AMPERAGERATIO";
    public static final String d3voltageratio_Attr = "d3voltageratio";
    public static final String d3voltageratio_Field = "D3VOLTAGERATIO";
    public static final String d3voltageratio_QFielld = "ENDISTRIBUTIONAGREE.D3VOLTAGERATIO";
    public static final String d3totalratio_Attr = "d3totalratio";
    public static final String d3totalratio_Field = "D3TOTALRATIO";
    public static final String d3totalratio_QFielld = "ENDISTRIBUTIONAGREE.D3TOTALRATIO";
    public static final String d3place_Attr = "d3place";
    public static final String d3place_Field = "D3PLACE";
    public static final String d3place_QFielld = "ENDISTRIBUTIONAGREE.D3PLACE";
    public static final String d3voltageclass_Attr = "d3voltageclass";
    public static final String d3voltageclass_Field = "D3VOLTAGECLASS";
    public static final String d3voltageclass_QFielld = "ENDISTRIBUTIONAGREE.D3VOLTAGECLASS";
    public static final String d3workmode_Attr = "d3workmode";
    public static final String d3workmode_Field = "D3WORKMODE";
    public static final String d3workmode_QFielld = "ENDISTRIBUTIONAGREE.D3WORKMODE";
    public static final String d3tarifftype_Attr = "d3tarifftype";
    public static final String d3tarifftype_Field = "D3TARIFFTYPE";
    public static final String d3tarifftype_QFielld = "ENDISTRIBUTIONAGREE.D3TARIFFTYPE";
    public static final String d3accountingtype_Attr = "d3accountingtype";
    public static final String d3accountingtype_Field = "D3ACCOUNTINGTYPE";
    public static final String d3accountingtype_QFielld = "ENDISTRIBUTIONAGREE.D3ACCOUNTINGTYPE";
    public static final String d5feederlist_Attr = "d5feederlist";
    public static final String d5feederlist_Field = "D5FEEDERLIST";
    public static final String d5feederlist_QFielld = "ENDISTRIBUTIONAGREE.D5FEEDERLIST";
    public static final String d6reliabilitypue_Attr = "d6reliabilitypue";
    public static final String d6reliabilitypue_Field = "D6RELIABILITYPUE";
    public static final String d6reliabilitypue_QFielld = "ENDISTRIBUTIONAGREE.D6RELIABILITYPUE";
    public static final String d6reliabilityguaranteed_Attr = "d6reliabilityguaranteed";
    public static final String d6reliabilityguaranteed_Field = "D6RELIABILITYGUARANTEED";
    public static final String d6reliabilityguaranteed_QFielld = "ENDISTRIBUTIONAGREE.D6RELIABILITYGUARANTED";
    public static final String d6balancesupplier_Attr = "d6balancesupplier";
    public static final String d6balancesupplier_Field = "D6BALANCESUPPLIER";
    public static final String d6balancesupplier_QFielld = "ENDISTRIBUTIONAGREE.D6BALANCESUPPLIER";
    public static final String d6balanceclient_Attr = "d6balanceclient";
    public static final String d6balanceclient_Field = "D6BALANCECLIENT";
    public static final String d6balanceclient_QFielld = "ENDISTRIBUTIONAGREE.D6BALANCECLIENT";
    public static final String d6responsibilitysupplier_Attr = "d6responsibilitysupplier";
    public static final String d6responsibilitysupplier_Field = "D6RESPONSIBILITYSUPPLIER";
    public static final String d6responsibilitysupplier_QFielld = "ENDISTRIBUTIONAGREE.D6RESPONSIBILITYSUPPLR";
    public static final String d6responsibilityclient_Attr = "d6responsibilityclient";
    public static final String d6responsibilityclient_Field = "D6RESPONSIBILITYCLIENT";
    public static final String d6responsibilityclient_QFielld = "ENDISTRIBUTIONAGREE.D6RESPONSIBILITYCLIENT";
    public static final String d6balancelimit_Attr = "d6balancelimit";
    public static final String d6balancelimit_Field = "D6BALANCELIMIT";
    public static final String d6balancelimit_QFielld = "ENDISTRIBUTIONAGREE.D6BALANCELIMIT";
    public static final String d7linesource_Attr = "d7linesource";
    public static final String d7linesource_Field = "D7LINESOURCE";
    public static final String d7linesource_QFielld = "ENDISTRIBUTIONAGREE.D7LINESOURCE";
    public static final String d7attachment_Attr = "d7attachment";
    public static final String d7attachment_Field = "D7ATTACHMENT";
    public static final String d7attachment_QFielld = "ENDISTRIBUTIONAGREE.D7ATTACHMENT";
    public static final String d8conditions_Attr = "d8conditions";
    public static final String d8conditions_Field = "D8CONDITIONS";
    public static final String d8conditions_QFielld = "ENDISTRIBUTIONAGREE.D8CONDITIONS";
    public static final String d8transformertype_Attr = "d8transformertype";
    public static final String d8transformertype_Field = "D8TRANSFORMERTYPE";
    public static final String d8transformertype_QFielld = "ENDISTRIBUTIONAGREE.D8TRANSFORMERTYPE";
    public static final String d8voltagebh_Attr = "d8voltagebh";
    public static final String d8voltagebh_Field = "D8VOLTAGEBH";
    public static final String d8voltagebh_QFielld = "ENDISTRIBUTIONAGREE.D8VOLTAGEBH";
    public static final String d8voltagehh_Attr = "d8voltagehh";
    public static final String d8voltagehh_Field = "D8VOLTAGEHH";
    public static final String d8voltagehh_QFielld = "ENDISTRIBUTIONAGREE.D8VOLTAGEHH";
    public static final String d8lossesxx_Attr = "d8lossesxx";
    public static final String d8lossesxx_Field = "D8LOSSESXX";
    public static final String d8lossesxx_QFielld = "ENDISTRIBUTIONAGREE.D8LOSSESXX";
    public static final String d8losseskz_Attr = "d8losseskz";
    public static final String d8losseskz_Field = "D8LOSSESKZ";
    public static final String d8losseskz_QFielld = "ENDISTRIBUTIONAGREE.D8LOSSESKZ";
    public static final String d8amperage_Attr = "d8amperage";
    public static final String d8amperage_Field = "D8AMPERAGE";
    public static final String d8amperage_QFielld = "ENDISTRIBUTIONAGREE.D8AMPERAGE";
    public static final String d8voltagekz_Attr = "d8voltagekz";
    public static final String d8voltagekz_Field = "D8VOLTAGEKZ";
    public static final String d8voltagekz_QFielld = "ENDISTRIBUTIONAGREE.D8VOLTAGEKZ";
    public static final String d8linelength_Attr = "d8linelength";
    public static final String d8linelength_Field = "D8LINELENGTH";
    public static final String d8linelength_QFielld = "ENDISTRIBUTIONAGREE.D8LINELENGTH";
    public static final String d8liner_Attr = "d8liner";
    public static final String d8liner_Field = "D8LINER";
    public static final String d8liner_QFielld = "ENDISTRIBUTIONAGREE.D8LINER";
    public static final String d8linex_Attr = "d8linex";
    public static final String d8linex_Field = "D8LINEX";
    public static final String d8linex_QFielld = "ENDISTRIBUTIONAGREE.D8LINEX";
    public static final String d8hours_Attr = "d8hours";
    public static final String d8hours_Field = "D8HOURS";
    public static final String d8hours_QFielld = "ENDISTRIBUTIONAGREE.D8HOURS";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENDISTRIBUTIONAGREE.USERGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENDISTRIBUTIONAGREE.MODIFY_TIME";
    public static final String warrantRef_Attr = "warrantRef";
    public static final String warrantRef_Field = "WARRANTREFCODE";
    public static final String  warrantRef_QFielld = "ENDISTRIBUTIONAGREE.WARRANTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }


    public void setEic(String aValue){
       eic = aValue;
    }

    public String getEic(){
       return eic;
    }


    public void setObjectname(String aValue){
       objectname = aValue;
    }

    public String getObjectname(){
       return objectname;
    }


    public void setObjectaddress(String aValue){
       objectaddress = aValue;
    }

    public String getObjectaddress(){
       return objectaddress;
    }


    public void setPower(BigDecimal aValue){
       power = aValue;
    }

    public BigDecimal getPower(){
       return power;
    }


    public void setD2fusename(String aValue){
       d2fusename = aValue;
    }

    public String getD2fusename(){
       return d2fusename;
    }


    public void setD3countername(String aValue){
       d3countername = aValue;
    }

    public String getD3countername(){
       return d3countername;
    }


    public void setD3countertype(String aValue){
       d3countertype = aValue;
    }

    public String getD3countertype(){
       return d3countertype;
    }


    public void setD3amperageratio(BigDecimal aValue){
       d3amperageratio = aValue;
    }

    public BigDecimal getD3amperageratio(){
       return d3amperageratio;
    }


    public void setD3voltageratio(BigDecimal aValue){
       d3voltageratio = aValue;
    }

    public BigDecimal getD3voltageratio(){
       return d3voltageratio;
    }


    public void setD3totalratio(BigDecimal aValue){
       d3totalratio = aValue;
    }

    public BigDecimal getD3totalratio(){
       return d3totalratio;
    }


    public void setD3place(String aValue){
       d3place = aValue;
    }

    public String getD3place(){
       return d3place;
    }


    public void setD3voltageclass(String aValue){
       d3voltageclass = aValue;
    }

    public String getD3voltageclass(){
       return d3voltageclass;
    }


    public void setD3workmode(String aValue){
       d3workmode = aValue;
    }

    public String getD3workmode(){
       return d3workmode;
    }


    public void setD3tarifftype(String aValue){
       d3tarifftype = aValue;
    }

    public String getD3tarifftype(){
       return d3tarifftype;
    }


    public void setD3accountingtype(String aValue){
       d3accountingtype = aValue;
    }

    public String getD3accountingtype(){
       return d3accountingtype;
    }


    public void setD5feederlist(String aValue){
       d5feederlist = aValue;
    }

    public String getD5feederlist(){
       return d5feederlist;
    }


    public void setD6reliabilitypue(String aValue){
       d6reliabilitypue = aValue;
    }

    public String getD6reliabilitypue(){
       return d6reliabilitypue;
    }


    public void setD6reliabilityguaranteed(String aValue){
       d6reliabilityguaranteed = aValue;
    }

    public String getD6reliabilityguaranteed(){
       return d6reliabilityguaranteed;
    }


    public void setD6balancesupplier(String aValue){
       d6balancesupplier = aValue;
    }

    public String getD6balancesupplier(){
       return d6balancesupplier;
    }


    public void setD6balanceclient(String aValue){
       d6balanceclient = aValue;
    }

    public String getD6balanceclient(){
       return d6balanceclient;
    }


    public void setD6responsibilitysupplier(String aValue){
       d6responsibilitysupplier = aValue;
    }

    public String getD6responsibilitysupplier(){
       return d6responsibilitysupplier;
    }


    public void setD6responsibilityclient(String aValue){
       d6responsibilityclient = aValue;
    }

    public String getD6responsibilityclient(){
       return d6responsibilityclient;
    }


    public void setD6balancelimit(String aValue){
       d6balancelimit = aValue;
    }

    public String getD6balancelimit(){
       return d6balancelimit;
    }


    public void setD7linesource(String aValue){
       d7linesource = aValue;
    }

    public String getD7linesource(){
       return d7linesource;
    }


    public void setD7attachment(String aValue){
       d7attachment = aValue;
    }

    public String getD7attachment(){
       return d7attachment;
    }


    public void setD8conditions(String aValue){
       d8conditions = aValue;
    }

    public String getD8conditions(){
       return d8conditions;
    }


    public void setD8transformertype(String aValue){
       d8transformertype = aValue;
    }

    public String getD8transformertype(){
       return d8transformertype;
    }


    public void setD8voltagebh(BigDecimal aValue){
       d8voltagebh = aValue;
    }

    public BigDecimal getD8voltagebh(){
       return d8voltagebh;
    }


    public void setD8voltagehh(BigDecimal aValue){
       d8voltagehh = aValue;
    }

    public BigDecimal getD8voltagehh(){
       return d8voltagehh;
    }


    public void setD8lossesxx(BigDecimal aValue){
       d8lossesxx = aValue;
    }

    public BigDecimal getD8lossesxx(){
       return d8lossesxx;
    }


    public void setD8losseskz(BigDecimal aValue){
       d8losseskz = aValue;
    }

    public BigDecimal getD8losseskz(){
       return d8losseskz;
    }


    public void setD8amperage(BigDecimal aValue){
       d8amperage = aValue;
    }

    public BigDecimal getD8amperage(){
       return d8amperage;
    }


    public void setD8voltagekz(BigDecimal aValue){
       d8voltagekz = aValue;
    }

    public BigDecimal getD8voltagekz(){
       return d8voltagekz;
    }


    public void setD8linelength(BigDecimal aValue){
       d8linelength = aValue;
    }

    public BigDecimal getD8linelength(){
       return d8linelength;
    }


    public void setD8liner(BigDecimal aValue){
       d8liner = aValue;
    }

    public BigDecimal getD8liner(){
       return d8liner;
    }


    public void setD8linex(BigDecimal aValue){
       d8linex = aValue;
    }

    public BigDecimal getD8linex(){
       return d8linex;
    }


    public void setD8hours(int aValue){
       d8hours = aValue;
    }

    public int getD8hours(){
       return d8hours;
    }


    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setWarrantRef(ENWarrantRef aValue){
       warrantRef = aValue;
    }

    public ENWarrantRef getWarrantRef(){
       return warrantRef;
    }

} // end of ENDistributionAgreeValueObject

