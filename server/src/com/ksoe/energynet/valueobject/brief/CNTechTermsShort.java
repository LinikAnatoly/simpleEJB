
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for CNTechTerms;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class CNTechTermsShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int id_proposal = Integer.MIN_VALUE;
    public String proposalName;
    public BigDecimal power1;
    public BigDecimal power1prosp;
    public BigDecimal power1heat;
    public BigDecimal power2;
    public BigDecimal power2prosp;
    public BigDecimal power2heat;
    public BigDecimal power3;
    public BigDecimal power3prosp;
    public BigDecimal power3heat;
    public BigDecimal pow_stove;
    public BigDecimal pow_water_heat;
    public BigDecimal pow_house_heat;
    public BigDecimal tension_point;
    public BigDecimal current_automat;
    public BigDecimal pow_exist;
    public BigDecimal tension_exist;
    public int is_realized = Integer.MIN_VALUE;
    public String reason;
    public String source;
    public String source_num;
    public String ensur_point;
    public String ensur_point_num;
    public String connect_point;
    public String connect_point_num;
    public int exploit_year = Integer.MIN_VALUE;
    public int baseStation = Integer.MIN_VALUE;
    public int subsystemRefCode = Integer.MIN_VALUE;
    public String subsystemRefName;
    public int cnPackRefCode = Integer.MIN_VALUE;
    public int cnPackRefPackCode = Integer.MIN_VALUE;
    public String cnPackRefName;
    public int cnPackRefId_ren = Integer.MIN_VALUE;
    public String cnPackRefRenName;
    public int cnPackRefId_district = Integer.MIN_VALUE;
    public String cnPackRefDistrictName;
    public int cnPackRefId_pack_status = Integer.MIN_VALUE;
    public String cnPackRefStatusName;
    public String cnPackRefDescription;
    public BigDecimal cnPackRefPower;
    public String cnPackRefAddress;
    public String cnPackRefAddress_jur;
    public String cnPackRefReg_num_cn_contract;
    public Date cnPackRefDate_cn_contract;
    public String cnPackRefReg_num_spl_pp_contract;
    public Date cnPackRefDate_spl_pp_contract;
    public String cnPackRefReg_num_tu_contract;
    public Date cnPackRefDate_tu_contract;
    public String cnPackRefReg_num_tu_cr_contract;
    public Date cnPackRefDate_tu_cr_contract;
    public String cnPackRefProject_num;
    public Date cnPackRefProject_date;
    public int cnPackRefOver5 = Integer.MIN_VALUE;
    public int cnPackRefStatus = Integer.MIN_VALUE;
    public String cnPackRefLetter_num_customer;
    public Date cnPackRefDate_letter_customer;
    public String cnPackRefLetter_num;
    public Date cnPackRefDate_letter;
    public String cnPackRefReliability_class;
    public int cnPackRefId_waiting_status = Integer.MIN_VALUE;
    public String cnPackRefWaitingStatus;
    public int cnPackRefIs_payable = Integer.MIN_VALUE;
    public String cnPackRefWorksize;
    public String cnPackRefWork_inc_net;
    public String cnPackRefBusiness_type;
    public int cnPackRefEstimateterm = Integer.MIN_VALUE;
    public Date cnPackRefEstimatedate;
    public int cnPackRefBuildingterm = Integer.MIN_VALUE;
    public Date cnPackRefBuildingdate;
    public int cnPackRefBuyingterm = Integer.MIN_VALUE;
    public Date cnPackRefBuyingdate;
    public String cnPackRefEstimate_num;
    public Date cnPackRefEstimate_contract_date;
    public int cnPackRefIs_reserv = Integer.MIN_VALUE;

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


    public void setSubsystemRefCode(int aValue){
       subsystemRefCode = aValue;
    }
    public int getSubsystemRefCode(){
       return subsystemRefCode;
    }

    public void setSubsystemRefName(String aValue){
       subsystemRefName = aValue;
    }
    public String getSubsystemRefName(){
       return subsystemRefName;
    }

    public void setCnPackRefCode(int aValue){
       cnPackRefCode = aValue;
    }
    public int getCnPackRefCode(){
       return cnPackRefCode;
    }

    public void setCnPackRefPackCode(int aValue){
       cnPackRefPackCode = aValue;
    }
    public int getCnPackRefPackCode(){
       return cnPackRefPackCode;
    }

    public void setCnPackRefName(String aValue){
       cnPackRefName = aValue;
    }
    public String getCnPackRefName(){
       return cnPackRefName;
    }

    public void setCnPackRefId_ren(int aValue){
       cnPackRefId_ren = aValue;
    }
    public int getCnPackRefId_ren(){
       return cnPackRefId_ren;
    }

    public void setCnPackRefRenName(String aValue){
       cnPackRefRenName = aValue;
    }
    public String getCnPackRefRenName(){
       return cnPackRefRenName;
    }

    public void setCnPackRefId_district(int aValue){
       cnPackRefId_district = aValue;
    }
    public int getCnPackRefId_district(){
       return cnPackRefId_district;
    }

    public void setCnPackRefDistrictName(String aValue){
       cnPackRefDistrictName = aValue;
    }
    public String getCnPackRefDistrictName(){
       return cnPackRefDistrictName;
    }

    public void setCnPackRefId_pack_status(int aValue){
       cnPackRefId_pack_status = aValue;
    }
    public int getCnPackRefId_pack_status(){
       return cnPackRefId_pack_status;
    }

    public void setCnPackRefStatusName(String aValue){
       cnPackRefStatusName = aValue;
    }
    public String getCnPackRefStatusName(){
       return cnPackRefStatusName;
    }

    public void setCnPackRefDescription(String aValue){
       cnPackRefDescription = aValue;
    }
    public String getCnPackRefDescription(){
       return cnPackRefDescription;
    }

    public void setCnPackRefPower(BigDecimal aValue){
       cnPackRefPower = aValue;
    }
    public BigDecimal getCnPackRefPower(){
       return cnPackRefPower;
    }

    public void setCnPackRefAddress(String aValue){
       cnPackRefAddress = aValue;
    }
    public String getCnPackRefAddress(){
       return cnPackRefAddress;
    }

    public void setCnPackRefAddress_jur(String aValue){
       cnPackRefAddress_jur = aValue;
    }
    public String getCnPackRefAddress_jur(){
       return cnPackRefAddress_jur;
    }

    public void setCnPackRefReg_num_cn_contract(String aValue){
       cnPackRefReg_num_cn_contract = aValue;
    }
    public String getCnPackRefReg_num_cn_contract(){
       return cnPackRefReg_num_cn_contract;
    }


    public void setCnPackRefDate_cn_contract(Date aValue){
       cnPackRefDate_cn_contract = aValue;
    }
    public Date getCnPackRefDate_cn_contract(){
       return cnPackRefDate_cn_contract;
    }

    public void setCnPackRefReg_num_spl_pp_contract(String aValue){
       cnPackRefReg_num_spl_pp_contract = aValue;
    }
    public String getCnPackRefReg_num_spl_pp_contract(){
       return cnPackRefReg_num_spl_pp_contract;
    }


    public void setCnPackRefDate_spl_pp_contract(Date aValue){
       cnPackRefDate_spl_pp_contract = aValue;
    }
    public Date getCnPackRefDate_spl_pp_contract(){
       return cnPackRefDate_spl_pp_contract;
    }

    public void setCnPackRefReg_num_tu_contract(String aValue){
       cnPackRefReg_num_tu_contract = aValue;
    }
    public String getCnPackRefReg_num_tu_contract(){
       return cnPackRefReg_num_tu_contract;
    }


    public void setCnPackRefDate_tu_contract(Date aValue){
       cnPackRefDate_tu_contract = aValue;
    }
    public Date getCnPackRefDate_tu_contract(){
       return cnPackRefDate_tu_contract;
    }

    public void setCnPackRefReg_num_tu_cr_contract(String aValue){
       cnPackRefReg_num_tu_cr_contract = aValue;
    }
    public String getCnPackRefReg_num_tu_cr_contract(){
       return cnPackRefReg_num_tu_cr_contract;
    }


    public void setCnPackRefDate_tu_cr_contract(Date aValue){
       cnPackRefDate_tu_cr_contract = aValue;
    }
    public Date getCnPackRefDate_tu_cr_contract(){
       return cnPackRefDate_tu_cr_contract;
    }

    public void setCnPackRefProject_num(String aValue){
       cnPackRefProject_num = aValue;
    }
    public String getCnPackRefProject_num(){
       return cnPackRefProject_num;
    }


    public void setCnPackRefProject_date(Date aValue){
       cnPackRefProject_date = aValue;
    }
    public Date getCnPackRefProject_date(){
       return cnPackRefProject_date;
    }

    public void setCnPackRefOver5(int aValue){
       cnPackRefOver5 = aValue;
    }
    public int getCnPackRefOver5(){
       return cnPackRefOver5;
    }

    public void setCnPackRefStatus(int aValue){
       cnPackRefStatus = aValue;
    }
    public int getCnPackRefStatus(){
       return cnPackRefStatus;
    }

    public void setCnPackRefLetter_num_customer(String aValue){
       cnPackRefLetter_num_customer = aValue;
    }
    public String getCnPackRefLetter_num_customer(){
       return cnPackRefLetter_num_customer;
    }


    public void setCnPackRefDate_letter_customer(Date aValue){
       cnPackRefDate_letter_customer = aValue;
    }
    public Date getCnPackRefDate_letter_customer(){
       return cnPackRefDate_letter_customer;
    }

    public void setCnPackRefLetter_num(String aValue){
       cnPackRefLetter_num = aValue;
    }
    public String getCnPackRefLetter_num(){
       return cnPackRefLetter_num;
    }


    public void setCnPackRefDate_letter(Date aValue){
       cnPackRefDate_letter = aValue;
    }
    public Date getCnPackRefDate_letter(){
       return cnPackRefDate_letter;
    }

    public void setCnPackRefReliability_class(String aValue){
       cnPackRefReliability_class = aValue;
    }
    public String getCnPackRefReliability_class(){
       return cnPackRefReliability_class;
    }

    public void setCnPackRefId_waiting_status(int aValue){
       cnPackRefId_waiting_status = aValue;
    }
    public int getCnPackRefId_waiting_status(){
       return cnPackRefId_waiting_status;
    }

    public void setCnPackRefWaitingStatus(String aValue){
       cnPackRefWaitingStatus = aValue;
    }
    public String getCnPackRefWaitingStatus(){
       return cnPackRefWaitingStatus;
    }

    public void setCnPackRefIs_payable(int aValue){
       cnPackRefIs_payable = aValue;
    }
    public int getCnPackRefIs_payable(){
       return cnPackRefIs_payable;
    }

    public void setCnPackRefWorksize(String aValue){
       cnPackRefWorksize = aValue;
    }
    public String getCnPackRefWorksize(){
       return cnPackRefWorksize;
    }

    public void setCnPackRefWork_inc_net(String aValue){
       cnPackRefWork_inc_net = aValue;
    }
    public String getCnPackRefWork_inc_net(){
       return cnPackRefWork_inc_net;
    }

    public void setCnPackRefBusiness_type(String aValue){
       cnPackRefBusiness_type = aValue;
    }
    public String getCnPackRefBusiness_type(){
       return cnPackRefBusiness_type;
    }

    public void setCnPackRefEstimateterm(int aValue){
       cnPackRefEstimateterm = aValue;
    }
    public int getCnPackRefEstimateterm(){
       return cnPackRefEstimateterm;
    }


    public void setCnPackRefEstimatedate(Date aValue){
       cnPackRefEstimatedate = aValue;
    }
    public Date getCnPackRefEstimatedate(){
       return cnPackRefEstimatedate;
    }

    public void setCnPackRefBuildingterm(int aValue){
       cnPackRefBuildingterm = aValue;
    }
    public int getCnPackRefBuildingterm(){
       return cnPackRefBuildingterm;
    }


    public void setCnPackRefBuildingdate(Date aValue){
       cnPackRefBuildingdate = aValue;
    }
    public Date getCnPackRefBuildingdate(){
       return cnPackRefBuildingdate;
    }

    public void setCnPackRefBuyingterm(int aValue){
       cnPackRefBuyingterm = aValue;
    }
    public int getCnPackRefBuyingterm(){
       return cnPackRefBuyingterm;
    }


    public void setCnPackRefBuyingdate(Date aValue){
       cnPackRefBuyingdate = aValue;
    }
    public Date getCnPackRefBuyingdate(){
       return cnPackRefBuyingdate;
    }

    public void setCnPackRefEstimate_num(String aValue){
       cnPackRefEstimate_num = aValue;
    }
    public String getCnPackRefEstimate_num(){
       return cnPackRefEstimate_num;
    }


    public void setCnPackRefEstimate_contract_date(Date aValue){
       cnPackRefEstimate_contract_date = aValue;
    }
    public Date getCnPackRefEstimate_contract_date(){
       return cnPackRefEstimate_contract_date;
    }

    public void setCnPackRefIs_reserv(int aValue){
       cnPackRefIs_reserv = aValue;
    }
    public int getCnPackRefIs_reserv(){
       return cnPackRefIs_reserv;
    }



}