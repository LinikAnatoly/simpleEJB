unit SCSeal2ENWorkOrderBytController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,SCSealController
   ,ENWorkOrderBytController
   ,ENWorkOrderBytItemController
   ,SCSeal2WorkOrderBytKindController
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

  SCSeal2ENWorkOrderByt            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCSeal2ENWorkOrderBytRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCSeal2ENWorkOrderByt = class(TRemotable)
  private
    Fcode : Integer;
    FcommentGen : WideString;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FsealRef : SCSealRef;
//???
    FworkOrderBytRef : ENWorkOrderBytRef;
//???
    FworkOrderBytItemRef : ENWorkOrderBytItemRef;
//???
    FkindRef : SCSeal2WorkOrderBytKindRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property sealRef : SCSealRef read FsealRef write FsealRef;
    property workOrderBytRef : ENWorkOrderBytRef read FworkOrderBytRef write FworkOrderBytRef;
    property workOrderBytItemRef : ENWorkOrderBytItemRef read FworkOrderBytItemRef write FworkOrderBytItemRef;
    property kindRef : SCSeal2WorkOrderBytKindRef read FkindRef write FkindRef;
  end;

{
  SCSeal2ENWorkOrderBytFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcommentGen : WideString;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FsealRef : SCSealRef;
//???
    FworkOrderBytRef : ENWorkOrderBytRef;
//???
    FworkOrderBytItemRef : ENWorkOrderBytItemRef;
//???
    FkindRef : SCSeal2WorkOrderBytKindRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property sealRef : SCSealRef read FsealRef write FsealRef;
    property workOrderBytRef : ENWorkOrderBytRef read FworkOrderBytRef write FworkOrderBytRef;
    property workOrderBytItemRef : ENWorkOrderBytItemRef read FworkOrderBytItemRef write FworkOrderBytItemRef;
    property kindRef : SCSeal2WorkOrderBytKindRef read FkindRef write FkindRef;
  end;
}

  SCSeal2ENWorkOrderBytFilter = class(SCSeal2ENWorkOrderByt)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  SCSeal2ENWorkOrderBytShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FsealRefCode : Integer;
    FsealRefInvNumber : WideString;
    FsealRefName : WideString;
    FsealRefBuildNumber : WideString;
    FsealRefAccount : WideString;
    FsealRefDepartmetFKCode : WideString;
    FsealRefMolCode : WideString;
    FsealRefMolName : WideString;
    FsealRefDateIn : TXSDate;
    FsealRefDateBuild : TXSDate;
    FsealRefCost : TXSDecimal;
    FsealRefScCode : Integer;
    FsealRefInstallOrderNumber : WideString;
    FsealRefCostOld : TXSDecimal;
    FsealRefUserAdd : WideString;
    FsealRefDateAdd : TXSDateTime;
    FsealRefUserGen : WideString;
    FsealRefDateEdit : TXSDateTime;
    FworkOrderBytRefCode : Integer;
    FworkOrderBytRefNumberGen : WideString;
    FworkOrderBytRefDateGen : TXSDate;
    FworkOrderBytRefCommentGen : WideString;
    FworkOrderBytRefDateAdd : TXSDateTime;
    FworkOrderBytRefDateEdit : TXSDateTime;
    FworkOrderBytRefUserAdd : WideString;
    FworkOrderBytRefUserEdit : WideString;
    FworkOrderBytItemRefCode : Integer;
    FworkOrderBytItemRefContractNumberServices : WideString;
    FworkOrderBytItemRefAccountNumber : WideString;
    FworkOrderBytItemRefName : WideString;
    FworkOrderBytItemRefCustomerName : WideString;
    FworkOrderBytItemRefAddress : WideString;
    FworkOrderBytItemRefInvNumber : WideString;
    FworkOrderBytItemRefSerialNumber : WideString;
    FworkOrderBytItemRefSeal : WideString;
    FworkOrderBytItemRefPhone : WideString;
    FworkOrderBytItemRefStatuscode : Integer;
    FworkOrderBytItemRefRpCode : Integer;
    FworkOrderBytItemRefDateCounterInst : TXSDate;
    FworkOrderBytItemRefDateCounterCheck : TXSDate;
    FworkOrderBytItemRefCounterType : WideString;
    FworkOrderBytItemRefClassAccuracy : TXSDecimal;
    FworkOrderBytItemRefCheckperiod : TXSDecimal;
    FworkOrderBytItemRefRpStatusCode : Integer;
    FworkOrderBytItemRefPhasity : TXSDecimal;
    FworkOrderBytItemRefDatecheck : TXSDate;
    FworkOrderBytItemRefCheckperiod1 : TXSDecimal;
    FworkOrderBytItemRefPlacecounter : WideString;
    FworkOrderBytItemRefRpIsWorking : Integer;
    FworkOrderBytItemRefRecordPointName : WideString;
    FworkOrderBytItemRefRouteBytName : WideString;
    FworkOrderBytItemRefRouteBytNumbergen : WideString;
    FworkOrderBytItemRefCommentGen : WideString;
    FworkOrderBytItemRefDateAdd : TXSDateTime;
    FworkOrderBytItemRefDateEdit : TXSDateTime;
    FworkOrderBytItemRefUserAdd : WideString;
    FworkOrderBytItemRefUserEdit : WideString;
    FworkOrderBytItemRefFactCode : Integer;
    FkindRefCode : Integer;
    FkindRefName : WideString;
    /////
    FestimateItemCode : Integer;
    FestimateItemCountFact : TXSDecimal;
    FestimateItemMaterialName : WideString;
    FsealsCountFact : TXSDecimal;
    FestimateItemCodes : WideString;

    FsealRefTypeCode : Integer;
    FsealRefTypeName : WideString;

    // Имя потребителя + наименование точки учета (для юр. лиц)
    FworkOrderBytItemRefCustomerNameFull : WideString;
    /////
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property sealRefCode : Integer read FsealRefCode write FsealRefCode;
    property sealRefInvNumber : WideString read FsealRefInvNumber write FsealRefInvNumber;
    property sealRefName : WideString read FsealRefName write FsealRefName;
    property sealRefBuildNumber : WideString read FsealRefBuildNumber write FsealRefBuildNumber;
    property sealRefAccount : WideString read FsealRefAccount write FsealRefAccount;
    property sealRefDepartmetFKCode : WideString read FsealRefDepartmetFKCode write FsealRefDepartmetFKCode;
    property sealRefMolCode : WideString read FsealRefMolCode write FsealRefMolCode;
    property sealRefMolName : WideString read FsealRefMolName write FsealRefMolName;
    property sealRefDateIn : TXSDate read FsealRefDateIn write FsealRefDateIn;
    property sealRefDateBuild : TXSDate read FsealRefDateBuild write FsealRefDateBuild;
    property sealRefCost : TXSDecimal read FsealRefCost write FsealRefCost;
    property sealRefScCode : Integer read FsealRefScCode write FsealRefScCode;
    property sealRefInstallOrderNumber : WideString read FsealRefInstallOrderNumber write FsealRefInstallOrderNumber;
    property sealRefCostOld : TXSDecimal read FsealRefCostOld write FsealRefCostOld;
    property sealRefUserAdd : WideString read FsealRefUserAdd write FsealRefUserAdd;
    property sealRefDateAdd : TXSDateTime read FsealRefDateAdd write FsealRefDateAdd;
    property sealRefUserGen : WideString read FsealRefUserGen write FsealRefUserGen;
    property sealRefDateEdit : TXSDateTime read FsealRefDateEdit write FsealRefDateEdit;
    property workOrderBytRefCode : Integer read FworkOrderBytRefCode write FworkOrderBytRefCode;
    property workOrderBytRefNumberGen : WideString read FworkOrderBytRefNumberGen write FworkOrderBytRefNumberGen;
    property workOrderBytRefDateGen : TXSDate read FworkOrderBytRefDateGen write FworkOrderBytRefDateGen;
    property workOrderBytRefCommentGen : WideString read FworkOrderBytRefCommentGen write FworkOrderBytRefCommentGen;
    property workOrderBytRefDateAdd : TXSDateTime read FworkOrderBytRefDateAdd write FworkOrderBytRefDateAdd;
    property workOrderBytRefDateEdit : TXSDateTime read FworkOrderBytRefDateEdit write FworkOrderBytRefDateEdit;
    property workOrderBytRefUserAdd : WideString read FworkOrderBytRefUserAdd write FworkOrderBytRefUserAdd;
    property workOrderBytRefUserEdit : WideString read FworkOrderBytRefUserEdit write FworkOrderBytRefUserEdit;
    property workOrderBytItemRefCode : Integer read FworkOrderBytItemRefCode write FworkOrderBytItemRefCode;
    property workOrderBytItemRefContractNumberServices : WideString read FworkOrderBytItemRefContractNumberServices write FworkOrderBytItemRefContractNumberServices;
    property workOrderBytItemRefAccountNumber : WideString read FworkOrderBytItemRefAccountNumber write FworkOrderBytItemRefAccountNumber;
    property workOrderBytItemRefName : WideString read FworkOrderBytItemRefName write FworkOrderBytItemRefName;
    property workOrderBytItemRefCustomerName : WideString read FworkOrderBytItemRefCustomerName write FworkOrderBytItemRefCustomerName;
    property workOrderBytItemRefAddress : WideString read FworkOrderBytItemRefAddress write FworkOrderBytItemRefAddress;
    property workOrderBytItemRefInvNumber : WideString read FworkOrderBytItemRefInvNumber write FworkOrderBytItemRefInvNumber;
    property workOrderBytItemRefSerialNumber : WideString read FworkOrderBytItemRefSerialNumber write FworkOrderBytItemRefSerialNumber;
    property workOrderBytItemRefSeal : WideString read FworkOrderBytItemRefSeal write FworkOrderBytItemRefSeal;
    property workOrderBytItemRefPhone : WideString read FworkOrderBytItemRefPhone write FworkOrderBytItemRefPhone;
    property workOrderBytItemRefStatuscode : Integer read FworkOrderBytItemRefStatuscode write FworkOrderBytItemRefStatuscode;
    property workOrderBytItemRefRpCode : Integer read FworkOrderBytItemRefRpCode write FworkOrderBytItemRefRpCode;
    property workOrderBytItemRefDateCounterInst : TXSDate read FworkOrderBytItemRefDateCounterInst write FworkOrderBytItemRefDateCounterInst;
    property workOrderBytItemRefDateCounterCheck : TXSDate read FworkOrderBytItemRefDateCounterCheck write FworkOrderBytItemRefDateCounterCheck;
    property workOrderBytItemRefCounterType : WideString read FworkOrderBytItemRefCounterType write FworkOrderBytItemRefCounterType;
    property workOrderBytItemRefClassAccuracy : TXSDecimal read FworkOrderBytItemRefClassAccuracy write FworkOrderBytItemRefClassAccuracy;
    property workOrderBytItemRefCheckperiod : TXSDecimal read FworkOrderBytItemRefCheckperiod write FworkOrderBytItemRefCheckperiod;
    property workOrderBytItemRefRpStatusCode : Integer read FworkOrderBytItemRefRpStatusCode write FworkOrderBytItemRefRpStatusCode;
    property workOrderBytItemRefPhasity : TXSDecimal read FworkOrderBytItemRefPhasity write FworkOrderBytItemRefPhasity;
    property workOrderBytItemRefDatecheck : TXSDate read FworkOrderBytItemRefDatecheck write FworkOrderBytItemRefDatecheck;
    property workOrderBytItemRefCheckperiod1 : TXSDecimal read FworkOrderBytItemRefCheckperiod1 write FworkOrderBytItemRefCheckperiod1;
    property workOrderBytItemRefPlacecounter : WideString read FworkOrderBytItemRefPlacecounter write FworkOrderBytItemRefPlacecounter;
    property workOrderBytItemRefRpIsWorking : Integer read FworkOrderBytItemRefRpIsWorking write FworkOrderBytItemRefRpIsWorking;
    property workOrderBytItemRefRecordPointName : WideString read FworkOrderBytItemRefRecordPointName write FworkOrderBytItemRefRecordPointName;
    property workOrderBytItemRefRouteBytName : WideString read FworkOrderBytItemRefRouteBytName write FworkOrderBytItemRefRouteBytName;
    property workOrderBytItemRefRouteBytNumbergen : WideString read FworkOrderBytItemRefRouteBytNumbergen write FworkOrderBytItemRefRouteBytNumbergen;
    property workOrderBytItemRefCommentGen : WideString read FworkOrderBytItemRefCommentGen write FworkOrderBytItemRefCommentGen;
    property workOrderBytItemRefDateAdd : TXSDateTime read FworkOrderBytItemRefDateAdd write FworkOrderBytItemRefDateAdd;
    property workOrderBytItemRefDateEdit : TXSDateTime read FworkOrderBytItemRefDateEdit write FworkOrderBytItemRefDateEdit;
    property workOrderBytItemRefUserAdd : WideString read FworkOrderBytItemRefUserAdd write FworkOrderBytItemRefUserAdd;
    property workOrderBytItemRefUserEdit : WideString read FworkOrderBytItemRefUserEdit write FworkOrderBytItemRefUserEdit;
    property workOrderBytItemRefFactCode : Integer read FworkOrderBytItemRefFactCode write FworkOrderBytItemRefFactCode;
    property kindRefCode : Integer read FkindRefCode write FkindRefCode;
    property kindRefName : WideString read FkindRefName write FkindRefName;
    /////
    property estimateItemCode : Integer read FestimateItemCode write FestimateItemCode;
    property estimateItemCountFact : TXSDecimal read FestimateItemCountFact write FestimateItemCountFact;
    property estimateItemMaterialName : WideString read FestimateItemMaterialName write FestimateItemMaterialName;
    property sealsCountFact : TXSDecimal read FsealsCountFact write FsealsCountFact;
    property estimateItemCodes : WideString read FestimateItemCodes write FestimateItemCodes;

    property sealRefTypeCode : Integer read FsealRefTypeCode write FsealRefTypeCode;
    property sealRefTypeName : WideString read FsealRefTypeName write FsealRefTypeName;

    // Имя потребителя + наименование точки учета (для юр. лиц)
    property workOrderBytItemRefCustomerNameFull : WideString read FworkOrderBytItemRefCustomerNameFull write FworkOrderBytItemRefCustomerNameFull;
    /////
  end;

  ArrayOfSCSeal2ENWorkOrderBytShort = array of SCSeal2ENWorkOrderBytShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCSeal2ENWorkOrderBytShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCSeal2ENWorkOrderBytShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCSeal2ENWorkOrderBytShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCSeal2ENWorkOrderBytController/message/
  // soapAction: http://ksoe.org/SCSeal2ENWorkOrderBytController/action/SCSeal2ENWorkOrderBytController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCSeal2ENWorkOrderBytControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCSeal2ENWorkOrderBytController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCSeal2ENWorkOrderBytControllerSoapPort = interface(IInvokable)
  ['{0A2955AF-A873-4BBA-9CCA-A8AE1478CA6E}']
    function add(const aSCSeal2ENWorkOrderByt: SCSeal2ENWorkOrderByt): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCSeal2ENWorkOrderByt: SCSeal2ENWorkOrderByt); stdcall;
    function getObject(const anObjectCode: Integer): SCSeal2ENWorkOrderByt; stdcall;
    function getList: SCSeal2ENWorkOrderBytShortList; stdcall;
    function getFilteredList(const aSCSeal2ENWorkOrderBytFilter: SCSeal2ENWorkOrderBytFilter): SCSeal2ENWorkOrderBytShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCSeal2ENWorkOrderBytShortList; stdcall;
    function getScrollableFilteredList(const aSCSeal2ENWorkOrderBytFilter: SCSeal2ENWorkOrderBytFilter; const aFromPosition: Integer; const aQuantity: Integer): SCSeal2ENWorkOrderBytShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCSeal2ENWorkOrderBytShortList; stdcall;
    function getScrollableFilteredCodeArray(const aSCSeal2ENWorkOrderBytFilter: SCSeal2ENWorkOrderBytFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): SCSeal2ENWorkOrderBytShort; stdcall;

    function getSealsListForWorkOrderByt(const aWorkOrderBytCode: Integer): SCSeal2ENWorkOrderBytShortList; stdcall;
    function getWorkOrderBytItemsForSealsBinding(const aWorkOrderBytCode: Integer; const anAccountingTypeCode: Integer): SCSeal2ENWorkOrderBytShortList; stdcall;

    procedure moveSealToUnused(const aSCSeal2ENWorkOrderBytCode: Integer); stdcall;
    procedure moveSealToSpoiled(const aSCSeal2ENWorkOrderBytCode: Integer); stdcall;
    procedure rebindSeal(const aSCSeal2ENWorkOrderBytCode: Integer; const aEstimateItemCodes: WideString); stdcall;
    procedure rebindSealForRaid(const aSCSeal2ENWorkOrderBytCode: Integer; const aEstimateItemCodes: WideString;
                                const anAccountNumber: WideString; const aCustomerName: WideString); stdcall;
  end;


implementation

  destructor SCSeal2ENWorkOrderByt.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsealRef) then
      sealRef.Free;
    if Assigned(FworkOrderBytRef) then
      workOrderBytRef.Free;
    if Assigned(FworkOrderBytItemRef) then
      workOrderBytItemRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;

{
  destructor SCSeal2ENWorkOrderBytFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsealRef) then
      sealRef.Free;
    if Assigned(FworkOrderBytRef) then
      workOrderBytRef.Free;
    if Assigned(FworkOrderBytItemRef) then
      workOrderBytItemRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;
}

  destructor SCSeal2ENWorkOrderBytFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor SCSeal2ENWorkOrderBytShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsealRefDateIn) then
      sealRefDateIn.Free;
    if Assigned(FsealRefDateBuild) then
      sealRefDateBuild.Free;
    if Assigned(FsealRefCost) then
      sealRefCost.Free;
    if Assigned(FsealRefCostOld) then
      sealRefCostOld.Free;
    if Assigned(FsealRefDateAdd) then
      sealRefDateAdd.Free;
    if Assigned(FsealRefDateEdit) then
      sealRefDateEdit.Free;
    if Assigned(FworkOrderBytRefDateGen) then
      workOrderBytRefDateGen.Free;
    if Assigned(FworkOrderBytRefDateAdd) then
      workOrderBytRefDateAdd.Free;
    if Assigned(FworkOrderBytRefDateEdit) then
      workOrderBytRefDateEdit.Free;
    if Assigned(FworkOrderBytItemRefDateCounterInst) then
      workOrderBytItemRefDateCounterInst.Free;
    if Assigned(FworkOrderBytItemRefDateCounterCheck) then
      workOrderBytItemRefDateCounterCheck.Free;
    if Assigned(FworkOrderBytItemRefClassAccuracy) then
      workOrderBytItemRefClassAccuracy.Free;
    if Assigned(FworkOrderBytItemRefCheckperiod) then
      workOrderBytItemRefCheckperiod.Free;
    if Assigned(FworkOrderBytItemRefPhasity) then
      workOrderBytItemRefPhasity.Free;
    if Assigned(FworkOrderBytItemRefDatecheck) then
      workOrderBytItemRefDatecheck.Free;
    if Assigned(FworkOrderBytItemRefCheckperiod1) then
      workOrderBytItemRefCheckperiod1.Free;
    if Assigned(FworkOrderBytItemRefDateAdd) then
      workOrderBytItemRefDateAdd.Free;
    if Assigned(FworkOrderBytItemRefDateEdit) then
      workOrderBytItemRefDateEdit.Free;
    if Assigned(FestimateItemCountFact) then
      estimateItemCountFact.Free;
    if Assigned(FsealsCountFact) then
      sealsCountFact.Free;
    inherited Destroy;
  end;

  destructor SCSeal2ENWorkOrderBytShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCSeal2ENWorkOrderByt, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSeal2ENWorkOrderByt');
  RemClassRegistry.RegisterXSClass(SCSeal2ENWorkOrderBytRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSeal2ENWorkOrderBytRef');
  RemClassRegistry.RegisterXSClass(SCSeal2ENWorkOrderBytFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSeal2ENWorkOrderBytFilter');
  RemClassRegistry.RegisterXSClass(SCSeal2ENWorkOrderBytShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSeal2ENWorkOrderBytShort');
  RemClassRegistry.RegisterXSClass(SCSeal2ENWorkOrderBytShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSeal2ENWorkOrderBytShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCSeal2ENWorkOrderBytShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCSeal2ENWorkOrderBytShort');

  InvRegistry.RegisterInterface(TypeInfo(SCSeal2ENWorkOrderBytControllerSoapPort), 'http://ksoe.org/SCSeal2ENWorkOrderBytController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCSeal2ENWorkOrderBytControllerSoapPort), 'http://ksoe.org/SCSeal2ENWorkOrderBytController/action/SCSeal2ENWorkOrderBytController.%operationName%');


end.
