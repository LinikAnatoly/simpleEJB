
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINMaterials;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;

import com.ksoe.energynet.valueobject.brief.FINMaterialsShort;
import com.ksoe.energynet.valueobject.references.ENEstimateItemRef;
import com.ksoe.energynet.valueobject.references.FINMaterialsRef;
import com.ksoe.energynet.valueobject.references.FINMaterialsStatusRef;
import com.ksoe.energynet.valueobject.references.FINMolDataRef;

public class FINMaterials implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  mat_id = Integer.MIN_VALUE; 
    public String  nn; 
    public String  mat_name; 
    public int  mu_id = Integer.MIN_VALUE; 
    public String  mu_name; 
    public String  div_code; 
    public String  div_name; 
    public int  party_id = Integer.MIN_VALUE; 
    public String  doc_num; 
    public String  partner; 
    public String  partner_name; 
    public Date doc_date ;
    public String  party_discription; 
    public int  rest_purpose_id = Integer.MIN_VALUE; 
    public String  rest_purpose_name; 
    public int  rest_purpose_type_id = Integer.MIN_VALUE; 
    public int  budget_core_id = Integer.MIN_VALUE; 
    public int  frc_code = Integer.MIN_VALUE; 
    public String  frc_name; 
    public BigDecimal  calc_price; 
    public BigDecimal  quantity; 
    public BigDecimal  price; 
    public BigDecimal  cost; 
    public String  bal_sch; 
    public BigDecimal  fullQuantity; 
    public BigDecimal  fullCost; 
    public int  finDocItemCode = Integer.MIN_VALUE; 
    public Date wear_date ;
    public long  modify_time = Long.MIN_VALUE;
    public String  userGen; 
    public Date dateEdit ;
    public int  oldCode = Integer.MIN_VALUE; 
    public BigDecimal  extra_cargo; 
    public BigDecimal  cost_ext; 
    public BigDecimal  extra_cargo_nds; 
    public BigDecimal  cost_ext_nds; 
    public String  ax_party_id; 
    public String  ax_rest_purpose_id; 
    public String  ax_rest_purpose_typeid; 
    public String  ax_frc_code; 
    public BigDecimal  ax_inv_posted_qty_unit; 
    public BigDecimal  ax_inv_deducted_unit; 
    public BigDecimal  ax_inv_received_unit; 
    public BigDecimal  ax_inv_reserv_phys_unit; 
    public BigDecimal  ax_inv_avail_phys_unit; 
    public BigDecimal  ax_inv_physical_value; 
    public BigDecimal  ax_inv_posted_value; 
    public String  axInventTransferLinesCode; 
    public String  axInventDimFinId; 
    public BigDecimal  axFactor; 
    public ENEstimateItemRef estimateItemRef = new ENEstimateItemRef();
    public FINMaterialsStatusRef statusRef = new FINMaterialsStatusRef();
    public FINMolDataRef molDataRef = new FINMolDataRef();
    public FINMaterialsRef parentRef = new FINMaterialsRef();
    
    public static final String tableName = "FINMATERIALS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINMATERIALS.CODE";
    public static final String mat_id_Attr = "mat_id";
    public static final String mat_id_Field = "MAT_ID";
    public static final String mat_id_QFielld = "FINMATERIALS.MAT_ID";
    public static final String nn_Attr = "nn";
    public static final String nn_Field = "NN";
    public static final String nn_QFielld = "FINMATERIALS.NN";
    public static final String mat_name_Attr = "mat_name";
    public static final String mat_name_Field = "MAT_NAME";
    public static final String mat_name_QFielld = "FINMATERIALS.MAT_NAME";
    public static final String mu_id_Attr = "mu_id";
    public static final String mu_id_Field = "MU_ID";
    public static final String mu_id_QFielld = "FINMATERIALS.MU_ID";
    public static final String mu_name_Attr = "mu_name";
    public static final String mu_name_Field = "MU_NAME";
    public static final String mu_name_QFielld = "FINMATERIALS.MU_NAME";
    public static final String div_code_Attr = "div_code";
    public static final String div_code_Field = "DIV_CODE";
    public static final String div_code_QFielld = "FINMATERIALS.DIV_CODE";
    public static final String div_name_Attr = "div_name";
    public static final String div_name_Field = "DIV_NAME";
    public static final String div_name_QFielld = "FINMATERIALS.DIV_NAME";
    public static final String party_id_Attr = "party_id";
    public static final String party_id_Field = "PARTY_ID";
    public static final String party_id_QFielld = "FINMATERIALS.PARTY_ID";
    public static final String doc_num_Attr = "doc_num";
    public static final String doc_num_Field = "DOC_NUM";
    public static final String doc_num_QFielld = "FINMATERIALS.DOC_NUM";
    public static final String partner_Attr = "partner";
    public static final String partner_Field = "PARTNER";
    public static final String partner_QFielld = "FINMATERIALS.PARTNER";
    public static final String partner_name_Attr = "partner_name";
    public static final String partner_name_Field = "PARTNER_NAME";
    public static final String partner_name_QFielld = "FINMATERIALS.PARTNER_NAME";
    public static final String doc_date_Attr = "doc_date";
    public static final String doc_date_Field = "DOC_DATE";
    public static final String doc_date_QFielld = "FINMATERIALS.DOC_DATE";
    public static final String party_discription_Attr = "party_discription";
    public static final String party_discription_Field = "PARTY_DISCRIPTION";
    public static final String party_discription_QFielld = "FINMATERIALS.PARTY_DISCRIPTION";
    public static final String rest_purpose_id_Attr = "rest_purpose_id";
    public static final String rest_purpose_id_Field = "REST_PURPOSE_ID";
    public static final String rest_purpose_id_QFielld = "FINMATERIALS.REST_PURPOSE_ID";
    public static final String rest_purpose_name_Attr = "rest_purpose_name";
    public static final String rest_purpose_name_Field = "REST_PURPOSE_NAME";
    public static final String rest_purpose_name_QFielld = "FINMATERIALS.REST_PURPOSE_NAME";
    public static final String rest_purpose_type_id_Attr = "rest_purpose_type_id";
    public static final String rest_purpose_type_id_Field = "REST_PURPOSE_TYPE_ID";
    public static final String rest_purpose_type_id_QFielld = "FINMATERIALS.REST_PURPOSE_TYPE_ID";
    public static final String budget_core_id_Attr = "budget_core_id";
    public static final String budget_core_id_Field = "BUDGET_CORE_ID";
    public static final String budget_core_id_QFielld = "FINMATERIALS.BUDGET_CORE_ID";
    public static final String frc_code_Attr = "frc_code";
    public static final String frc_code_Field = "FRC_CODE";
    public static final String frc_code_QFielld = "FINMATERIALS.FRC_CODE";
    public static final String frc_name_Attr = "frc_name";
    public static final String frc_name_Field = "FRC_NAME";
    public static final String frc_name_QFielld = "FINMATERIALS.FRC_NAME";
    public static final String calc_price_Attr = "calc_price";
    public static final String calc_price_Field = "CALC_PRICE";
    public static final String calc_price_QFielld = "FINMATERIALS.CALC_PRICE";
    public static final String quantity_Attr = "quantity";
    public static final String quantity_Field = "QUANTITY";
    public static final String quantity_QFielld = "FINMATERIALS.QUANTITY";
    public static final String price_Attr = "price";
    public static final String price_Field = "PRICE";
    public static final String price_QFielld = "FINMATERIALS.PRICE";
    public static final String cost_Attr = "cost";
    public static final String cost_Field = "COST";
    public static final String cost_QFielld = "FINMATERIALS.COST";
    public static final String bal_sch_Attr = "bal_sch";
    public static final String bal_sch_Field = "BAL_SCH";
    public static final String bal_sch_QFielld = "FINMATERIALS.BAL_SCH";
    public static final String fullQuantity_Attr = "fullQuantity";
    public static final String fullQuantity_Field = "FULLQUANTITY";
    public static final String fullQuantity_QFielld = "FINMATERIALS.FULLQUANTITY";
    public static final String fullCost_Attr = "fullCost";
    public static final String fullCost_Field = "FULLCOST";
    public static final String fullCost_QFielld = "FINMATERIALS.FULLCOST";
    public static final String finDocItemCode_Attr = "finDocItemCode";
    public static final String finDocItemCode_Field = "FINDOCITEMCODE";
    public static final String finDocItemCode_QFielld = "FINMATERIALS.FINDOCITEMCODE";
    public static final String wear_date_Attr = "wear_date";
    public static final String wear_date_Field = "WEAR_DATE";
    public static final String wear_date_QFielld = "FINMATERIALS.WEAR_DATE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "FINMATERIALS.MODIFY_TIME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "FINMATERIALS.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "FINMATERIALS.DATEEDIT";
    public static final String oldCode_Attr = "oldCode";
    public static final String oldCode_Field = "OLDCODE";
    public static final String oldCode_QFielld = "FINMATERIALS.OLDCODE";
    public static final String extra_cargo_Attr = "extra_cargo";
    public static final String extra_cargo_Field = "EXTRA_CARGO";
    public static final String extra_cargo_QFielld = "FINMATERIALS.EXTRA_CARGO";
    public static final String cost_ext_Attr = "cost_ext";
    public static final String cost_ext_Field = "COST_EXT";
    public static final String cost_ext_QFielld = "FINMATERIALS.COST_EXT";
    public static final String extra_cargo_nds_Attr = "extra_cargo_nds";
    public static final String extra_cargo_nds_Field = "EXTRA_CARGO_NDS";
    public static final String extra_cargo_nds_QFielld = "FINMATERIALS.EXTRA_CARGO_NDS";
    public static final String cost_ext_nds_Attr = "cost_ext_nds";
    public static final String cost_ext_nds_Field = "COST_EXT_NDS";
    public static final String cost_ext_nds_QFielld = "FINMATERIALS.COST_EXT_NDS";
    public static final String ax_party_id_Attr = "ax_party_id";
    public static final String ax_party_id_Field = "AX_PARTY_ID";
    public static final String ax_party_id_QFielld = "FINMATERIALS.AX_PARTY_ID";
    public static final String ax_rest_purpose_id_Attr = "ax_rest_purpose_id";
    public static final String ax_rest_purpose_id_Field = "AX_REST_PURPOSE_ID";
    public static final String ax_rest_purpose_id_QFielld = "FINMATERIALS.AX_REST_PURPOSE_ID";
    public static final String ax_rest_purpose_typeid_Attr = "ax_rest_purpose_typeid";
    public static final String ax_rest_purpose_typeid_Field = "AX_REST_PURPOSE_TYPEID";
    public static final String ax_rest_purpose_typeid_QFielld = "FINMATERIALS.AX_REST_PURPOSE_TYPEID";
    public static final String ax_frc_code_Attr = "ax_frc_code";
    public static final String ax_frc_code_Field = "AX_FRC_CODE";
    public static final String ax_frc_code_QFielld = "FINMATERIALS.AX_FRC_CODE";
    public static final String ax_inv_posted_qty_unit_Attr = "ax_inv_posted_qty_unit";
    public static final String ax_inv_posted_qty_unit_Field = "AX_INV_POSTED_QTY_UNIT";
    public static final String ax_inv_posted_qty_unit_QFielld = "FINMATERIALS.AX_INV_POSTED_QTY_UNIT";
    public static final String ax_inv_deducted_unit_Attr = "ax_inv_deducted_unit";
    public static final String ax_inv_deducted_unit_Field = "AX_INV_DEDUCTED_UNIT";
    public static final String ax_inv_deducted_unit_QFielld = "FINMATERIALS.AX_INV_DEDUCTED_UNIT";
    public static final String ax_inv_received_unit_Attr = "ax_inv_received_unit";
    public static final String ax_inv_received_unit_Field = "AX_INV_RECEIVED_UNIT";
    public static final String ax_inv_received_unit_QFielld = "FINMATERIALS.AX_INV_RECEIVED_UNIT";
    public static final String ax_inv_reserv_phys_unit_Attr = "ax_inv_reserv_phys_unit";
    public static final String ax_inv_reserv_phys_unit_Field = "AX_INV_RESERV_PHYS_UNIT";
    public static final String ax_inv_reserv_phys_unit_QFielld = "FINMATERIALS.AX_INV_RESERV_PHYS_UNT";
    public static final String ax_inv_avail_phys_unit_Attr = "ax_inv_avail_phys_unit";
    public static final String ax_inv_avail_phys_unit_Field = "AX_INV_AVAIL_PHYS_UNIT";
    public static final String ax_inv_avail_phys_unit_QFielld = "FINMATERIALS.AX_INV_AVAIL_PHYS_UNIT";
    public static final String ax_inv_physical_value_Attr = "ax_inv_physical_value";
    public static final String ax_inv_physical_value_Field = "AX_INV_PHYSICAL_VALUE";
    public static final String ax_inv_physical_value_QFielld = "FINMATERIALS.AX_INV_PHYSICAL_VALUE";
    public static final String ax_inv_posted_value_Attr = "ax_inv_posted_value";
    public static final String ax_inv_posted_value_Field = "AX_INV_POSTED_VALUE";
    public static final String ax_inv_posted_value_QFielld = "FINMATERIALS.AX_INV_POSTED_VALUE";
    public static final String axInventTransferLinesCode_Attr = "axInventTransferLinesCode";
    public static final String axInventTransferLinesCode_Field = "AXINVENTTRANSFERLINESCODE";
    public static final String axInventTransferLinesCode_QFielld = "FINMATERIALS.AXINVENTTRANSFERLINSCD";
    public static final String axInventDimFinId_Attr = "axInventDimFinId";
    public static final String axInventDimFinId_Field = "AXINVENTDIMFINID";
    public static final String axInventDimFinId_QFielld = "FINMATERIALS.AXINVENTDIMFINID";
    public static final String axFactor_Attr = "axFactor";
    public static final String axFactor_Field = "AXFACTOR";
    public static final String axFactor_QFielld = "FINMATERIALS.AXFACTOR";
    public static final String estimateItemRef_Attr = "estimateItemRef";
    public static final String estimateItemRef_Field = "ESTIMATEITEMREFCODE";
    public static final String  estimateItemRef_QFielld = "FINMATERIALS.ESTIMATEITEMREFCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "FINMATERIALS.STATUSREFCODE";
    public static final String molDataRef_Attr = "molDataRef";
    public static final String molDataRef_Field = "MOLDATAREFCODE";
    public static final String  molDataRef_QFielld = "FINMATERIALS.MOLDATAREFCODE";
    public static final String parentRef_Attr = "parentRef";
    public static final String parentRef_Field = "PARENTREFCODE";
    public static final String  parentRef_QFielld = "FINMATERIALS.PARENTREFCODE";

    public static BigDecimal getConvertedQuantity(FINMaterials object)
    {
        BigDecimal axFactor = new BigDecimal(1);
        if (object.axFactor != null && object.axFactor.compareTo(new BigDecimal(0)) > 0)
        {
        	axFactor = object.axFactor;
        }
        
        BigDecimal convertedQuantity = object.quantity.divide(axFactor, 6, RoundingMode.HALF_UP); 
        System.out.println("$$$ FINMaterials convertedQuantity: " + convertedQuantity);
        
        return convertedQuantity;
    }

    public static BigDecimal getConvertedQuantity(FINMaterialsShort object)
    {
        BigDecimal axFactor = new BigDecimal(1);
        if (object.axFactor != null && object.axFactor.compareTo(new BigDecimal(0)) > 0)
        {
        	axFactor = object.axFactor;
        }
        
        BigDecimal convertedQuantity = object.quantity.divide(axFactor, 6, RoundingMode.HALF_UP);
        System.out.println("$$$ FINMaterials convertedQuantity: " + convertedQuantity);
        
        return convertedQuantity;
    }
    
    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setMat_id(int aValue){
       mat_id = aValue;
    }

    public int getMat_id(){
       return mat_id;
    }


    public void setNn(String aValue){
       nn = aValue;
    }

    public String getNn(){
       return nn;
    }


    public void setMat_name(String aValue){
       mat_name = aValue;
    }

    public String getMat_name(){
       return mat_name;
    }


    public void setMu_id(int aValue){
       mu_id = aValue;
    }

    public int getMu_id(){
       return mu_id;
    }


    public void setMu_name(String aValue){
       mu_name = aValue;
    }

    public String getMu_name(){
       return mu_name;
    }


    public void setDiv_code(String aValue){
       div_code = aValue;
    }

    public String getDiv_code(){
       return div_code;
    }


    public void setDiv_name(String aValue){
       div_name = aValue;
    }

    public String getDiv_name(){
       return div_name;
    }


    public void setParty_id(int aValue){
       party_id = aValue;
    }

    public int getParty_id(){
       return party_id;
    }


    public void setDoc_num(String aValue){
       doc_num = aValue;
    }

    public String getDoc_num(){
       return doc_num;
    }


    public void setPartner(String aValue){
       partner = aValue;
    }

    public String getPartner(){
       return partner;
    }


    public void setPartner_name(String aValue){
       partner_name = aValue;
    }

    public String getPartner_name(){
       return partner_name;
    }


    public void setDoc_date(Date aValue){
       doc_date = aValue;
    }

    public Date getDoc_date(){
       return doc_date;
    }


    public void setParty_discription(String aValue){
       party_discription = aValue;
    }

    public String getParty_discription(){
       return party_discription;
    }


    public void setRest_purpose_id(int aValue){
       rest_purpose_id = aValue;
    }

    public int getRest_purpose_id(){
       return rest_purpose_id;
    }


    public void setRest_purpose_name(String aValue){
       rest_purpose_name = aValue;
    }

    public String getRest_purpose_name(){
       return rest_purpose_name;
    }


    public void setRest_purpose_type_id(int aValue){
       rest_purpose_type_id = aValue;
    }

    public int getRest_purpose_type_id(){
       return rest_purpose_type_id;
    }


    public void setBudget_core_id(int aValue){
       budget_core_id = aValue;
    }

    public int getBudget_core_id(){
       return budget_core_id;
    }


    public void setFrc_code(int aValue){
       frc_code = aValue;
    }

    public int getFrc_code(){
       return frc_code;
    }


    public void setFrc_name(String aValue){
       frc_name = aValue;
    }

    public String getFrc_name(){
       return frc_name;
    }


    public void setCalc_price(BigDecimal aValue){
       calc_price = aValue;
    }

    public BigDecimal getCalc_price(){
       return calc_price;
    }


    public void setQuantity(BigDecimal aValue){
       quantity = aValue;
    }

    public BigDecimal getQuantity(){
       return quantity;
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


    public void setBal_sch(String aValue){
       bal_sch = aValue;
    }

    public String getBal_sch(){
       return bal_sch;
    }


    public void setFullQuantity(BigDecimal aValue){
       fullQuantity = aValue;
    }

    public BigDecimal getFullQuantity(){
       return fullQuantity;
    }


    public void setFullCost(BigDecimal aValue){
       fullCost = aValue;
    }

    public BigDecimal getFullCost(){
       return fullCost;
    }


    public void setFinDocItemCode(int aValue){
       finDocItemCode = aValue;
    }

    public int getFinDocItemCode(){
       return finDocItemCode;
    }


    public void setWear_date(Date aValue){
       wear_date = aValue;
    }

    public Date getWear_date(){
       return wear_date;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
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


    public void setOldCode(int aValue){
       oldCode = aValue;
    }

    public int getOldCode(){
       return oldCode;
    }


    public void setExtra_cargo(BigDecimal aValue){
       extra_cargo = aValue;
    }

    public BigDecimal getExtra_cargo(){
       return extra_cargo;
    }


    public void setCost_ext(BigDecimal aValue){
       cost_ext = aValue;
    }

    public BigDecimal getCost_ext(){
       return cost_ext;
    }


    public void setExtra_cargo_nds(BigDecimal aValue){
       extra_cargo_nds = aValue;
    }

    public BigDecimal getExtra_cargo_nds(){
       return extra_cargo_nds;
    }


    public void setCost_ext_nds(BigDecimal aValue){
       cost_ext_nds = aValue;
    }

    public BigDecimal getCost_ext_nds(){
       return cost_ext_nds;
    }


    public void setAx_party_id(String aValue){
       ax_party_id = aValue;
    }

    public String getAx_party_id(){
       return ax_party_id;
    }


    public void setAx_rest_purpose_id(String aValue){
       ax_rest_purpose_id = aValue;
    }

    public String getAx_rest_purpose_id(){
       return ax_rest_purpose_id;
    }


    public void setAx_rest_purpose_typeid(String aValue){
       ax_rest_purpose_typeid = aValue;
    }

    public String getAx_rest_purpose_typeid(){
       return ax_rest_purpose_typeid;
    }


    public void setAx_frc_code(String aValue){
       ax_frc_code = aValue;
    }

    public String getAx_frc_code(){
       return ax_frc_code;
    }


    public void setAx_inv_posted_qty_unit(BigDecimal aValue){
       ax_inv_posted_qty_unit = aValue;
    }

    public BigDecimal getAx_inv_posted_qty_unit(){
       return ax_inv_posted_qty_unit;
    }


    public void setAx_inv_deducted_unit(BigDecimal aValue){
       ax_inv_deducted_unit = aValue;
    }

    public BigDecimal getAx_inv_deducted_unit(){
       return ax_inv_deducted_unit;
    }


    public void setAx_inv_received_unit(BigDecimal aValue){
       ax_inv_received_unit = aValue;
    }

    public BigDecimal getAx_inv_received_unit(){
       return ax_inv_received_unit;
    }


    public void setAx_inv_reserv_phys_unit(BigDecimal aValue){
       ax_inv_reserv_phys_unit = aValue;
    }

    public BigDecimal getAx_inv_reserv_phys_unit(){
       return ax_inv_reserv_phys_unit;
    }


    public void setAx_inv_avail_phys_unit(BigDecimal aValue){
       ax_inv_avail_phys_unit = aValue;
    }

    public BigDecimal getAx_inv_avail_phys_unit(){
       return ax_inv_avail_phys_unit;
    }


    public void setAx_inv_physical_value(BigDecimal aValue){
       ax_inv_physical_value = aValue;
    }

    public BigDecimal getAx_inv_physical_value(){
       return ax_inv_physical_value;
    }


    public void setAx_inv_posted_value(BigDecimal aValue){
       ax_inv_posted_value = aValue;
    }

    public BigDecimal getAx_inv_posted_value(){
       return ax_inv_posted_value;
    }


    public void setAxInventTransferLinesCode(String aValue){
       axInventTransferLinesCode = aValue;
    }

    public String getAxInventTransferLinesCode(){
       return axInventTransferLinesCode;
    }


    public void setAxInventDimFinId(String aValue){
       axInventDimFinId = aValue;
    }

    public String getAxInventDimFinId(){
       return axInventDimFinId;
    }


    public void setAxFactor(BigDecimal aValue){
       axFactor = aValue;
    }

    public BigDecimal getAxFactor(){
       return axFactor;
    }

    public void setEstimateItemRef(ENEstimateItemRef aValue){
       estimateItemRef = aValue;
    }

    public ENEstimateItemRef getEstimateItemRef(){
       return estimateItemRef;
    }
    public void setStatusRef(FINMaterialsStatusRef aValue){
       statusRef = aValue;
    }

    public FINMaterialsStatusRef getStatusRef(){
       return statusRef;
    }
    public void setMolDataRef(FINMolDataRef aValue){
       molDataRef = aValue;
    }

    public FINMolDataRef getMolDataRef(){
       return molDataRef;
    }
    public void setParentRef(FINMaterialsRef aValue){
       parentRef = aValue;
    }

    public FINMaterialsRef getParentRef(){
       return parentRef;
    }

} // end of FINMaterialsValueObject

