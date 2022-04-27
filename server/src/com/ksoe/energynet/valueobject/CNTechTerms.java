
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for CNTechTerms;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.CNSubsystemTypeRef;
    import  com.ksoe.energynet.valueobject.references.CNPackRef;

public class CNTechTerms implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  id_proposal = Integer.MIN_VALUE; 
    public String  proposalName; 
    public BigDecimal  power1; 
    public BigDecimal  power1prosp; 
    public BigDecimal  power1heat; 
    public BigDecimal  power2; 
    public BigDecimal  power2prosp; 
    public BigDecimal  power2heat; 
    public BigDecimal  power3; 
    public BigDecimal  power3prosp; 
    public BigDecimal  power3heat; 
    public BigDecimal  pow_stove; 
    public BigDecimal  pow_water_heat; 
    public BigDecimal  pow_house_heat; 
    public BigDecimal  tension_point; 
    public BigDecimal  current_automat; 
    public BigDecimal  pow_exist; 
    public BigDecimal  tension_exist; 
    public int  is_realized = Integer.MIN_VALUE; 
    public String  reason; 
    public String  source; 
    public String  source_num; 
    public String  ensur_point; 
    public String  ensur_point_num; 
    public String  connect_point; 
    public String  connect_point_num; 
    public int  exploit_year = Integer.MIN_VALUE; 
    public int  baseStation = Integer.MIN_VALUE; 
    public CNSubsystemTypeRef subsystemRef = new CNSubsystemTypeRef();
    public CNPackRef cnPackRef = new CNPackRef();
    public static final String tableName = "CNTECHTERMS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "CNTECHTERMS.CODE";
    public static final String id_proposal_Attr = "id_proposal";
    public static final String id_proposal_Field = "ID_PROPOSAL";
    public static final String id_proposal_QFielld = "CNTECHTERMS.ID_PROPOSAL";
    public static final String proposalName_Attr = "proposalName";
    public static final String proposalName_Field = "PROPOSALNAME";
    public static final String proposalName_QFielld = "CNTECHTERMS.PROPOSALNAME";
    public static final String power1_Attr = "power1";
    public static final String power1_Field = "POWER1";
    public static final String power1_QFielld = "CNTECHTERMS.POWER1";
    public static final String power1prosp_Attr = "power1prosp";
    public static final String power1prosp_Field = "POWER1PROSP";
    public static final String power1prosp_QFielld = "CNTECHTERMS.POWER1PROSP";
    public static final String power1heat_Attr = "power1heat";
    public static final String power1heat_Field = "POWER1HEAT";
    public static final String power1heat_QFielld = "CNTECHTERMS.POWER1HEAT";
    public static final String power2_Attr = "power2";
    public static final String power2_Field = "POWER2";
    public static final String power2_QFielld = "CNTECHTERMS.POWER2";
    public static final String power2prosp_Attr = "power2prosp";
    public static final String power2prosp_Field = "POWER2PROSP";
    public static final String power2prosp_QFielld = "CNTECHTERMS.POWER2PROSP";
    public static final String power2heat_Attr = "power2heat";
    public static final String power2heat_Field = "POWER2HEAT";
    public static final String power2heat_QFielld = "CNTECHTERMS.POWER2HEAT";
    public static final String power3_Attr = "power3";
    public static final String power3_Field = "POWER3";
    public static final String power3_QFielld = "CNTECHTERMS.POWER3";
    public static final String power3prosp_Attr = "power3prosp";
    public static final String power3prosp_Field = "POWER3PROSP";
    public static final String power3prosp_QFielld = "CNTECHTERMS.POWER3PROSP";
    public static final String power3heat_Attr = "power3heat";
    public static final String power3heat_Field = "POWER3HEAT";
    public static final String power3heat_QFielld = "CNTECHTERMS.POWER3HEAT";
    public static final String pow_stove_Attr = "pow_stove";
    public static final String pow_stove_Field = "POW_STOVE";
    public static final String pow_stove_QFielld = "CNTECHTERMS.POW_STOVE";
    public static final String pow_water_heat_Attr = "pow_water_heat";
    public static final String pow_water_heat_Field = "POW_WATER_HEAT";
    public static final String pow_water_heat_QFielld = "CNTECHTERMS.POW_WATER_HEAT";
    public static final String pow_house_heat_Attr = "pow_house_heat";
    public static final String pow_house_heat_Field = "POW_HOUSE_HEAT";
    public static final String pow_house_heat_QFielld = "CNTECHTERMS.POW_HOUSE_HEAT";
    public static final String tension_point_Attr = "tension_point";
    public static final String tension_point_Field = "TENSION_POINT";
    public static final String tension_point_QFielld = "CNTECHTERMS.TENSION_POINT";
    public static final String current_automat_Attr = "current_automat";
    public static final String current_automat_Field = "CURRENT_AUTOMAT";
    public static final String current_automat_QFielld = "CNTECHTERMS.CURRENT_AUTOMAT";
    public static final String pow_exist_Attr = "pow_exist";
    public static final String pow_exist_Field = "POW_EXIST";
    public static final String pow_exist_QFielld = "CNTECHTERMS.POW_EXIST";
    public static final String tension_exist_Attr = "tension_exist";
    public static final String tension_exist_Field = "TENSION_EXIST";
    public static final String tension_exist_QFielld = "CNTECHTERMS.TENSION_EXIST";
    public static final String is_realized_Attr = "is_realized";
    public static final String is_realized_Field = "IS_REALIZED";
    public static final String is_realized_QFielld = "CNTECHTERMS.IS_REALIZED";
    public static final String reason_Attr = "reason";
    public static final String reason_Field = "REASON";
    public static final String reason_QFielld = "CNTECHTERMS.REASON";
    public static final String source_Attr = "source";
    public static final String source_Field = "SOURCE";
    public static final String source_QFielld = "CNTECHTERMS.SOURCE";
    public static final String source_num_Attr = "source_num";
    public static final String source_num_Field = "SOURCE_NUM";
    public static final String source_num_QFielld = "CNTECHTERMS.SOURCE_NUM";
    public static final String ensur_point_Attr = "ensur_point";
    public static final String ensur_point_Field = "ENSUR_POINT";
    public static final String ensur_point_QFielld = "CNTECHTERMS.ENSUR_POINT";
    public static final String ensur_point_num_Attr = "ensur_point_num";
    public static final String ensur_point_num_Field = "ENSUR_POINT_NUM";
    public static final String ensur_point_num_QFielld = "CNTECHTERMS.ENSUR_POINT_NUM";
    public static final String connect_point_Attr = "connect_point";
    public static final String connect_point_Field = "CONNECT_POINT";
    public static final String connect_point_QFielld = "CNTECHTERMS.CONNECT_POINT";
    public static final String connect_point_num_Attr = "connect_point_num";
    public static final String connect_point_num_Field = "CONNECT_POINT_NUM";
    public static final String connect_point_num_QFielld = "CNTECHTERMS.CONNECT_POINT_NUM";
    public static final String exploit_year_Attr = "exploit_year";
    public static final String exploit_year_Field = "EXPLOIT_YEAR";
    public static final String exploit_year_QFielld = "CNTECHTERMS.EXPLOIT_YEAR";
    public static final String baseStation_Attr = "baseStation";
    public static final String baseStation_Field = "BASESTATION";
    public static final String baseStation_QFielld = "CNTECHTERMS.BASESTATION";
    public static final String subsystemRef_Attr = "subsystemRef";
    public static final String subsystemRef_Field = "SUBSYSTEMREFCODE";
    public static final String  subsystemRef_QFielld = "CNTECHTERMS.SUBSYSTEMREFCODE";
    public static final String cnPackRef_Attr = "cnPackRef";
    public static final String cnPackRef_Field = "CNPACKREFCODE";
    public static final String  cnPackRef_QFielld = "CNTECHTERMS.CNPACKREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setId_proposal(int aValue){
       id_proposal = aValue;
    }

    public int getId_proposal(){
       return id_proposal;
    }

    public void setProposalName(String aValue){
       proposalName = aValue;
    }

    public String getProposalName(){
       return proposalName;
    }

    public void setPower1(BigDecimal aValue){
       power1 = aValue;
    }

    public BigDecimal getPower1(){
       return power1;
    }

    public void setPower1prosp(BigDecimal aValue){
       power1prosp = aValue;
    }

    public BigDecimal getPower1prosp(){
       return power1prosp;
    }

    public void setPower1heat(BigDecimal aValue){
       power1heat = aValue;
    }

    public BigDecimal getPower1heat(){
       return power1heat;
    }

    public void setPower2(BigDecimal aValue){
       power2 = aValue;
    }

    public BigDecimal getPower2(){
       return power2;
    }

    public void setPower2prosp(BigDecimal aValue){
       power2prosp = aValue;
    }

    public BigDecimal getPower2prosp(){
       return power2prosp;
    }

    public void setPower2heat(BigDecimal aValue){
       power2heat = aValue;
    }

    public BigDecimal getPower2heat(){
       return power2heat;
    }

    public void setPower3(BigDecimal aValue){
       power3 = aValue;
    }

    public BigDecimal getPower3(){
       return power3;
    }

    public void setPower3prosp(BigDecimal aValue){
       power3prosp = aValue;
    }

    public BigDecimal getPower3prosp(){
       return power3prosp;
    }

    public void setPower3heat(BigDecimal aValue){
       power3heat = aValue;
    }

    public BigDecimal getPower3heat(){
       return power3heat;
    }

    public void setPow_stove(BigDecimal aValue){
       pow_stove = aValue;
    }

    public BigDecimal getPow_stove(){
       return pow_stove;
    }

    public void setPow_water_heat(BigDecimal aValue){
       pow_water_heat = aValue;
    }

    public BigDecimal getPow_water_heat(){
       return pow_water_heat;
    }

    public void setPow_house_heat(BigDecimal aValue){
       pow_house_heat = aValue;
    }

    public BigDecimal getPow_house_heat(){
       return pow_house_heat;
    }

    public void setTension_point(BigDecimal aValue){
       tension_point = aValue;
    }

    public BigDecimal getTension_point(){
       return tension_point;
    }

    public void setCurrent_automat(BigDecimal aValue){
       current_automat = aValue;
    }

    public BigDecimal getCurrent_automat(){
       return current_automat;
    }

    public void setPow_exist(BigDecimal aValue){
       pow_exist = aValue;
    }

    public BigDecimal getPow_exist(){
       return pow_exist;
    }

    public void setTension_exist(BigDecimal aValue){
       tension_exist = aValue;
    }

    public BigDecimal getTension_exist(){
       return tension_exist;
    }

    public void setIs_realized(int aValue){
       is_realized = aValue;
    }

    public int getIs_realized(){
       return is_realized;
    }

    public void setReason(String aValue){
       reason = aValue;
    }

    public String getReason(){
       return reason;
    }

    public void setSource(String aValue){
       source = aValue;
    }

    public String getSource(){
       return source;
    }

    public void setSource_num(String aValue){
       source_num = aValue;
    }

    public String getSource_num(){
       return source_num;
    }

    public void setEnsur_point(String aValue){
       ensur_point = aValue;
    }

    public String getEnsur_point(){
       return ensur_point;
    }

    public void setEnsur_point_num(String aValue){
       ensur_point_num = aValue;
    }

    public String getEnsur_point_num(){
       return ensur_point_num;
    }

    public void setConnect_point(String aValue){
       connect_point = aValue;
    }

    public String getConnect_point(){
       return connect_point;
    }

    public void setConnect_point_num(String aValue){
       connect_point_num = aValue;
    }

    public String getConnect_point_num(){
       return connect_point_num;
    }

    public void setExploit_year(int aValue){
       exploit_year = aValue;
    }

    public int getExploit_year(){
       return exploit_year;
    }

    public void setBaseStation(int aValue){
       baseStation = aValue;
    }

    public int getBaseStation(){
       return baseStation;
    }

    public void setSubsystemRef(CNSubsystemTypeRef aValue){
       subsystemRef = aValue;
    }

    public CNSubsystemTypeRef getSubsystemRef(){
       return subsystemRef;
    }
    public void setCnPackRef(CNPackRef aValue){
       cnPackRef = aValue;
    }

    public CNPackRef getCnPackRef(){
       return cnPackRef;
    }

} // end of CNTechTermsValueObject

