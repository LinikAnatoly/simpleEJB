unit ENFuelInvResultController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENFuelInventarizationController
   ,TKFuelTypeController
   ,ENFuelInvResultTypeController
   ,RQFKOrderItemController
   ,ENEstimateItemController
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

  ENFuelInvResult            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelInvResultRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelInvResult = class(TRemotable)
  private
    Fcode : Integer;
    FdeltaCount : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FinventarizationRef : ENFuelInventarizationRef;
//???
    FfuelTypeRef : TKFuelTypeRef;
//???
    FtypeRef : ENFuelInvResultTypeRef;
//???
    FfkorderitemRef : RQFKOrderItemRef;
//???
    FestimateItemRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property deltaCount : TXSDecimal read FdeltaCount write FdeltaCount;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property inventarizationRef : ENFuelInventarizationRef read FinventarizationRef write FinventarizationRef;
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef;
    property typeRef : ENFuelInvResultTypeRef read FtypeRef write FtypeRef;
    property fkorderitemRef : RQFKOrderItemRef read FfkorderitemRef write FfkorderitemRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
  end;

{
  ENFuelInvResultFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdeltaCount : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FinventarizationRef : ENFuelInventarizationRef;
//???
    FfuelTypeRef : TKFuelTypeRef;
//???
    FtypeRef : ENFuelInvResultTypeRef;
//???
    FfkorderitemRef : RQFKOrderItemRef;
//???
    FestimateItemRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property deltaCount : TXSDecimal read FdeltaCount write FdeltaCount;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property inventarizationRef : ENFuelInventarizationRef read FinventarizationRef write FinventarizationRef;
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef;
    property typeRef : ENFuelInvResultTypeRef read FtypeRef write FtypeRef;
    property fkorderitemRef : RQFKOrderItemRef read FfkorderitemRef write FfkorderitemRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
  end;
}

  ENFuelInvResultFilter = class(ENFuelInvResult)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFuelInvResultShort = class(TRemotable)
  private
    Fcode : Integer;
    FdeltaCount : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FinventarizationRefCode : Integer;
    FinventarizationRefNumberGen : WideString;
    FinventarizationRefDateGen : TXSDateTime;
    FinventarizationRefMolCode : WideString;
    FinventarizationRefMolName : WideString;
    FinventarizationRefCommentGen : WideString;
    FinventarizationRefUserAdd : WideString;
    FinventarizationRefDateAdd : TXSDateTime;
    FinventarizationRefUserGen : WideString;
    FinventarizationRefDateEdit : TXSDateTime;
    FfuelTypeRefCode : Integer;
    FfuelTypeRefName : WideString;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
    FfkorderitemRefCode : Integer;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property deltaCount : TXSDecimal read FdeltaCount write FdeltaCount;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property inventarizationRefCode : Integer read FinventarizationRefCode write FinventarizationRefCode;
    property inventarizationRefNumberGen : WideString read FinventarizationRefNumberGen write FinventarizationRefNumberGen;
    property inventarizationRefDateGen : TXSDateTime read FinventarizationRefDateGen write FinventarizationRefDateGen;
    property inventarizationRefMolCode : WideString read FinventarizationRefMolCode write FinventarizationRefMolCode;
    property inventarizationRefMolName : WideString read FinventarizationRefMolName write FinventarizationRefMolName;
    property inventarizationRefCommentGen : WideString read FinventarizationRefCommentGen write FinventarizationRefCommentGen;
    property inventarizationRefUserAdd : WideString read FinventarizationRefUserAdd write FinventarizationRefUserAdd;
    property inventarizationRefDateAdd : TXSDateTime read FinventarizationRefDateAdd write FinventarizationRefDateAdd;
    property inventarizationRefUserGen : WideString read FinventarizationRefUserGen write FinventarizationRefUserGen;
    property inventarizationRefDateEdit : TXSDateTime read FinventarizationRefDateEdit write FinventarizationRefDateEdit;
    property fuelTypeRefCode : Integer read FfuelTypeRefCode write FfuelTypeRefCode;
    property fuelTypeRefName : WideString read FfuelTypeRefName write FfuelTypeRefName;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property fkorderitemRefCode : Integer read FfkorderitemRefCode write FfkorderitemRefCode; //RQFKOrderItemRef read FfkorderitemRefCode write FfkorderitemRefCode;
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
  end;

  ArrayOfENFuelInvResultShort = array of ENFuelInvResultShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFuelInvResultShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFuelInvResultShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFuelInvResultShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFuelInvResultController/message/
  // soapAction: http://ksoe.org/ENFuelInvResultController/action/ENFuelInvResultController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFuelInvResultControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFuelInvResultController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFuelInvResultControllerSoapPort = interface(IInvokable)
  ['{F08A389F-E224-4D8B-AE40-A0B334DFCE63}']
    function add(const aENFuelInvResult: ENFuelInvResult): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFuelInvResult: ENFuelInvResult); stdcall;
    function getObject(const anObjectCode: Integer): ENFuelInvResult; stdcall;
    function getList: ENFuelInvResultShortList; stdcall;
    function getFilteredList(const aENFuelInvResultFilter: ENFuelInvResultFilter): ENFuelInvResultShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFuelInvResultShortList; stdcall;
    function getScrollableFilteredList(const aENFuelInvResultFilter: ENFuelInvResultFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFuelInvResultShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFuelInvResultShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFuelInvResultFilter: ENFuelInvResultFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFuelInvResultShort; stdcall;
  end;


implementation

  destructor ENFuelInvResult.Destroy;
  begin
    if Assigned(FdeltaCount) then
      deltaCount.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FinventarizationRef) then
      inventarizationRef.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FfkorderitemRef) then
      fkorderitemRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    inherited Destroy;
  end;

{
  destructor ENFuelInvResultFilter.Destroy;
  begin
    if Assigned(FdeltaCount) then
      deltaCount.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FinventarizationRef) then
      inventarizationRef.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FfkorderitemRef) then
      fkorderitemRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    inherited Destroy;
  end;
}

  destructor ENFuelInvResultFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENFuelInvResultShort.Destroy;
  begin
    if Assigned(FdeltaCount) then
      deltaCount.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FinventarizationRefDateGen) then
      inventarizationRefDateGen.Free;
    if Assigned(FinventarizationRefDateAdd) then
      inventarizationRefDateAdd.Free;
    if Assigned(FinventarizationRefDateEdit) then
      inventarizationRefDateEdit.Free;
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
    inherited Destroy;
  end;

  destructor ENFuelInvResultShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFuelInvResult, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInvResult');
  RemClassRegistry.RegisterXSClass(ENFuelInvResultRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInvResultRef');
  RemClassRegistry.RegisterXSClass(ENFuelInvResultFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInvResultFilter');
  RemClassRegistry.RegisterXSClass(ENFuelInvResultShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInvResultShort');
  RemClassRegistry.RegisterXSClass(ENFuelInvResultShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInvResultShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFuelInvResultShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFuelInvResultShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFuelInvResultControllerSoapPort), 'http://ksoe.org/ENFuelInvResultController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFuelInvResultControllerSoapPort), 'http://ksoe.org/ENFuelInvResultController/action/ENFuelInvResultController.%operationName%');


end.
