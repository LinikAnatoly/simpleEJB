unit RQBillItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKMaterialsController
   ,RQMaterialsController
   ,RQBillController
   ,RQBillItemStateController
   ,RQOrderItemController
   ,ENGeneralContractsController
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

  RQBillItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillItem = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FmaterialNameTxt : WideString;
    FmeasurementNameTxt : WideString;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    Fnds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcommentGen : WideString;
    FddsCodesTxt : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocId : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Fmaterial : TKMaterials;
//???
    FrqMaterialsRef : RQMaterialsRef;
//???
    FbillRef : RQBillRef;
//???
    FstateRef : RQBillItemStateRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property measurementNameTxt : WideString read FmeasurementNameTxt write FmeasurementNameTxt;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds;
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds;
    property nds : TXSDecimal read Fnds write Fnds;
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds;
    property sumNds : TXSDecimal read FsumNds write FsumNds;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property ddsCodesTxt : WideString read FddsCodesTxt write FddsCodesTxt;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocId : Integer read FfinDocId write FfinDocId;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property material : TKMaterials read Fmaterial write Fmaterial;
    property rqMaterialsRef : RQMaterialsRef read FrqMaterialsRef write FrqMaterialsRef;
    property billRef : RQBillRef read FbillRef write FbillRef;
    property stateRef : RQBillItemStateRef read FstateRef write FstateRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;

{
  RQBillItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FmaterialNameTxt : WideString;
    FmeasurementNameTxt : WideString;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    Fnds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcommentGen : WideString;
    FddsCodesTxt : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocId : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Fmaterial : TKMaterials;
//???
    FrqMaterialsRef : RQMaterialsRef;
//???
    FbillRef : RQBillRef;
//???
    FstateRef : RQBillItemStateRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property measurementNameTxt : WideString read FmeasurementNameTxt write FmeasurementNameTxt;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds;
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds;
    property nds : TXSDecimal read Fnds write Fnds;
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds;
    property sumNds : TXSDecimal read FsumNds write FsumNds;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property ddsCodesTxt : WideString read FddsCodesTxt write FddsCodesTxt;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocId : Integer read FfinDocId write FfinDocId;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property material : TKMaterials read Fmaterial write Fmaterial;
    property rqMaterialsRef : RQMaterialsRef read FrqMaterialsRef write FrqMaterialsRef;
    property billRef : RQBillRef read FbillRef write FbillRef;
    property stateRef : RQBillItemStateRef read FstateRef write FstateRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;
}

  RQBillItemFilter = class(RQBillItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQBillItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FmaterialNameTxt : WideString;
    FmeasurementNameTxt : WideString;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    Fnds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcommentGen : WideString;
    FddsCodesTxt : WideString;
    FcontractNumber : WideString;
    FfinDocCode : WideString;
    FfinDocId : Integer;
    FuserGen : WideString;
    FmaterialCode : Integer;
    FmaterialName : WideString;
    FmaterialCost : TXSDecimal;
    FmaterialDeliveryDate : Integer;
    FmaterialNumkatalog : WideString;
    FmaterialIdentid : WideString;
    FmaterialCostnkre : TXSDecimal;
    FmaterialWeight : TXSDecimal;
    FmaterialCostAlternative : TXSDecimal;
    FrqMaterialsRefCode : Integer;
    FrqMaterialsRefOutCode : Integer;
    FrqMaterialsRefName : WideString;
    FbillRefCode : Integer;
    FbillRefNumberDoc : WideString;
    FbillRefNumberProject : WideString;
    FbillRefDateGen : TXSDate;
    FbillRefUserGen : WideString;
    FbillRefDeliveryDays : TXSDecimal;
    FbillRefVat : TXSDecimal;
    FbillRefContractNumber : WideString;
    FbillRefFinDocCode : WideString;
    FbillRefSumWithNds : TXSDecimal;
    FbillRefPersonalAccount : WideString;
    FstateRefCode : Integer;
    FstateRefName : WideString;
    FgeneralContractRefCode : Integer;
    FgeneralContractRefFinDocID : Integer;
    FgeneralContractRefFinDocCode : WideString;
    FgeneralContractRefContractNumber : WideString;
    FgeneralContractRefContractDate : TXSDate;
    FgeneralContractRefCommentGen : WideString;
    FgeneralContractRefPartnerId : Integer;
    FgeneralContractRefPartnerCode : WideString;
    FgeneralContractRefPartnerName : WideString;
    FgeneralContractRefContractRegDate : TXSDate;
    FgeneralContractRefContractStartDate : TXSDate;
    FgeneralContractRefContractEndDate : TXSDate;
    FgeneralContractRefAxContractId : WideString;
    FgeneralContractRefAxContractCode : WideString;
    FgeneralContractRefAxContractNumber : WideString;
    FgeneralContractRefAxContractAccount : WideString;
    FgeneralContractRefAxContractDate : TXSDate;
    FgeneralContractRefAxContractCommentGen : WideString;
    FgeneralContractRefAxContractGroupCode : WideString;
    FgeneralContractRefAxPartnerCode : WideString;
    FgeneralContractRefAxPartnerName : WideString;
    FgeneralContractRefUserGen : WideString;

    FcontractDate : TXSDate;
    FmeasurementCode : Integer;
    FmeasurementName : WideString;
    FbillRefOrgName : WideString;
    Fsum_by_obj_text : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property measurementNameTxt : WideString read FmeasurementNameTxt write FmeasurementNameTxt;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds;
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds;
    property nds : TXSDecimal read Fnds write Fnds;
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds;
    property sumNds : TXSDecimal read FsumNds write FsumNds;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property ddsCodesTxt : WideString read FddsCodesTxt write FddsCodesTxt;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocId : Integer read FfinDocId write FfinDocId;
    property userGen : WideString read FuserGen write FuserGen;

    property materialCode : Integer read FmaterialCode write FmaterialCode;
    property materialName : WideString read FmaterialName write FmaterialName;
    property materialCost : TXSDecimal read FmaterialCost write FmaterialCost;
    property materialDeliveryDate : Integer read FmaterialDeliveryDate write FmaterialDeliveryDate;
    property materialNumkatalog : WideString read FmaterialNumkatalog write FmaterialNumkatalog;
    property materialIdentid : WideString read FmaterialIdentid write FmaterialIdentid;
    property materialCostnkre : TXSDecimal read FmaterialCostnkre write FmaterialCostnkre;
    property materialWeight : TXSDecimal read FmaterialWeight write FmaterialWeight;
    property materialCostAlternative : TXSDecimal read FmaterialCostAlternative write FmaterialCostAlternative;
    property rqMaterialsRefCode : Integer read FrqMaterialsRefCode write FrqMaterialsRefCode;
    property rqMaterialsRefOutCode : Integer read FrqMaterialsRefOutCode write FrqMaterialsRefOutCode;
    property rqMaterialsRefName : WideString read FrqMaterialsRefName write FrqMaterialsRefName;
    property billRefCode : Integer read FbillRefCode write FbillRefCode;
    property billRefNumberDoc : WideString read FbillRefNumberDoc write FbillRefNumberDoc;
    property billRefNumberProject : WideString read FbillRefNumberProject write FbillRefNumberProject;
    property billRefDateGen : TXSDate read FbillRefDateGen write FbillRefDateGen;
    property billRefUserGen : WideString read FbillRefUserGen write FbillRefUserGen;
    property billRefDeliveryDays : TXSDecimal read FbillRefDeliveryDays write FbillRefDeliveryDays;
    property billRefVat : TXSDecimal read FbillRefVat write FbillRefVat;
    property billRefContractNumber : WideString read FbillRefContractNumber write FbillRefContractNumber;
    property billRefFinDocCode : WideString read FbillRefFinDocCode write FbillRefFinDocCode;
    property billRefSumWithNds : TXSDecimal read FbillRefSumWithNds write FbillRefSumWithNds;
    property billRefPersonalAccount : WideString read FbillRefPersonalAccount write FbillRefPersonalAccount;
    property stateRefCode : Integer read FstateRefCode write FstateRefCode;
    property stateRefName : WideString read FstateRefName write FstateRefName;
    property generalContractRefCode : Integer read FgeneralContractRefCode write FgeneralContractRefCode;
    property generalContractRefFinDocID : Integer read FgeneralContractRefFinDocID write FgeneralContractRefFinDocID;
    property generalContractRefFinDocCode : WideString read FgeneralContractRefFinDocCode write FgeneralContractRefFinDocCode;
    property generalContractRefContractNumber : WideString read FgeneralContractRefContractNumber write FgeneralContractRefContractNumber;
    property generalContractRefContractDate : TXSDate read FgeneralContractRefContractDate write FgeneralContractRefContractDate;
    property generalContractRefCommentGen : WideString read FgeneralContractRefCommentGen write FgeneralContractRefCommentGen;
    property generalContractRefPartnerId : Integer read FgeneralContractRefPartnerId write FgeneralContractRefPartnerId;
    property generalContractRefPartnerCode : WideString read FgeneralContractRefPartnerCode write FgeneralContractRefPartnerCode;
    property generalContractRefPartnerName : WideString read FgeneralContractRefPartnerName write FgeneralContractRefPartnerName;
    property generalContractRefContractRegDate : TXSDate read FgeneralContractRefContractRegDate write FgeneralContractRefContractRegDate;
    property generalContractRefContractStartDate : TXSDate read FgeneralContractRefContractStartDate write FgeneralContractRefContractStartDate;
    property generalContractRefContractEndDate : TXSDate read FgeneralContractRefContractEndDate write FgeneralContractRefContractEndDate;
    property generalContractRefAxContractId : WideString read FgeneralContractRefAxContractId write FgeneralContractRefAxContractId;
    property generalContractRefAxContractCode : WideString read FgeneralContractRefAxContractCode write FgeneralContractRefAxContractCode;
    property generalContractRefAxContractNumber : WideString read FgeneralContractRefAxContractNumber write FgeneralContractRefAxContractNumber;
    property generalContractRefAxContractAccount : WideString read FgeneralContractRefAxContractAccount write FgeneralContractRefAxContractAccount;
    property generalContractRefAxContractDate : TXSDate read FgeneralContractRefAxContractDate write FgeneralContractRefAxContractDate;
    property generalContractRefAxContractCommentGen : WideString read FgeneralContractRefAxContractCommentGen write FgeneralContractRefAxContractCommentGen;
    property generalContractRefAxContractGroupCode : WideString read FgeneralContractRefAxContractGroupCode write FgeneralContractRefAxContractGroupCode;
    property generalContractRefAxPartnerCode : WideString read FgeneralContractRefAxPartnerCode write FgeneralContractRefAxPartnerCode;
    property generalContractRefAxPartnerName : WideString read FgeneralContractRefAxPartnerName write FgeneralContractRefAxPartnerName;
    property generalContractRefUserGen : WideString read FgeneralContractRefUserGen write FgeneralContractRefUserGen;

    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property measurementCode : Integer read FmeasurementCode write FmeasurementCode;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property billRefOrgName : WideString read FbillRefOrgName write FbillRefOrgName;

    property sum_by_obj_text : WideString read Fsum_by_obj_text write Fsum_by_obj_text;
  end;

  ArrayOfRQBillItemShort = array of RQBillItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBillItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBillItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBillItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBillItemController/message/
  // soapAction: http://ksoe.org/RQBillItemController/action/RQBillItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBillItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBillItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBillItemControllerSoapPort = interface(IInvokable)
  ['{20C988CC-253A-49BF-92A6-54F70CF131BE}']
    function add(const aRQBillItem: RQBillItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQBillItem: RQBillItem); stdcall;
    function getObject(const anObjectCode: Integer): RQBillItem; stdcall;
    function getList: RQBillItemShortList; stdcall;
    function getFilteredList(const aRQBillItemFilter: RQBillItemFilter): RQBillItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBillItemShortList; stdcall;
    function getScrollableFilteredList(const aRQBillItemFilter: RQBillItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBillItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBillItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQBillItemFilter: RQBillItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQBillItemShort; stdcall;

    function  addBillItemList(const corrCount : TXSDecimal; const billCode : Integer; const aRQOrderItem : RQOrderItem; orderItemList : ArrayOfRQOrderItemShort; const groupMaterial: Boolean) : Integer; stdcall;
    function  importBill(billItemList : ArrayOfRQBillItemShort) : Integer; stdcall;
    procedure changePaysParamOnRqOrder(const billitemCode : Integer; const plannedDateDelivery: TXSDate; const PlannedDatePays: TXSDate;const typePayRefcode: Integer ; const paymentValue: Integer); stdcall;
  end;


implementation

  destructor RQBillItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(Fnds) then
      nds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fmaterial) then
      material.Free;
    if Assigned(FrqMaterialsRef) then
      rqMaterialsRef.Free;
    if Assigned(FbillRef) then
      billRef.Free;
    if Assigned(FstateRef) then
      stateRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;

{
  destructor RQBillItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(Fnds) then
      nds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fmaterial) then
      material.Free;
    if Assigned(FrqMaterialsRef) then
      rqMaterialsRef.Free;
    if Assigned(FbillRef) then
      billRef.Free;
    if Assigned(FstateRef) then
      stateRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;
}

  destructor RQBillItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQBillItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(Fnds) then
      nds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FmaterialCost) then
      materialCost.Free;
    if Assigned(FmaterialCostnkre) then
      materialCostnkre.Free;
    if Assigned(FmaterialWeight) then
      materialWeight.Free;
    if Assigned(FmaterialCostAlternative) then
      materialCostAlternative.Free;
    if Assigned(FbillRefDateGen) then
      billRefDateGen.Free;
    if Assigned(FbillRefDeliveryDays) then
      billRefDeliveryDays.Free;
    if Assigned(FbillRefVat) then
      billRefVat.Free;
    if Assigned(FbillRefSumWithNds) then
      billRefSumWithNds.Free;
    if Assigned(FgeneralContractRefContractDate) then
      generalContractRefContractDate.Free;
    if Assigned(FgeneralContractRefContractRegDate) then
      generalContractRefContractRegDate.Free;
    if Assigned(FgeneralContractRefContractStartDate) then
      generalContractRefContractStartDate.Free;
    if Assigned(FgeneralContractRefContractEndDate) then
      generalContractRefContractEndDate.Free;
    if Assigned(FgeneralContractRefAxContractDate) then
      generalContractRefAxContractDate.Free;
    inherited Destroy;
  end;

  destructor RQBillItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBillItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem');
  RemClassRegistry.RegisterXSClass(RQBillItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItemRef');
  RemClassRegistry.RegisterXSClass(RQBillItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItemFilter');
  RemClassRegistry.RegisterXSClass(RQBillItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItemShort');
  RemClassRegistry.RegisterXSClass(RQBillItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBillItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBillItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBillItemControllerSoapPort), 'http://ksoe.org/RQBillItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBillItemControllerSoapPort), 'http://ksoe.org/RQBillItemController/action/RQBillItemController.%operationName%');


end.
