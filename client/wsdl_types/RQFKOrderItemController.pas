unit RQFKOrderItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQFKOrderController 
   ,TKMaterialsController
   ,FINMaterialsController
   ,RQOrderItemController
   , ENDepartmentController
   , ENMetrologyCounterController
   , ENEstimateItem2ENEstimateItemController
   , RQStorageZoneController
   , SCCounterController
   , ENGeneralContractsController
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  RQFKOrderItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }
  RQFKOrderItemRemainder = class;                   { "http://ksoe.org/EnergyproControllerService/type/" }


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;

  RQFKOrderItemRemainder = class(TRemotable)
  private
    Fcode : Integer; 
    FmaterialNameTxt : WideString;
    FcountGen : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    Fmodify_time : Int64;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
//???
    Fbudget : ENDepartment;
    FsealSeriesStart : WideString;
    FsealNumberStart : Integer;
    FsealName : WideString;
    FsealColor : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
    property budget : ENDepartment read Fbudget write Fbudget; 
  end;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem = class(TRemotable)
  private
    Fcode : Integer; 
    FfinCode : Integer; 
    FnomenclatureCode : Integer; 
    FnomenclatureNum : WideString;
    FnomenclatureBalSch : WideString;
    FnomenclatureName : WideString;
    FnomenclatureUnitCode : Integer; 
    FnomenclatureUnitName : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    FmaterialNameTxt : WideString;
    FmeasurementNameTxt : WideString;
    FcountGen : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    FpriceNds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FdateEdit : TXSDate;
    FuserGen : WideString;
    FcommentGen : WideString;
    Fmodify_time : Int64;
    Fnext_mat_id : Integer;
    Fnext_mat_name : WideString;
    FmeasurementTwoUnits : WideString;
    FcountTwoUnits : TXSDecimal;
    FpriceTwoUnits : TXSDecimal;
    Fweight : TXSDecimal;
    FsellingPriceWithoutNds : TXSDecimal;
    FsellingCostWithoutNds : TXSDecimal;
//???
    FfkOrderRef : RQFKOrderRef;
//???
    Fmaterial : TKMaterials;
//???
    FzoneRef : RQStorageZoneRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;

    FdateRealiz : TXSDate;
    FfundingType : Integer;
    FsealSeriesStart : WideString;
    FsealNumberStart : Integer;
    FsealName : WideString;
    FsealColor : WideString;
	FproductionDate : TXSDate;
	FexpirationDate : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  finCode : Integer read FfinCode write FfinCode; 
    property  nomenclatureCode : Integer read FnomenclatureCode write FnomenclatureCode; 
    property nomenclatureNum : WideString read FnomenclatureNum write FnomenclatureNum;
    property nomenclatureBalSch : WideString read FnomenclatureBalSch write FnomenclatureBalSch;
    property nomenclatureName : WideString read FnomenclatureName write FnomenclatureName;
    property  nomenclatureUnitCode : Integer read FnomenclatureUnitCode write FnomenclatureUnitCode; 
    property nomenclatureUnitName : WideString read FnomenclatureUnitName write FnomenclatureUnitName;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property measurementNameTxt : WideString read FmeasurementNameTxt write FmeasurementNameTxt;
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds; 
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds; 
    property priceNds : TXSDecimal read FpriceNds write FpriceNds; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property next_mat_id : Integer read Fnext_mat_id write Fnext_mat_id;
    property next_mat_name : WideString read Fnext_mat_name write Fnext_mat_name;
    property measurementTwoUnits : WideString read FmeasurementTwoUnits write FmeasurementTwoUnits;
    property countTwoUnits : TXSDecimal read FcountTwoUnits write FcountTwoUnits; 
    property priceTwoUnits : TXSDecimal read FpriceTwoUnits write FpriceTwoUnits; 
    property weight : TXSDecimal read Fweight write Fweight; 
    property sellingPriceWithoutNds : TXSDecimal read FsellingPriceWithoutNds write FsellingPriceWithoutNds; 
    property sellingCostWithoutNds : TXSDecimal read FsellingCostWithoutNds write FsellingCostWithoutNds; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
    property material : TKMaterials read Fmaterial write Fmaterial;
    property zoneRef : RQStorageZoneRef read FzoneRef write FzoneRef;
    property dateRealiz : TXSDate read FdateRealiz write FdateRealiz;
    property fundingType : Integer read FfundingType write FfundingType;
    property sealSeriesStart : WideString read FsealSeriesStart write FsealSeriesStart;
    property sealNumberStart : Integer read FsealNumberStart write FsealNumberStart;
    property sealName : WideString read FsealName write FsealName;
    property sealColor : WideString read FsealColor write FsealColor;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
	property productionDate : TXSDate read FproductionDate write FproductionDate;
	property expirationDate : TXSDate read FexpirationDate write FexpirationDate;
  end;
  
{
  RQFKOrderItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FfinCode : Integer; 
    FnomenclatureCode : Integer; 
    FnomenclatureNum : WideString;
    FnomenclatureBalSch : WideString;
    FnomenclatureName : WideString;
    FnomenclatureUnitCode : Integer; 
    FnomenclatureUnitName : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    FmaterialNameTxt : WideString;
    FmeasurementNameTxt : WideString;
    FcountGen : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    FpriceNds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FdateEdit : TXSDate;
    Fweight : TXSDecimal;
    FuserGen : WideString;
    Fmodify_time : Int64;
    FmeasurementTwoUnits : WideString;
    FcountTwoUnits : TXSDecimal;
    FpriceTwoUnits : TXSDecimal;
//???
    FfkOrderRef : RQFKOrderRef;
//???
    Fmaterial : TKMaterials;
//???
    FzoneRef : RQStorageZoneRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  finCode : Integer read FfinCode write FfinCode; 
    property  nomenclatureCode : Integer read FnomenclatureCode write FnomenclatureCode; 
    property nomenclatureNum : WideString read FnomenclatureNum write FnomenclatureNum;
    property nomenclatureBalSch : WideString read FnomenclatureBalSch write FnomenclatureBalSch;
    property nomenclatureName : WideString read FnomenclatureName write FnomenclatureName;
    property  nomenclatureUnitCode : Integer read FnomenclatureUnitCode write FnomenclatureUnitCode; 
    property nomenclatureUnitName : WideString read FnomenclatureUnitName write FnomenclatureUnitName;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID; 
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property measurementNameTxt : WideString read FmeasurementNameTxt write FmeasurementNameTxt;
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds; 
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds; 
    property priceNds : TXSDecimal read FpriceNds write FpriceNds; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property measurementTwoUnits : WideString read FmeasurementTwoUnits write FmeasurementTwoUnits;
    property countTwoUnits : TXSDecimal read FcountTwoUnits write FcountTwoUnits; 
    property priceTwoUnits : TXSDecimal read FpriceTwoUnits write FpriceTwoUnits; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
    property material : TKMaterials read Fmaterial write Fmaterial; 
    property weight : TXSDecimal read Fweight write Fweight;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;
}

  RQFKOrderItemFilter = class(RQFKOrderItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKOrderItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FfinCode : Integer; 
    FnomenclatureCode : Integer; 
    FnomenclatureNum : WideString;
    FnomenclatureBalSch : WideString;
    FnomenclatureName : WideString;
    FnomenclatureUnitCode : Integer; 
    FnomenclatureUnitName : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    FmaterialNameTxt : WideString;
    FmeasurementNameTxt : WideString;
    FcountGen : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    FpriceNds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FuserGen : WideString;
    FmeasurementTwoUnits : WideString;
    FcountTwoUnits : TXSDecimal;
    FpriceTwoUnits : TXSDecimal;
    FfkOrderRefCode : Integer; 
    FfkOrderRefNumberDoc : WideString;
    FfkOrderRefDateGen : TXSDate;
    FfkOrderRefMolOutCode : WideString;
    FfkOrderRefMolOutName : WideString;
    FfkOrderRefMolInCode : WideString;
    FfkOrderRefMolInName : WideString;
    FfkOrderRefExpeditorCode : WideString;
    FfkOrderRefExpeditorName : WideString;
    FfkOrderRefWarrantNumber : WideString;
    FfkOrderRefWarrantDate : TXSDate;
    FfkOrderRefWarrantFIO : WideString;
    FfkOrderRefUserGen : WideString;
    FmaterialCode : Integer; 
    FmaterialName : WideString;
    Fnext_mat_id : Integer;
    Fnext_mat_name : WideString;

    //FmeasurementCode : Integer;
    FmeasurementName : WideString;

    Fweight : TXSDecimal;

    FsellingPriceWithoutNds : TXSDecimal;
    FsellingCostWithoutNds : TXSDecimal;

    FzoneRefCode : Integer; 
    FzoneRefName : WideString;
    FzoneRefDescription : WideString;
    FzoneRefUserGen : WideString;
    FzoneRefDateEdit : TXSDateTime;
    FstorageZoneShortName : WideString;

    FdateRealiz : TXSDate;
    FfundingType : Integer;
    FfundingTypeStr : WideString;
    
    FsealSeriesStart : WideString;
    FsealNumberStart : Integer;
    FsealName : WideString;
    FsealColor : WideString;
    FgeneralContractRefCode : Integer;
	FproductionDate : TXSDate;
	FexpirationDate : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  finCode : Integer read FfinCode write FfinCode; 
    property  nomenclatureCode : Integer read FnomenclatureCode write FnomenclatureCode; 
    property nomenclatureNum : WideString read FnomenclatureNum write FnomenclatureNum;
    property nomenclatureBalSch : WideString read FnomenclatureBalSch write FnomenclatureBalSch;
    property nomenclatureName : WideString read FnomenclatureName write FnomenclatureName;
    property  nomenclatureUnitCode : Integer read FnomenclatureUnitCode write FnomenclatureUnitCode; 
    property nomenclatureUnitName : WideString read FnomenclatureUnitName write FnomenclatureUnitName;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID; 
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property measurementNameTxt : WideString read FmeasurementNameTxt write FmeasurementNameTxt;
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds; 
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds; 
    property priceNds : TXSDecimal read FpriceNds write FpriceNds; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 
    property userGen : WideString read FuserGen write FuserGen;
    property measurementTwoUnits : WideString read FmeasurementTwoUnits write FmeasurementTwoUnits;
    property countTwoUnits : TXSDecimal read FcountTwoUnits write FcountTwoUnits; 
    property priceTwoUnits : TXSDecimal read FpriceTwoUnits write FpriceTwoUnits;
    property fkOrderRefCode : Integer read FfkOrderRefCode write FfkOrderRefCode; 
    property fkOrderRefNumberDoc : WideString read FfkOrderRefNumberDoc write FfkOrderRefNumberDoc; 
    property fkOrderRefDateGen : TXSDate read FfkOrderRefDateGen write FfkOrderRefDateGen; 
    property fkOrderRefMolOutCode : WideString read FfkOrderRefMolOutCode write FfkOrderRefMolOutCode; 
    property fkOrderRefMolOutName : WideString read FfkOrderRefMolOutName write FfkOrderRefMolOutName; 
    property fkOrderRefMolInCode : WideString read FfkOrderRefMolInCode write FfkOrderRefMolInCode; 
    property fkOrderRefMolInName : WideString read FfkOrderRefMolInName write FfkOrderRefMolInName; 
    property fkOrderRefExpeditorCode : WideString read FfkOrderRefExpeditorCode write FfkOrderRefExpeditorCode; 
    property fkOrderRefExpeditorName : WideString read FfkOrderRefExpeditorName write FfkOrderRefExpeditorName; 
    property fkOrderRefWarrantNumber : WideString read FfkOrderRefWarrantNumber write FfkOrderRefWarrantNumber; 
    property fkOrderRefWarrantDate : TXSDate read FfkOrderRefWarrantDate write FfkOrderRefWarrantDate; 
    property fkOrderRefWarrantFIO : WideString read FfkOrderRefWarrantFIO write FfkOrderRefWarrantFIO; 
    property fkOrderRefUserGen : WideString read FfkOrderRefUserGen write FfkOrderRefUserGen; 
    property materialCode : Integer read FmaterialCode write FmaterialCode; 
    property materialName : WideString read FmaterialName write FmaterialName;
    property  next_mat_id : Integer read Fnext_mat_id write Fnext_mat_id;
    property next_mat_name : WideString read Fnext_mat_name write Fnext_mat_name;

    //property measurementRefCode : Integer read FmeasurementRefCode write FmeasurementRefCode;
    property measurementName : WideString read FmeasurementName write FmeasurementName;

    property weight : TXSDecimal read Fweight write Fweight; 

    property sellingPriceWithoutNds : TXSDecimal read FsellingPriceWithoutNds write FsellingPriceWithoutNds;
    property sellingCostWithoutNds : TXSDecimal read FsellingCostWithoutNds write FsellingCostWithoutNds;

    property zoneRefCode : Integer read FzoneRefCode write FzoneRefCode; 
    property zoneRefName : WideString read FzoneRefName write FzoneRefName;
    property zoneRefDescription : WideString read FzoneRefDescription write FzoneRefDescription; 
    property zoneRefUserGen : WideString read FzoneRefUserGen write FzoneRefUserGen;
    property zoneRefDateEdit : TXSDateTime read FzoneRefDateEdit write FzoneRefDateEdit;

    property storageZoneShortName : WideString read FstorageZoneShortName write FstorageZoneShortName;

    property dateRealiz : TXSDate read FdateRealiz write FdateRealiz;

    property fundingType : Integer read FfundingType write FfundingType;
    property fundingTypeStr : WideString read FfundingTypeStr write FfundingTypeStr;
    property sealSeriesStart : WideString read FsealSeriesStart write FsealSeriesStart;
    property  sealNumberStart : Integer read FsealNumberStart write FsealNumberStart;
    property sealName : WideString read FsealName write FsealName;
    property sealColor : WideString read FsealColor write FsealColor;
    property generalContractRefCode : Integer read FgeneralContractRefCode write FgeneralContractRefCode;
	property productionDate : TXSDate read FproductionDate write FproductionDate;
	property expirationDate : TXSDate read FexpirationDate write FexpirationDate;
  end;

  ArrayOfRQFKOrderItemShort = array of RQFKOrderItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderItemShort read Flist write Flist;
  end;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderItemController/message/
  // soapAction: http://ksoe.org/RQFKOrderItemController/action/RQFKOrderItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderItemControllerSoapPort = interface(IInvokable)
  ['{5777178E-24F1-4624-8DFF-1EECB22FC6B6}']
    function  add(const aRQFKOrderItem: RQFKOrderItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrderItem: RQFKOrderItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrderItem; stdcall;
    function  getList: RQFKOrderItemShortList; stdcall;
    function  getFilteredList(const aRQFKOrderItemFilter: RQFKOrderItemFilter): RQFKOrderItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrderItemFilter: RQFKOrderItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItemShortList; stdcall;

    function  addOE2REM(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;
    function  addREM2MOL(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;
    function  addLoadMBP(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;
    function  addLoadMNMA(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;
    function  addMBP(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;
    function  addMNMA(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;
    function  addOutMNMA(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;
    function  addGift(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;
    function  addToStorage(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;
    function  addZoneChanging(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; overload; stdcall;
    function  addZoneChanging(const aFINMaterials: ArrayOfFINMaterialsData; const fkOrderCode: Integer): Integer; overload; stdcall;
    procedure  addZoneChangingFromOrder(const fkOrderCode: Integer; const fkOrderCodeFrom: Integer); stdcall;
    procedure addCSCountersZoneChanging(const fkOrderCode : Integer; const counters : SCCounterController.ArrayOfSCCounterShort ) ; overload; stdcall;
    function  addOutFuel(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;

    // добавление материалов в приходную накладную
    function addFromOrderItemList(const corrCount : TXSDecimal;
      const invoiceCode : Integer;
      const aRQOrderItem : RQOrderItem;
      const orderItemList : ArrayOfRQOrderItemShort;
      const aRQFKOrderItemRemainder : RQFKOrderItemRemainder;
      const billItemCode : Integer;
      const zoneCode : Integer) : Integer; stdcall;

    // добавление услуг в акт выполненных работ
    function addFromOrderItemListForServices(const corrCount : TXSDecimal;
      const invoiceCode : Integer;
      const aRQOrderItem : RQOrderItem;
      const orderItemList : ArrayOfRQOrderItemShort;
      const aRQFKOrderItemRemainder : RQFKOrderItemRemainder;
      const billItemCode : Integer;
      const zoneCode : Integer) : Integer; stdcall;

    procedure removePrihod(const orderItemCode : Integer ); stdcall;
    procedure removeOE2REM(const finMaterialsCode : Integer; const orderCode : Integer ); overload; stdcall;
    procedure removeOE2REM(const finMaterialsCode : Integer; const orderCode : Integer ; const orderItemCode : Integer); overload; stdcall;
    procedure removeREM2MOL(const finMaterialsCode : Integer; const orderCode : Integer ); overload; stdcall;
    procedure removeREM2MOL(const finMaterialsCode : Integer; const orderCode : Integer; isAllocationList : Boolean); overload; stdcall;
    procedure removeLoadMBP(const finMaterialsCode : Integer; const orderCode : Integer ); overload; stdcall;
    procedure removeLoadMNMA(const finMaterialsCode : Integer; const orderCode : Integer ); overload; stdcall;
    procedure removeMBP(const finMaterialsCode : Integer; const orderCode : Integer ); overload; stdcall;
    procedure removeMNMA(const finMaterialsCode : Integer; const orderCode : Integer ); overload; stdcall;
    procedure removeOutMNMA(const finMaterialsCode : Integer; const orderCode : Integer ); overload; stdcall;
    procedure removeGift(const finMaterialsCode : Integer; const orderCode : Integer ); overload; stdcall;
    procedure removeToStorage(const finMaterialsCode : Integer; const orderCode : Integer ); overload; stdcall;
    procedure removeZoneChanging(const finMaterialsCode : Integer; const orderCode : Integer ); overload; stdcall;
    procedure removeOutFuel(const finMaterialsCode : Integer; const orderCode : Integer ); overload; stdcall;

    procedure removeOE2REMItem(const orderItemCode : Integer ); overload; stdcall;
    procedure removeOE2REMItem(const orderItemCode : Integer; isAllocationList : Boolean ); overload; stdcall;
    procedure removeREM2MOLItem(const orderItemCode : Integer ); stdcall;
    procedure removeLoadMBPItem(const orderItemCode : Integer ); stdcall;
    procedure removeLoadMNMAItem(const orderItemCode : Integer ); stdcall;
    procedure removeMBPItem(const orderItemCode : Integer ); stdcall;
    procedure removeMNMAItem(const orderItemCode : Integer ); stdcall;
    procedure removeOutMNMAItem(const orderItemCode : Integer ); stdcall;
    procedure removeGiftItem(const orderItemCode : Integer ); stdcall;
    procedure removeStorageItem(const orderItemCode : Integer ); overload; stdcall;
    procedure removeStorageItem(const orderItemCode : Integer; isAllocationList : Boolean); overload; stdcall;
    procedure removeZoneChangingItem(const orderItemCode : Integer ); stdcall;
    procedure removeOutFuelItem(const orderItemCode : Integer ); stdcall;


    procedure addCSCounters(const fkOrderCode : Integer; const scOrderCode : Integer; const counters : ArrayOfENMetrologyCounters ) ; overload; stdcall;
    procedure removeCSCountersByCounterCode(const scCounterCode : Integer; const fkOrderCode : Integer); overload; stdcall;
    procedure removeCSCountersByFKItemCode(const fkOrderItemCode : Integer ); overload; stdcall;

    function addForTranzit2Operative(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;

    function addOperative2Tranzit(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;
    procedure removeOperative2Tranzit(const orderItemCode : Integer );overload; stdcall;
    procedure removeOperative2Tranzit(const orderItemCode : Integer; isAllocationList : Boolean );overload; stdcall;

    function addMeasurementChange(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; stdcall;
    procedure saveMeasurementChange(const aRQFKOrderItem: RQFKOrderItem); stdcall;
    procedure removeMeasurementChange(const orderItemCode : Integer ); overload; stdcall;

    function addE2E(const aFINMaterials: FINMaterials; const fkOrderCode: Integer; const aENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItem; const finCode : Integer; const finCount : TXSDecimal): Integer; stdcall;
    procedure removeE2E(const orderItemCode : Integer ); stdcall; overload;

    procedure addCSCountersForWriteOff(const fkOrderCode : Integer; const scOrderCode : Integer; const counters : ArrayOfENMetrologyCounters ) ; overload; stdcall;
    procedure removeCSCountersByFKItemCodeWriteOff(const fkOrderItemCode : Integer ); overload; stdcall;

    function addOSExpl(const aFKOrderItem: RQFKOrderItem; const estimateCode: Integer; const fkOrderCode: Integer): Integer; stdcall;
    procedure removeOSExplItem(const orderItemCode: Integer); stdcall;

    function addOSMovement(const aFKOrderItem: RQFKOrderItem; const estimateCode: Integer; const fkOrderCode: Integer): Integer; stdcall;
    procedure removeOSMovementItem(const orderItemCode: Integer); stdcall;
    procedure removeE2E(const finMaterialsCode : Integer; const orderCode : Integer); stdcall; overload;

    // NET-4400 Методы для вывода из аварийного запаса
    function addAvarOut(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; overload; stdcall;
    procedure addAvarOut(const aFINMaterials: ArrayOfFINMaterialsData; const fkOrderCode: Integer); overload; stdcall;
    procedure removeAvarOutItem(const orderItemCode : Integer ); stdcall;
    procedure removeAvarOut(const finMaterialsCode : Integer; const orderCode : Integer ); overload; stdcall;

    // NET-4400 Методы для ввода в аварийный запас
    function addAvarIn(const aFINMaterials: FINMaterials; const fkOrderCode: Integer): Integer; overload; stdcall;
    procedure addAvarIn(const aFINMaterials: ArrayOfFINMaterialsData; const fkOrderCode: Integer); overload; stdcall;
    procedure removeAvarInItem(const orderItemCode : Integer ); stdcall;
    procedure removeAvarIn(const finMaterialsCode : Integer; const orderCode : Integer ); overload; stdcall;

    // пломбирование :)
    procedure divideItem(const orderItemCode : Integer; const quantityInBox : Integer); stdcall;
    procedure addSCSeals(const fkOrderCode : Integer;  const counters : ArrayOfENMetrologyCounters );  stdcall;
    procedure removeSCSeals(const sealCode : Integer; const fkOrderCode : Integer); stdcall;
    procedure removeSCSealsByFKItemCode(const orderItemCode : Integer); stdcall;
  end;


implementation

  destructor RQFKOrderItem.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(FpriceNds) then
      priceNds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcountTwoUnits) then
      countTwoUnits.Free;
    if Assigned(FpriceTwoUnits) then
      priceTwoUnits.Free;
    if Assigned(Fweight) then
      weight.Free;
    if Assigned(FsellingPriceWithoutNds) then
      sellingPriceWithoutNds.Free;
    if Assigned(FsellingCostWithoutNds) then
      sellingCostWithoutNds.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    if Assigned(Fmaterial) then
      material.Free;
    if Assigned(FzoneRef) then
      zoneRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    if Assigned(FproductionDate) then
      FproductionDate.Free;
    if Assigned(FexpirationDate) then
      FexpirationDate.Free;
    inherited Destroy;
  end;

  destructor RQFKOrderItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQFKOrderItemShort.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(FpriceNds) then
      priceNds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FcountTwoUnits) then
      countTwoUnits.Free;
    if Assigned(FpriceTwoUnits) then
      priceTwoUnits.Free;
    if Assigned(Fweight) then
      weight.Free;
    if Assigned(FsellingPriceWithoutNds) then
      sellingPriceWithoutNds.Free;
    if Assigned(FsellingCostWithoutNds) then
      sellingCostWithoutNds.Free;      
    if Assigned(FfkOrderRefDateGen) then
      fkOrderRefDateGen.Free;
    if Assigned(FfkOrderRefWarrantDate) then
      fkOrderRefWarrantDate.Free;
    if Assigned(FzoneRefDateEdit) then
      zoneRefDateEdit.Free;
    if Assigned(FproductionDate) then
      FproductionDate.Free;
    if Assigned(FexpirationDate) then
      FexpirationDate.Free;
    inherited Destroy;
  end; 
  
  destructor RQFKOrderItemShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

  destructor RQFKOrderItemRemainder.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    if Assigned(Fbudget) then
      budget.Free;
    inherited Destroy;
  end;

initialization

  RemClassRegistry.RegisterXSClass(RQFKOrderItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem');
  RemClassRegistry.RegisterXSClass(RQFKOrderItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItemRef');
  RemClassRegistry.RegisterXSClass(RQFKOrderItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItemFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItemShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderItemShort');

  RemClassRegistry.RegisterXSClass(RQFKOrderItemRemainder, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItemRemainder');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderItemControllerSoapPort), 'http://ksoe.org/RQFKOrderItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderItemControllerSoapPort), 'http://ksoe.org/RQFKOrderItemController/action/RQFKOrderItemController.%operationName%');


end.
