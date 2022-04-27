unit ENCalcPowerReserveItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENCalcPowerReserveController
   ,ENSO2NodeController
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

  ENCalcPowerReserveItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCalcPowerReserveItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCalcPowerReserveItem = class(TRemotable)
  private
    Fcode : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FcalcPowerReserveRef : ENCalcPowerReserveRef;
//???
    Fso2nodeRef : ENSO2NodeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property calcPowerReserveRef : ENCalcPowerReserveRef read FcalcPowerReserveRef write FcalcPowerReserveRef;
    property so2nodeRef : ENSO2NodeRef read Fso2nodeRef write Fso2nodeRef;
  end;

{
  ENCalcPowerReserveItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FcalcPowerReserveRef : ENCalcPowerReserveRef;
//???
    Fso2nodeRef : ENSO2NodeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property calcPowerReserveRef : ENCalcPowerReserveRef read FcalcPowerReserveRef write FcalcPowerReserveRef;
    property so2nodeRef : ENSO2NodeRef read Fso2nodeRef write Fso2nodeRef;
  end;
}

  ENCalcPowerReserveItemFilter = class(ENCalcPowerReserveItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCalcPowerReserveItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FcalcPowerReserveRefCode : Integer;
    FcalcPowerReserveRefUserGen : WideString;
    FcalcPowerReserveRefDateEdit : TXSDateTime;
    Fso2nodeRefCode : Integer;
    Fso2nodeRefCcNodeCode : Integer;
    Fso2nodeRefPower : TXSDecimal;
    Fso2nodeRefDescription : WideString;
    Fso2nodeRefIsCalc : Integer;
    Fso2nodeRefUserGen : WideString;
    Fso2nodeRefDateEdit : TXSDateTime;
    FsoContract : WideString;
    Ftechconditions : WideString;
    FsoContragentName : WideString;
    FsoName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property calcPowerReserveRefCode : Integer read FcalcPowerReserveRefCode write FcalcPowerReserveRefCode;
    property calcPowerReserveRefUserGen : WideString read FcalcPowerReserveRefUserGen write FcalcPowerReserveRefUserGen;
    property calcPowerReserveRefDateEdit : TXSDateTime read FcalcPowerReserveRefDateEdit write FcalcPowerReserveRefDateEdit;
    property so2nodeRefCode : Integer read Fso2nodeRefCode write Fso2nodeRefCode;
    property so2nodeRefCcNodeCode : Integer read Fso2nodeRefCcNodeCode write Fso2nodeRefCcNodeCode;
    property so2nodeRefPower : TXSDecimal read Fso2nodeRefPower write Fso2nodeRefPower;
    property so2nodeRefDescription : WideString read Fso2nodeRefDescription write Fso2nodeRefDescription;
    property so2nodeRefIsCalc : Integer read Fso2nodeRefIsCalc write Fso2nodeRefIsCalc;
    property so2nodeRefUserGen : WideString read Fso2nodeRefUserGen write Fso2nodeRefUserGen;
    property so2nodeRefDateEdit : TXSDateTime read Fso2nodeRefDateEdit write Fso2nodeRefDateEdit;
    property soContract : WideString read FsoContract write FsoContract;
    property techconditions : WideString read Ftechconditions write Ftechconditions;
    property soContragentName : WideString read FsoContragentName write FsoContragentName;
    property soName : WideString read FsoName write FsoName;
  end;

  ArrayOfENCalcPowerReserveItemShort = array of ENCalcPowerReserveItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCalcPowerReserveItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCalcPowerReserveItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCalcPowerReserveItemShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCalcPowerReserveItemController/message/
  // soapAction: http://ksoe.org/ENCalcPowerReserveItemController/action/ENCalcPowerReserveItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCalcPowerReserveItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCalcPowerReserveItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCalcPowerReserveItemControllerSoapPort = interface(IInvokable)
  ['{3B8332BE-1C31-4481-9313-36A970043852}']
    function add(const aENCalcPowerReserveItem: ENCalcPowerReserveItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCalcPowerReserveItem: ENCalcPowerReserveItem); stdcall;
    function getObject(const anObjectCode: Integer): ENCalcPowerReserveItem; stdcall;
    function getList: ENCalcPowerReserveItemShortList; stdcall;
    function getFilteredList(const aENCalcPowerReserveItemFilter: ENCalcPowerReserveItemFilter): ENCalcPowerReserveItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCalcPowerReserveItemShortList; stdcall;
    function getScrollableFilteredList(const aENCalcPowerReserveItemFilter: ENCalcPowerReserveItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCalcPowerReserveItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCalcPowerReserveItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENCalcPowerReserveItemFilter: ENCalcPowerReserveItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENCalcPowerReserveItemShort; stdcall;
  end;


implementation

  destructor ENCalcPowerReserveItem.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcalcPowerReserveRef) then
      calcPowerReserveRef.Free;
    if Assigned(Fso2nodeRef) then
      so2nodeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENCalcPowerReserveItemFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcalcPowerReserveRef) then
      calcPowerReserveRef.Free;
    if Assigned(Fso2nodeRef) then
      so2nodeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENCalcPowerReserveItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENCalcPowerReserveItemShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcalcPowerReserveRefDateEdit) then
      calcPowerReserveRefDateEdit.Free;
    if Assigned(Fso2nodeRefPower) then
      so2nodeRefPower.Free;
    if Assigned(Fso2nodeRefDateEdit) then
      so2nodeRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENCalcPowerReserveItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCalcPowerReserveItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcPowerReserveItem');
  RemClassRegistry.RegisterXSClass(ENCalcPowerReserveItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcPowerReserveItemRef');
  RemClassRegistry.RegisterXSClass(ENCalcPowerReserveItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcPowerReserveItemFilter');
  RemClassRegistry.RegisterXSClass(ENCalcPowerReserveItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcPowerReserveItemShort');
  RemClassRegistry.RegisterXSClass(ENCalcPowerReserveItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCalcPowerReserveItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCalcPowerReserveItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCalcPowerReserveItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCalcPowerReserveItemControllerSoapPort), 'http://ksoe.org/ENCalcPowerReserveItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCalcPowerReserveItemControllerSoapPort), 'http://ksoe.org/ENCalcPowerReserveItemController/action/ENCalcPowerReserveItemController.%operationName%');


end.
