unit FINMaterialsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENEstimateItemController
   ,FINMaterialsStatusController
   ,FINMolDataController
   //,FINMaterialsController
;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"
  // !:date            - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"

  FINMaterials            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINMaterialsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINMaterials = class(TRemotable)
  private
    Fcode : Integer;
    Fmat_id : Integer;
    Fnn : WideString;
    Fmat_name : WideString;
    Fmu_id : Integer;
    Fmu_name : WideString;
    Fdiv_code : WideString;
    Fdiv_name : WideString;
    Fparty_id : Integer;
    Fdoc_num : WideString;
    Fpartner : WideString;
    Fpartner_name : WideString;
    Fdoc_date : TXSDate;
    Fparty_discription : WideString;
    Frest_purpose_id : Integer;
    Frest_purpose_name : WideString;
    Frest_purpose_type_id : Integer;
    Fbudget_core_id : Integer;
    Ffrc_code : Integer;
    Ffrc_name : WideString;
    Fcalc_price : TXSDecimal;
    Fquantity : TXSDecimal;
    Fprice : TXSDecimal;
    Fcost : TXSDecimal;
    Fbal_sch : WideString;
    FfullQuantity : TXSDecimal;
    FfullCost : TXSDecimal;
    FfinDocItemCode : Integer;
    Fwear_date : TXSDate;
    Fmodify_time : Int64;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FoldCode : Integer;
    Fextra_cargo : TXSDecimal;
    Fcost_ext : TXSDecimal;
    Fextra_cargo_nds : TXSDecimal;
    Fcost_ext_nds : TXSDecimal;
    Fax_party_id : WideString;
    Fax_rest_purpose_id : WideString;
    Fax_rest_purpose_typeid : WideString;
    Fax_frc_code : WideString;
    Fax_inv_posted_qty_unit : TXSDecimal;
    Fax_inv_deducted_unit : TXSDecimal;
    Fax_inv_received_unit : TXSDecimal;
    Fax_inv_reserv_phys_unit : TXSDecimal;
    Fax_inv_avail_phys_unit : TXSDecimal;
    Fax_inv_physical_value : TXSDecimal;
    Fax_inv_posted_value : TXSDecimal;
    FaxInventTransferLinesCode : WideString;
    FaxInventDimFinId : WideString;
    FaxFactor : TXSDecimal;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FstatusRef : FINMaterialsStatusRef;
//???
    FmolDataRef : FINMolDataRef;
//???
    FparentRef : FINMaterialsRef;



  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  mat_id : Integer read Fmat_id write Fmat_id;
    property nn : WideString read Fnn write Fnn;
    property mat_name : WideString read Fmat_name write Fmat_name;
    property  mu_id : Integer read Fmu_id write Fmu_id;
    property mu_name : WideString read Fmu_name write Fmu_name;
    property div_code : WideString read Fdiv_code write Fdiv_code;
    property div_name : WideString read Fdiv_name write Fdiv_name;
    property  party_id : Integer read Fparty_id write Fparty_id;
    property doc_num : WideString read Fdoc_num write Fdoc_num;
    property partner : WideString read Fpartner write Fpartner;
    property partner_name : WideString read Fpartner_name write Fpartner_name;
    property doc_date : TXSDate read Fdoc_date write Fdoc_date;
    property party_discription : WideString read Fparty_discription write Fparty_discription;
    property  rest_purpose_id : Integer read Frest_purpose_id write Frest_purpose_id;
    property rest_purpose_name : WideString read Frest_purpose_name write Frest_purpose_name;
    property  rest_purpose_type_id : Integer read Frest_purpose_type_id write Frest_purpose_type_id;
    property  budget_core_id : Integer read Fbudget_core_id write Fbudget_core_id;
    property  frc_code : Integer read Ffrc_code write Ffrc_code;
    property frc_name : WideString read Ffrc_name write Ffrc_name;
    property calc_price : TXSDecimal read Fcalc_price write Fcalc_price;
    property quantity : TXSDecimal read Fquantity write Fquantity;
    property price : TXSDecimal read Fprice write Fprice;
    property cost : TXSDecimal read Fcost write Fcost;
    property bal_sch : WideString read Fbal_sch write Fbal_sch;
    property fullQuantity : TXSDecimal read FfullQuantity write FfullQuantity;
    property fullCost : TXSDecimal read FfullCost write FfullCost;
    property  finDocItemCode : Integer read FfinDocItemCode write FfinDocItemCode;
    property wear_date : TXSDate read Fwear_date write Fwear_date;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property  oldCode : Integer read FoldCode write FoldCode;
    property extra_cargo : TXSDecimal read Fextra_cargo write Fextra_cargo;
    property cost_ext : TXSDecimal read Fcost_ext write Fcost_ext;
    property extra_cargo_nds : TXSDecimal read Fextra_cargo_nds write Fextra_cargo_nds;
    property cost_ext_nds : TXSDecimal read Fcost_ext_nds write Fcost_ext_nds;
    property ax_party_id : WideString read Fax_party_id write Fax_party_id;
    property ax_rest_purpose_id : WideString read Fax_rest_purpose_id write Fax_rest_purpose_id;
    property ax_rest_purpose_typeid : WideString read Fax_rest_purpose_typeid write Fax_rest_purpose_typeid;
    property ax_frc_code : WideString read Fax_frc_code write Fax_frc_code;
    property ax_inv_posted_qty_unit : TXSDecimal read Fax_inv_posted_qty_unit write Fax_inv_posted_qty_unit;
    property ax_inv_deducted_unit : TXSDecimal read Fax_inv_deducted_unit write Fax_inv_deducted_unit;
    property ax_inv_received_unit : TXSDecimal read Fax_inv_received_unit write Fax_inv_received_unit;
    property ax_inv_reserv_phys_unit : TXSDecimal read Fax_inv_reserv_phys_unit write Fax_inv_reserv_phys_unit;
    property ax_inv_avail_phys_unit : TXSDecimal read Fax_inv_avail_phys_unit write Fax_inv_avail_phys_unit;
    property ax_inv_physical_value : TXSDecimal read Fax_inv_physical_value write Fax_inv_physical_value;
    property ax_inv_posted_value : TXSDecimal read Fax_inv_posted_value write Fax_inv_posted_value;
    property axInventTransferLinesCode : WideString read FaxInventTransferLinesCode write FaxInventTransferLinesCode;
    property axInventDimFinId : WideString read FaxInventDimFinId write FaxInventDimFinId;
    property axFactor : TXSDecimal read FaxFactor write FaxFactor;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
    property statusRef : FINMaterialsStatusRef read FstatusRef write FstatusRef;
    property molDataRef : FINMolDataRef read FmolDataRef write FmolDataRef;
    property parentRef : FINMaterialsRef read FparentRef write FparentRef;


  end;

{
  FINMaterialsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fmat_id : Integer;
    Fnn : WideString;
    Fmat_name : WideString;
    Fmu_id : Integer;
    Fmu_name : WideString;
    Fdiv_code : WideString;
    Fdiv_name : WideString;
    Fparty_id : Integer;
    Fdoc_num : WideString;
    Fpartner : WideString;
    Fpartner_name : WideString;
    Fdoc_date : TXSDate;
    Fparty_discription : WideString;
    Frest_purpose_id : Integer;
    Frest_purpose_name : WideString;
    Frest_purpose_type_id : Integer;
    Fbudget_core_id : Integer;
    Ffrc_code : Integer;
    Ffrc_name : WideString;
    Fcalc_price : TXSDecimal;
    Fquantity : TXSDecimal;
    Fprice : TXSDecimal;
    Fcost : TXSDecimal;
    Fbal_sch : WideString;
    FfullQuantity : TXSDecimal;
    FfullCost : TXSDecimal;
    FfinDocItemCode : Integer;
    Fwear_date : TXSDate;
    Fmodify_time : Int64;
    FuserGen : WideString;
    FdateEdit : DateTime;
    FoldCode : Integer;
    Fextra_cargo : TXSDecimal;
    Fcost_ext : TXSDecimal;
    Fextra_cargo_nds : TXSDecimal;
    Fcost_ext_nds : TXSDecimal;
    Fax_party_id : WideString;
    Fax_rest_purpose_id : WideString;
    Fax_rest_purpose_typeid : WideString;
    Fax_frc_code : WideString;
    Fax_inv_posted_qty_unit : TXSDecimal;
    Fax_inv_deducted_unit : TXSDecimal;
    Fax_inv_received_unit : TXSDecimal;
    Fax_inv_reserv_phys_unit : TXSDecimal;
    Fax_inv_avail_phys_unit : TXSDecimal;
    Fax_inv_physical_value : TXSDecimal;
    Fax_inv_posted_value : TXSDecimal;
    FaxInventTransferLinesCode : WideString;
    FaxInventDimFinId : WideString;
    FaxFactor : TXSDecimal;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FstatusRef : FINMaterialsStatusRef;
//???
    FmolDataRef : FINMolDataRef;
//???
    FparentRef : FINMaterialsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  mat_id : Integer read Fmat_id write Fmat_id;
    property nn : WideString read Fnn write Fnn;
    property mat_name : WideString read Fmat_name write Fmat_name;
    property  mu_id : Integer read Fmu_id write Fmu_id;
    property mu_name : WideString read Fmu_name write Fmu_name;
    property div_code : WideString read Fdiv_code write Fdiv_code;
    property div_name : WideString read Fdiv_name write Fdiv_name;
    property  party_id : Integer read Fparty_id write Fparty_id;
    property doc_num : WideString read Fdoc_num write Fdoc_num;
    property partner : WideString read Fpartner write Fpartner;
    property partner_name : WideString read Fpartner_name write Fpartner_name;
    property doc_date : TXSDate read Fdoc_date write Fdoc_date;
    property party_discription : WideString read Fparty_discription write Fparty_discription;
    property  rest_purpose_id : Integer read Frest_purpose_id write Frest_purpose_id;
    property rest_purpose_name : WideString read Frest_purpose_name write Frest_purpose_name;
    property  rest_purpose_type_id : Integer read Frest_purpose_type_id write Frest_purpose_type_id;
    property  budget_core_id : Integer read Fbudget_core_id write Fbudget_core_id;
    property  frc_code : Integer read Ffrc_code write Ffrc_code;
    property frc_name : WideString read Ffrc_name write Ffrc_name;
    property calc_price : TXSDecimal read Fcalc_price write Fcalc_price;
    property quantity : TXSDecimal read Fquantity write Fquantity;
    property price : TXSDecimal read Fprice write Fprice;
    property cost : TXSDecimal read Fcost write Fcost;
    property bal_sch : WideString read Fbal_sch write Fbal_sch;
    property fullQuantity : TXSDecimal read FfullQuantity write FfullQuantity;
    property fullCost : TXSDecimal read FfullCost write FfullCost;
    property  finDocItemCode : Integer read FfinDocItemCode write FfinDocItemCode;
    property wear_date : TXSDate read Fwear_date write Fwear_date;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property  oldCode : Integer read FoldCode write FoldCode;
    property extra_cargo : TXSDecimal read Fextra_cargo write Fextra_cargo;
    property cost_ext : TXSDecimal read Fcost_ext write Fcost_ext;
    property extra_cargo_nds : TXSDecimal read Fextra_cargo_nds write Fextra_cargo_nds;
    property cost_ext_nds : TXSDecimal read Fcost_ext_nds write Fcost_ext_nds;
    property ax_party_id : WideString read Fax_party_id write Fax_party_id;
    property ax_rest_purpose_id : WideString read Fax_rest_purpose_id write Fax_rest_purpose_id;
    property ax_rest_purpose_typeid : WideString read Fax_rest_purpose_typeid write Fax_rest_purpose_typeid;
    property ax_frc_code : WideString read Fax_frc_code write Fax_frc_code;
    property ax_inv_posted_qty_unit : TXSDecimal read Fax_inv_posted_qty_unit write Fax_inv_posted_qty_unit;
    property ax_inv_deducted_unit : TXSDecimal read Fax_inv_deducted_unit write Fax_inv_deducted_unit;
    property ax_inv_received_unit : TXSDecimal read Fax_inv_received_unit write Fax_inv_received_unit;
    property ax_inv_reserv_phys_unit : TXSDecimal read Fax_inv_reserv_phys_unit write Fax_inv_reserv_phys_unit;
    property ax_inv_avail_phys_unit : TXSDecimal read Fax_inv_avail_phys_unit write Fax_inv_avail_phys_unit;
    property ax_inv_physical_value : TXSDecimal read Fax_inv_physical_value write Fax_inv_physical_value;
    property ax_inv_posted_value : TXSDecimal read Fax_inv_posted_value write Fax_inv_posted_value;
    property axInventTransferLinesCode : WideString read FaxInventTransferLinesCode write FaxInventTransferLinesCode;
    property axInventDimFinId : WideString read FaxInventDimFinId write FaxInventDimFinId;
    property axFactor : TXSDecimal read FaxFactor write FaxFactor;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
    property statusRef : FINMaterialsStatusRef read FstatusRef write FstatusRef;
    property molDataRef : FINMolDataRef read FmolDataRef write FmolDataRef;
    property parentRef : FINMaterialsRef read FparentRef write FparentRef;
  end;
}

  FINMaterialsFilter = class(FINMaterials)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  FINMaterialsShort = class(TRemotable)
  private
    Fcode : Integer;
    Fmat_id : Integer;
    Fnn : WideString;
    Fmat_name : WideString;
    Fmu_id : Integer;
    Fmu_name : WideString;
    Fdiv_code : WideString;
    Fdiv_name : WideString;
    Fparty_id : Integer;
    Fdoc_num : WideString;
    Fpartner : WideString;
    Fpartner_name : WideString;
    Fdoc_date : TXSDate;
    Fparty_discription : WideString;
    Frest_purpose_id : Integer;
    Frest_purpose_name : WideString;
    Frest_purpose_type_id : Integer;
    Fbudget_core_id : Integer;
    Ffrc_code : Integer;
    Ffrc_name : WideString;
    Fcalc_price : TXSDecimal;
    Fquantity : TXSDecimal;
    Fprice : TXSDecimal;
    Fcost : TXSDecimal;
    Fbal_sch : WideString;
    FfullQuantity : TXSDecimal;
    FfullCost : TXSDecimal;
    Fwear_date : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fextra_cargo : TXSDecimal;
    Fcost_ext : TXSDecimal;
    Fextra_cargo_nds : TXSDecimal;
    Fcost_ext_nds : TXSDecimal;
    Fax_party_id : WideString;
    Fax_rest_purpose_id : WideString;
    Fax_rest_purpose_typeid : WideString;
    Fax_frc_code : WideString;
    Fax_inv_posted_qty_unit : TXSDecimal;
    Fax_inv_deducted_unit : TXSDecimal;
    Fax_inv_received_unit : TXSDecimal;
    Fax_inv_reserv_phys_unit : TXSDecimal;
    Fax_inv_avail_phys_unit : TXSDecimal;
    Fax_inv_physical_value : TXSDecimal;
    Fax_inv_posted_value : TXSDecimal;
    FaxInventTransferLinesCode : WideString;
    FaxInventDimFinId : WideString;
    FaxFactor : TXSDecimal;
    FestimateItemRefCode : Integer;
    FestimateItemRefCountGen : TXSDecimal;
    FestimateItemRefCountFact : TXSDecimal;
    FestimateItemRefPrice : TXSDecimal;
    FestimateItemRefCost : TXSDecimal;
    FestimateItemRefIsUseVAT : Integer;
    FestimateItemRefDeliveryTime : Integer;
    FestimateItemRefUseWorkTime : Integer;
    FestimateItemRefUserGen : WideString;
    FestimateItemRefDateEdit : TXSDate;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FmolDataRefCode : Integer;
    FmolDataRefFinMolCode : WideString;
    FmolDataRefFinMolName : WideString;
    FparentRefCode : Integer;
    FparentRefMat_id : Integer;
    FparentRefNn : WideString;
    FparentRefMat_name : WideString;
    FparentRefMu_id : Integer;
    FparentRefMu_name : WideString;
    FparentRefDiv_code : WideString;
    FparentRefDiv_name : WideString;
    FparentRefParty_id : Integer;
    FparentRefDoc_num : WideString;
    FparentRefPartner : WideString;
    FparentRefPartner_name : WideString;
    FparentRefDoc_date : TXSDate;
    FparentRefParty_discription : WideString;
    FparentRefRest_purpose_id : Integer;
    FparentRefRest_purpose_name : WideString;
    FparentRefRest_purpose_type_id : Integer;
    FparentRefBudget_core_id : Integer;
    FparentRefFrc_code : Integer;
    FparentRefFrc_name : WideString;
    FparentRefCalc_price : TXSDecimal;
    FparentRefQuantity : TXSDecimal;
    FparentRefPrice : TXSDecimal;
    FparentRefCost : TXSDecimal;
    FparentRefBal_sch : WideString;
    FparentRefFullQuantity : TXSDecimal;
    FparentRefFullCost : TXSDecimal;
    FparentRefWear_date : TXSDate;
    FparentRefUserGen : WideString;
    FparentRefDateEdit : TXSDateTime;
    FparentRefExtra_cargo : TXSDecimal;
    FparentRefCost_ext : TXSDecimal;
    FparentRefExtra_cargo_nds : TXSDecimal;
    FparentRefCost_ext_nds : TXSDecimal;
    FparentRefAx_party_id : WideString;
    FparentRefAx_rest_purpose_id : WideString;
    FparentRefAx_rest_purpose_typeid : WideString;
    FparentRefAx_frc_code : WideString;
    FparentRefAx_inv_posted_qty_unit : TXSDecimal;
    FparentRefAx_inv_deducted_unit : TXSDecimal;
    FparentRefAx_inv_received_unit : TXSDecimal;
    FparentRefAx_inv_reserv_phys_unit : TXSDecimal;
    FparentRefAx_inv_avail_phys_unit : TXSDecimal;
    FparentRefAx_inv_physical_value : TXSDecimal;
    FparentRefAx_inv_posted_value : TXSDecimal;
    FparentRefAxInventTransferLinesCode : WideString;
    FparentRefAxInventDimFinId : WideString;
    FparentRefAxFactor : TXSDecimal;

    FestimateItemRefKindCode : Integer;
    FestimateItemRefKindName : WideString;



  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  mat_id : Integer read Fmat_id write Fmat_id;
    property nn : WideString read Fnn write Fnn;
    property mat_name : WideString read Fmat_name write Fmat_name;
    property  mu_id : Integer read Fmu_id write Fmu_id;
    property mu_name : WideString read Fmu_name write Fmu_name;
    property div_code : WideString read Fdiv_code write Fdiv_code;
    property div_name : WideString read Fdiv_name write Fdiv_name;
    property  party_id : Integer read Fparty_id write Fparty_id;
    property doc_num : WideString read Fdoc_num write Fdoc_num;
    property partner : WideString read Fpartner write Fpartner;
    property partner_name : WideString read Fpartner_name write Fpartner_name;
    property doc_date : TXSDate read Fdoc_date write Fdoc_date;
    property party_discription : WideString read Fparty_discription write Fparty_discription;
    property  rest_purpose_id : Integer read Frest_purpose_id write Frest_purpose_id;
    property rest_purpose_name : WideString read Frest_purpose_name write Frest_purpose_name;
    property  rest_purpose_type_id : Integer read Frest_purpose_type_id write Frest_purpose_type_id;
    property  budget_core_id : Integer read Fbudget_core_id write Fbudget_core_id;
    property  frc_code : Integer read Ffrc_code write Ffrc_code;
    property frc_name : WideString read Ffrc_name write Ffrc_name;
    property calc_price : TXSDecimal read Fcalc_price write Fcalc_price;
    property quantity : TXSDecimal read Fquantity write Fquantity;
    property price : TXSDecimal read Fprice write Fprice;
    property cost : TXSDecimal read Fcost write Fcost;
    property bal_sch : WideString read Fbal_sch write Fbal_sch;
    property fullQuantity : TXSDecimal read FfullQuantity write FfullQuantity;
    property fullCost : TXSDecimal read FfullCost write FfullCost;
    property wear_date : TXSDate read Fwear_date write Fwear_date;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property extra_cargo : TXSDecimal read Fextra_cargo write Fextra_cargo;
    property cost_ext : TXSDecimal read Fcost_ext write Fcost_ext;
    property extra_cargo_nds : TXSDecimal read Fextra_cargo_nds write Fextra_cargo_nds;
    property cost_ext_nds : TXSDecimal read Fcost_ext_nds write Fcost_ext_nds;
    property ax_party_id : WideString read Fax_party_id write Fax_party_id;
    property ax_rest_purpose_id : WideString read Fax_rest_purpose_id write Fax_rest_purpose_id;
    property ax_rest_purpose_typeid : WideString read Fax_rest_purpose_typeid write Fax_rest_purpose_typeid;
    property ax_frc_code : WideString read Fax_frc_code write Fax_frc_code;
    property ax_inv_posted_qty_unit : TXSDecimal read Fax_inv_posted_qty_unit write Fax_inv_posted_qty_unit;
    property ax_inv_deducted_unit : TXSDecimal read Fax_inv_deducted_unit write Fax_inv_deducted_unit;
    property ax_inv_received_unit : TXSDecimal read Fax_inv_received_unit write Fax_inv_received_unit;
    property ax_inv_reserv_phys_unit : TXSDecimal read Fax_inv_reserv_phys_unit write Fax_inv_reserv_phys_unit;
    property ax_inv_avail_phys_unit : TXSDecimal read Fax_inv_avail_phys_unit write Fax_inv_avail_phys_unit;
    property ax_inv_physical_value : TXSDecimal read Fax_inv_physical_value write Fax_inv_physical_value;
    property ax_inv_posted_value : TXSDecimal read Fax_inv_posted_value write Fax_inv_posted_value;
    property axInventTransferLinesCode : WideString read FaxInventTransferLinesCode write FaxInventTransferLinesCode;
    property axInventDimFinId : WideString read FaxInventDimFinId write FaxInventDimFinId;
    property axFactor : TXSDecimal read FaxFactor write FaxFactor;

    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode;
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen;
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact;
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice;
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost;
    property estimateItemRefIsUseVAT : Integer read FestimateItemRefIsUseVAT write FestimateItemRefIsUseVAT;
    property estimateItemRefDeliveryTime : Integer read FestimateItemRefDeliveryTime write FestimateItemRefDeliveryTime;
    property estimateItemRefUseWorkTime : Integer read FestimateItemRefUseWorkTime write FestimateItemRefUseWorkTime;
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen;
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property molDataRefCode : Integer read FmolDataRefCode write FmolDataRefCode;
    property molDataRefFinMolCode : WideString read FmolDataRefFinMolCode write FmolDataRefFinMolCode;
    property molDataRefFinMolName : WideString read FmolDataRefFinMolName write FmolDataRefFinMolName;
    property parentRefCode : Integer read FparentRefCode write FparentRefCode;
    property parentRefMat_id : Integer read FparentRefMat_id write FparentRefMat_id;
    property parentRefNn : WideString read FparentRefNn write FparentRefNn;
    property parentRefMat_name : WideString read FparentRefMat_name write FparentRefMat_name;
    property parentRefMu_id : Integer read FparentRefMu_id write FparentRefMu_id;
    property parentRefMu_name : WideString read FparentRefMu_name write FparentRefMu_name;
    property parentRefDiv_code : WideString read FparentRefDiv_code write FparentRefDiv_code;
    property parentRefDiv_name : WideString read FparentRefDiv_name write FparentRefDiv_name;
    property parentRefParty_id : Integer read FparentRefParty_id write FparentRefParty_id;
    property parentRefDoc_num : WideString read FparentRefDoc_num write FparentRefDoc_num;
    property parentRefPartner : WideString read FparentRefPartner write FparentRefPartner;
    property parentRefPartner_name : WideString read FparentRefPartner_name write FparentRefPartner_name;
    property parentRefDoc_date : TXSDate read FparentRefDoc_date write FparentRefDoc_date;
    property parentRefParty_discription : WideString read FparentRefParty_discription write FparentRefParty_discription;
    property parentRefRest_purpose_id : Integer read FparentRefRest_purpose_id write FparentRefRest_purpose_id;
    property parentRefRest_purpose_name : WideString read FparentRefRest_purpose_name write FparentRefRest_purpose_name;
    property parentRefRest_purpose_type_id : Integer read FparentRefRest_purpose_type_id write FparentRefRest_purpose_type_id;
    property parentRefBudget_core_id : Integer read FparentRefBudget_core_id write FparentRefBudget_core_id;
    property parentRefFrc_code : Integer read FparentRefFrc_code write FparentRefFrc_code;
    property parentRefFrc_name : WideString read FparentRefFrc_name write FparentRefFrc_name;
    property parentRefCalc_price : TXSDecimal read FparentRefCalc_price write FparentRefCalc_price;
    property parentRefQuantity : TXSDecimal read FparentRefQuantity write FparentRefQuantity;
    property parentRefPrice : TXSDecimal read FparentRefPrice write FparentRefPrice;
    property parentRefCost : TXSDecimal read FparentRefCost write FparentRefCost;
    property parentRefBal_sch : WideString read FparentRefBal_sch write FparentRefBal_sch;
    property parentRefFullQuantity : TXSDecimal read FparentRefFullQuantity write FparentRefFullQuantity;
    property parentRefFullCost : TXSDecimal read FparentRefFullCost write FparentRefFullCost;
    property parentRefWear_date : TXSDate read FparentRefWear_date write FparentRefWear_date;
    property parentRefUserGen : WideString read FparentRefUserGen write FparentRefUserGen;
    property parentRefDateEdit : TXSDateTime read FparentRefDateEdit write FparentRefDateEdit;
    property parentRefExtra_cargo : TXSDecimal read FparentRefExtra_cargo write FparentRefExtra_cargo;
    property parentRefCost_ext : TXSDecimal read FparentRefCost_ext write FparentRefCost_ext;
    property parentRefExtra_cargo_nds : TXSDecimal read FparentRefExtra_cargo_nds write FparentRefExtra_cargo_nds;
    property parentRefCost_ext_nds : TXSDecimal read FparentRefCost_ext_nds write FparentRefCost_ext_nds;
    property parentRefAx_party_id : WideString read FparentRefAx_party_id write FparentRefAx_party_id;
    property parentRefAx_rest_purpose_id : WideString read FparentRefAx_rest_purpose_id write FparentRefAx_rest_purpose_id;
    property parentRefAx_rest_purpose_typeid : WideString read FparentRefAx_rest_purpose_typeid write FparentRefAx_rest_purpose_typeid;
    property parentRefAx_frc_code : WideString read FparentRefAx_frc_code write FparentRefAx_frc_code;
    property parentRefAx_inv_posted_qty_unit : TXSDecimal read FparentRefAx_inv_posted_qty_unit write FparentRefAx_inv_posted_qty_unit;
    property parentRefAx_inv_deducted_unit : TXSDecimal read FparentRefAx_inv_deducted_unit write FparentRefAx_inv_deducted_unit;
    property parentRefAx_inv_received_unit : TXSDecimal read FparentRefAx_inv_received_unit write FparentRefAx_inv_received_unit;
    property parentRefAx_inv_reserv_phys_unit : TXSDecimal read FparentRefAx_inv_reserv_phys_unit write FparentRefAx_inv_reserv_phys_unit;
    property parentRefAx_inv_avail_phys_unit : TXSDecimal read FparentRefAx_inv_avail_phys_unit write FparentRefAx_inv_avail_phys_unit;
    property parentRefAx_inv_physical_value : TXSDecimal read FparentRefAx_inv_physical_value write FparentRefAx_inv_physical_value;
    property parentRefAx_inv_posted_value : TXSDecimal read FparentRefAx_inv_posted_value write FparentRefAx_inv_posted_value;
    property parentRefAxInventTransferLinesCode : WideString read FparentRefAxInventTransferLinesCode write FparentRefAxInventTransferLinesCode;
    property parentRefAxInventDimFinId : WideString read FparentRefAxInventDimFinId write FparentRefAxInventDimFinId;
    property parentRefAxFactor : TXSDecimal read FparentRefAxFactor write FparentRefAxFactor;

    property estimateItemRefKindCode : Integer read FestimateItemRefKindCode write FestimateItemRefKindCode;
    property estimateItemRefKindName : WideString read FestimateItemRefKindName write FestimateItemRefKindName;


  end;

  ArrayOfFINMaterialsShort = array of FINMaterialsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }
  ArrayOfFINMaterialsData = array of FINMaterials;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINMaterialsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINMaterialsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINMaterialsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  FINMaterialsList_ = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINMaterialsData;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINMaterialsData read Flist write Flist;
  end;

////////////////////////////////////////////////////////////////////////////////
  ENEstimateItem2FinShort = class(FINMaterials)
  private
    FestimateCode : Integer;
    FestimateCountGen : TXSDecimal;
    FestimateCountFact : TXSDecimal;

    FestimatePrice : TXSDecimal;
    FestimateCost : TXSDecimal;

    FestimateTypeRefCode : Integer;

    FplanRefCode : Integer;
    FplanItemRefCode : Integer;
    FplanItemRefCountGen : TXSDecimal;

    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;

    FmeasureType: WideString;

    FkartaRefCode :Integer;
    FkartaRefName : WideString;
    FkartaNum : WideString;

    FquantityFINMaterials : TXSDecimal;
    FsuggestedQuantity : TXSDecimal;

    Fisobligatory : Integer;

  public
    destructor Destroy; override;
  published
    property estimateCode : Integer read FestimateCode write FestimateCode;
    property estimateCountGen : TXSDecimal read FestimateCountGen write FestimateCountGen;
    property estimateCountFact : TXSDecimal read FestimateCountFact write FestimateCountFact;
    
    property estimatePrice : TXSDecimal read FestimatePrice write FestimatePrice;
    property estimateCost : TXSDecimal read FestimateCost write FestimateCost;

    property estimateTypeRefCode : Integer read FestimateTypeRefCode write FestimateTypeRefCode;

    property planRefCode : Integer read FplanRefCode write FplanRefCode;
    property planItemRefCode : Integer read FplanItemRefCode write FplanItemRefCode;
    property planItemRefCountGen : TXSDecimal read FplanItemRefCountGen write FplanItemRefCountGen;

    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;

    property measureType: WideString read FmeasureType write FmeasureType;

    property kartaRefCode :Integer read FkartaRefCode write FkartaRefCode;
    property kartaRefName : WideString read FkartaRefName write FkartaRefName;
    property kartaNum : WideString read FkartaNum write FkartaNum;

    property quantityFINMaterials : TXSDecimal read FquantityFINMaterials write FquantityFINMaterials;
    property suggestedQuantity : TXSDecimal read FsuggestedQuantity write FsuggestedQuantity;
    property isobligatory : Integer read Fisobligatory write Fisobligatory;
  end;


  ArrayOfENEstimateItem2FinShort = array of ENEstimateItem2FinShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEstimateItem2FinShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateItem2FinShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateItem2FinShort read Flist write Flist;
  end;

////////////////////////////////////////////////////////////////////////////////




  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINMaterialsController/message/
  // soapAction: http://ksoe.org/FINMaterialsController/action/FINMaterialsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINMaterialsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINMaterialsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINMaterialsControllerSoapPort = interface(IInvokable)
  ['{2E0000BF-462E-41C6-830E-F34F330D8EFA}']
    //function  add(const aFINMaterials: FINMaterials): Integer; stdcall;
    //procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINMaterials: FINMaterials); stdcall;
    function getObject(const anObjectCode: Integer): FINMaterials; stdcall;
    function getList: FINMaterialsShortList; stdcall;
    function getFilteredList(const aFINMaterialsFilter: FINMaterialsFilter): FINMaterialsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINMaterialsShortList; stdcall;
    function getScrollableFilteredList(const aFINMaterialsFilter: FINMaterialsFilter; const aFromPosition: Integer; const aQuantity: Integer): FINMaterialsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINMaterialsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aFINMaterialsFilter: FINMaterialsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): FINMaterialsShort; stdcall;


    function  getMaterialsList(const aFINMaterialsFilter: FINMaterialsFilter; const balansNumberCondition: WideString; const molCode : WideString; const materialCondition : WideString; const date : TXSDate; const finDocCode : Integer): FINMaterialsList_; overload; stdcall;
    function  getMaterialsListWithAvar(const aFINMaterialsFilter: FINMaterialsFilter; const balansNumberCondition: WideString; const molCode : WideString; const materialCondition : WideString; const date : TXSDate; const finDocCode : Integer): FINMaterialsList_; overload; stdcall;
    function  getMaterialsList(const aPlanCode: Integer; const aFINMaterialsFilter: FINMaterialsFilter; const balansNumberCondition: WideString; const molCode : WideString; const materialCondition : WideString; const date : TXSDate; const finDocCode : Integer): FINMaterialsList_; overload; stdcall;

    function  getGroupedFilteredList(const aFINMaterialsFilter: FINMaterialsFilter; const aFromPosition: Integer; const aQuantity: Integer): FINMaterialsShortList; stdcall;
    function addMaterials(const aFINMaterials: FINMaterials): Integer; stdcall;
    function addGsm(const aFINMaterials: FINMaterials): Integer; stdcall;

    procedure removeMaterials(const anObjectCode: Integer); stdcall;
    procedure removeGsm(const anObjectCode: Integer); stdcall;

    //function  addOE2REM(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;
    //function  addREM2MOL(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;
    function getFilteredPartyList(const estimateItemCode : Integer) :  FINMaterialsShortList; stdcall;
    function getFilteredPartyListWriteOff(const estimateItemCode : Integer; const codeMol : String) :  FINMaterialsShortList; stdcall;

    function getListForTranzit2Operative(dateStart, dateFinish: TXSDate; budgetCode, departmentCode: Integer; condition: String): FINMaterialsShortList; stdcall;

    procedure setExtraCargo(const NN:WideString ; const newExtraCargo:TXSDecimal) ; stdcall;
    function getExtraCargo(const NN:WideString):TXSDecimal;stdcall;

    //procedure getMegaList(const aPlanCode: Integer; const aMOLCode: String; const aDocDate: TXSDate; const aFinDocCode: Integer); stdcall;
    //function getENEstimateItem2FinShortList(const aPlanCode: Integer; const aMOLCode: String; const aDocDate: TXSDate; const aFinDocCode: Integer): ENEstimateItem2FinShortList; stdcall;
    function getENEstimateItem2FinShortList(const aPlanCode: Integer; const aFinFilter: FINMaterialsFilter; const aMOLCode: String;
        balansNumberCondition: String; materialCondition: String; const aDocDate: TXSDate; const aFinDocCode: Integer): ENEstimateItem2FinShortList; stdcall;

    procedure batchAddMaterials(const aFinList: ArrayOfFINMaterialsData); stdcall;

    procedure setStorageZone(const objects: ArrayOfFINMaterialsData; const storageZoneCode: Integer); stdcall;

    function getShortListWithFinMaterialsForFact(const aENEstimateItemFilter: ENEstimateItemFilter;
        const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItem2FinShortList; stdcall;
  end;

implementation

  destructor FINMaterials.Destroy;
  begin
    if Assigned(Fdoc_date) then
      doc_date.Free;
    if Assigned(Fcalc_price) then
      calc_price.Free;
    if Assigned(Fquantity) then
      quantity.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FfullQuantity) then
      fullQuantity.Free;
    if Assigned(FfullCost) then
      fullCost.Free;
    if Assigned(Fwear_date) then
      wear_date.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fextra_cargo) then
      extra_cargo.Free;
    if Assigned(Fcost_ext) then
      cost_ext.Free;
    if Assigned(Fextra_cargo_nds) then
      extra_cargo_nds.Free;
    if Assigned(Fcost_ext_nds) then
      cost_ext_nds.Free;
    if Assigned(Fax_inv_posted_qty_unit) then
      ax_inv_posted_qty_unit.Free;
    if Assigned(Fax_inv_deducted_unit) then
      ax_inv_deducted_unit.Free;
    if Assigned(Fax_inv_received_unit) then
      ax_inv_received_unit.Free;
    if Assigned(Fax_inv_reserv_phys_unit) then
      ax_inv_reserv_phys_unit.Free;
    if Assigned(Fax_inv_avail_phys_unit) then
      ax_inv_avail_phys_unit.Free;
    if Assigned(Fax_inv_physical_value) then
      ax_inv_physical_value.Free;
    if Assigned(Fax_inv_posted_value) then
      ax_inv_posted_value.Free;
    if Assigned(FaxFactor) then
      axFactor.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FmolDataRef) then
      molDataRef.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    inherited Destroy;
  end;

{
  destructor FINMaterialsFilter.Destroy;
  begin
    if Assigned(Fdoc_date) then
      doc_date.Free;
    if Assigned(Fcalc_price) then
      calc_price.Free;
    if Assigned(Fquantity) then
      quantity.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FfullQuantity) then
      fullQuantity.Free;
    if Assigned(FfullCost) then
      fullCost.Free;
    if Assigned(Fwear_date) then
      wear_date.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fextra_cargo) then
      extra_cargo.Free;
    if Assigned(Fcost_ext) then
      cost_ext.Free;
    if Assigned(Fextra_cargo_nds) then
      extra_cargo_nds.Free;
    if Assigned(Fcost_ext_nds) then
      cost_ext_nds.Free;
    if Assigned(Fax_inv_posted_qty_unit) then
      ax_inv_posted_qty_unit.Free;
    if Assigned(Fax_inv_deducted_unit) then
      ax_inv_deducted_unit.Free;
    if Assigned(Fax_inv_received_unit) then
      ax_inv_received_unit.Free;
    if Assigned(Fax_inv_reserv_phys_unit) then
      ax_inv_reserv_phys_unit.Free;
    if Assigned(Fax_inv_avail_phys_unit) then
      ax_inv_avail_phys_unit.Free;
    if Assigned(Fax_inv_physical_value) then
      ax_inv_physical_value.Free;
    if Assigned(Fax_inv_posted_value) then
      ax_inv_posted_value.Free;
    if Assigned(FaxFactor) then
      axFactor.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FmolDataRef) then
      molDataRef.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    inherited Destroy;
  end;
}

  destructor FINMaterialsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor FINMaterialsShort.Destroy;
  begin
    if Assigned(Fdoc_date) then
      doc_date.Free;
    if Assigned(Fcalc_price) then
      calc_price.Free;
    if Assigned(Fquantity) then
      quantity.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FfullQuantity) then
      fullQuantity.Free;
    if Assigned(FfullCost) then
      fullCost.Free;
    if Assigned(Fwear_date) then
      wear_date.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fextra_cargo) then
      extra_cargo.Free;
    if Assigned(Fcost_ext) then
      cost_ext.Free;
    if Assigned(Fextra_cargo_nds) then
      extra_cargo_nds.Free;
    if Assigned(Fcost_ext_nds) then
      cost_ext_nds.Free;
    if Assigned(Fax_inv_posted_qty_unit) then
      ax_inv_posted_qty_unit.Free;
    if Assigned(Fax_inv_deducted_unit) then
      ax_inv_deducted_unit.Free;
    if Assigned(Fax_inv_received_unit) then
      ax_inv_received_unit.Free;
    if Assigned(Fax_inv_reserv_phys_unit) then
      ax_inv_reserv_phys_unit.Free;
    if Assigned(Fax_inv_avail_phys_unit) then
      ax_inv_avail_phys_unit.Free;
    if Assigned(Fax_inv_physical_value) then
      ax_inv_physical_value.Free;
    if Assigned(Fax_inv_posted_value) then
      ax_inv_posted_value.Free;
    if Assigned(FaxFactor) then
      axFactor.Free;
    if Assigned(FestimateItemRefCountGen) then
      estimateItemRefCountGen.Free;
    if Assigned(FestimateItemRefCountFact) then
      estimateItemRefCountFact.Free;
    if Assigned(FestimateItemRefPrice) then
      estimateItemRefPrice.Free;
    if Assigned(FestimateItemRefCost) then
      estimateItemRefCost.Free;
    if Assigned(FestimateItemRefDateEdit) then
      estimateItemRefDateEdit.Free;
    if Assigned(FparentRefDoc_date) then
      parentRefDoc_date.Free;
    if Assigned(FparentRefCalc_price) then
      parentRefCalc_price.Free;
    if Assigned(FparentRefQuantity) then
      parentRefQuantity.Free;
    if Assigned(FparentRefPrice) then
      parentRefPrice.Free;
    if Assigned(FparentRefCost) then
      parentRefCost.Free;
    if Assigned(FparentRefFullQuantity) then
      parentRefFullQuantity.Free;
    if Assigned(FparentRefFullCost) then
      parentRefFullCost.Free;
    if Assigned(FparentRefWear_date) then
      parentRefWear_date.Free;
    if Assigned(FparentRefDateEdit) then
      parentRefDateEdit.Free;
    if Assigned(FparentRefExtra_cargo) then
      parentRefExtra_cargo.Free;
    if Assigned(FparentRefCost_ext) then
      parentRefCost_ext.Free;
    if Assigned(FparentRefExtra_cargo_nds) then
      parentRefExtra_cargo_nds.Free;
    if Assigned(FparentRefCost_ext_nds) then
      parentRefCost_ext_nds.Free;
    if Assigned(FparentRefAx_inv_posted_qty_unit) then
      parentRefAx_inv_posted_qty_unit.Free;
    if Assigned(FparentRefAx_inv_deducted_unit) then
      parentRefAx_inv_deducted_unit.Free;
    if Assigned(FparentRefAx_inv_received_unit) then
      parentRefAx_inv_received_unit.Free;
    if Assigned(FparentRefAx_inv_reserv_phys_unit) then
      parentRefAx_inv_reserv_phys_unit.Free;
    if Assigned(FparentRefAx_inv_avail_phys_unit) then
      parentRefAx_inv_avail_phys_unit.Free;
    if Assigned(FparentRefAx_inv_physical_value) then
      parentRefAx_inv_physical_value.Free;
    if Assigned(FparentRefAx_inv_posted_value) then
      parentRefAx_inv_posted_value.Free;
    if Assigned(FparentRefAxFactor) then
      parentRefAxFactor.Free;
    inherited Destroy;
  end;

  destructor ENEstimateItem2FinShort.Destroy;
  begin
    if Assigned(FestimateCountGen) then
      estimateCountGen.Free;
    if Assigned(FestimateCountFact) then
      estimateCountFact.Free;
    if Assigned(FestimatePrice) then
      estimatePrice.Free;
    if Assigned(FestimateCost) then
      estimateCost.Free;
    if Assigned(FplanItemRefCountGen) then
      planItemRefCountGen.Free;
    if Assigned(FquantityFINMaterials) then
      quantityFINMaterials.Free;
    if Assigned(FsuggestedQuantity) then
      suggestedQuantity.Free;
    inherited Destroy;
  end;

  destructor FINMaterialsShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

  destructor FINMaterialsList_.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

  destructor ENEstimateItem2FinShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

initialization

  RemClassRegistry.RegisterXSClass(FINMaterials, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMaterials');
  RemClassRegistry.RegisterXSClass(FINMaterialsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMaterialsRef');
  RemClassRegistry.RegisterXSClass(FINMaterialsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMaterialsFilter');
  RemClassRegistry.RegisterXSClass(FINMaterialsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMaterialsShort');
  RemClassRegistry.RegisterXSClass(FINMaterialsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMaterialsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINMaterialsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINMaterialsShort');

  InvRegistry.RegisterInterface(TypeInfo(FINMaterialsControllerSoapPort), 'http://ksoe.org/FINMaterialsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINMaterialsControllerSoapPort), 'http://ksoe.org/FINMaterialsController/action/FINMaterialsController.%operationName%');


end.
