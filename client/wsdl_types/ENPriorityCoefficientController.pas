unit ENPriorityCoefficientController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
  , ENElementTypeController
  , ENPriorityCoeffTypeController
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

  ENPriorityCoefficient            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPriorityCoefficientRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPriorityCoefficient = class(TRemotable)
  private
    Fcode : Integer;
    Fvalue6 : TXSDecimal;
    Fvalue35 : TXSDecimal;
    Fvalue150 : TXSDecimal;
    Fmodify_time : Int64;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FelementTypeRef : ENElementTypeRef;
//???
    FcoeffTypeRef : ENPriorityCoeffTypeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property value6 : TXSDecimal read Fvalue6 write Fvalue6;
    property value35 : TXSDecimal read Fvalue35 write Fvalue35;
    property value150 : TXSDecimal read Fvalue150 write Fvalue150;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property elementTypeRef : ENElementTypeRef read FelementTypeRef write FelementTypeRef;
    property coeffTypeRef : ENPriorityCoeffTypeRef read FcoeffTypeRef write FcoeffTypeRef;
  end;

{
  ENPriorityCoefficientFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fvalue6 : TXSDecimal;
    Fvalue35 : TXSDecimal;
    Fvalue150 : TXSDecimal;
    Fmodify_time : Int64;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FelementTypeRef : ENElementTypeRef;
//???
    FcoeffTypeRef : ENPriorityCoeffTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property value6 : TXSDecimal read Fvalue6 write Fvalue6;
    property value35 : TXSDecimal read Fvalue35 write Fvalue35;
    property value150 : TXSDecimal read Fvalue150 write Fvalue150;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property elementTypeRef : ENElementTypeRef read FelementTypeRef write FelementTypeRef;
    property coeffTypeRef : ENPriorityCoeffTypeRef read FcoeffTypeRef write FcoeffTypeRef;
  end;
}

  ENPriorityCoefficientFilter = class(ENPriorityCoefficient)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPriorityCoefficientShort = class(TRemotable)
  private
    Fcode : Integer;
    Fvalue6 : TXSDecimal;
    Fvalue35 : TXSDecimal;
    Fvalue150 : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FelementTypeRefCode : Integer;
    FelementTypeRefName : WideString;
    FcoeffTypeRefCode : Integer;
    FcoeffTypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property value6 : TXSDecimal read Fvalue6 write Fvalue6;
    property value35 : TXSDecimal read Fvalue35 write Fvalue35;
    property value150 : TXSDecimal read Fvalue150 write Fvalue150;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property elementTypeRefCode : Integer read FelementTypeRefCode write FelementTypeRefCode;
    property elementTypeRefName : WideString read FelementTypeRefName write FelementTypeRefName;
    property coeffTypeRefCode : Integer read FcoeffTypeRefCode write FcoeffTypeRefCode;
    property coeffTypeRefName : WideString read FcoeffTypeRefName write FcoeffTypeRefName;
  end;

  ArrayOfENPriorityCoefficientShort = array of ENPriorityCoefficientShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPriorityCoefficientShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPriorityCoefficientShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPriorityCoefficientShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPriorityCoefficientController/message/
  // soapAction: http://ksoe.org/ENPriorityCoefficientController/action/ENPriorityCoefficientController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPriorityCoefficientControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPriorityCoefficientController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPriorityCoefficientControllerSoapPort = interface(IInvokable)
  ['{A5CE0CEE-6407-43FC-8B49-D2DCF1419806}']
    function add(const aENPriorityCoefficient: ENPriorityCoefficient): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPriorityCoefficient: ENPriorityCoefficient); stdcall;
    function getObject(const anObjectCode: Integer): ENPriorityCoefficient; stdcall;
    function getList: ENPriorityCoefficientShortList; stdcall;
    function getFilteredList(const aENPriorityCoefficientFilter: ENPriorityCoefficientFilter): ENPriorityCoefficientShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPriorityCoefficientShortList; stdcall;
    function getScrollableFilteredList(const aENPriorityCoefficientFilter: ENPriorityCoefficientFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPriorityCoefficientShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPriorityCoefficientShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPriorityCoefficientFilter: ENPriorityCoefficientFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPriorityCoefficientShort; stdcall;
  end;


implementation

  destructor ENPriorityCoefficient.Destroy;
  begin
    if Assigned(Fvalue6) then
      value6.Free;
    if Assigned(Fvalue35) then
      value35.Free;
    if Assigned(Fvalue150) then
      value150.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementTypeRef) then
      elementTypeRef.Free;
    if Assigned(FcoeffTypeRef) then
      coeffTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPriorityCoefficientFilter.Destroy;
  begin
    if Assigned(Fvalue6) then
      value6.Free;
    if Assigned(Fvalue35) then
      value35.Free;
    if Assigned(Fvalue150) then
      value150.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementTypeRef) then
      elementTypeRef.Free;
    if Assigned(FcoeffTypeRef) then
      coeffTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPriorityCoefficientFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPriorityCoefficientShort.Destroy;
  begin
    if Assigned(Fvalue6) then
      value6.Free;
    if Assigned(Fvalue35) then
      value35.Free;
    if Assigned(Fvalue150) then
      value150.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENPriorityCoefficientShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPriorityCoefficient, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriorityCoefficient');
  RemClassRegistry.RegisterXSClass(ENPriorityCoefficientRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriorityCoefficientRef');
  RemClassRegistry.RegisterXSClass(ENPriorityCoefficientFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriorityCoefficientFilter');
  RemClassRegistry.RegisterXSClass(ENPriorityCoefficientShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriorityCoefficientShort');
  RemClassRegistry.RegisterXSClass(ENPriorityCoefficientShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriorityCoefficientShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPriorityCoefficientShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPriorityCoefficientShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPriorityCoefficientControllerSoapPort), 'http://ksoe.org/ENPriorityCoefficientController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPriorityCoefficientControllerSoapPort), 'http://ksoe.org/ENPriorityCoefficientController/action/ENPriorityCoefficientController.%operationName%');


end.
