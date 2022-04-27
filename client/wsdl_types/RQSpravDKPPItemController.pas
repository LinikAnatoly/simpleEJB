unit RQSpravDKPPItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQSpravDKPPController
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

  RQSpravDKPPItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQSpravDKPPItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQSpravDKPPItem = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    Fname : WideString;
//???
    FspravDKPPRef : RQSpravDKPPRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property name : WideString read Fname write Fname;
    property spravDKPPRef : RQSpravDKPPRef read FspravDKPPRef write FspravDKPPRef;
  end;

{
  RQSpravDKPPItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    Fname : WideString;
//???
    FspravDKPPRef : RQSpravDKPPRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property name : WideString read Fname write Fname;
    property spravDKPPRef : RQSpravDKPPRef read FspravDKPPRef write FspravDKPPRef;
  end;
}

  RQSpravDKPPItemFilter = class(RQSpravDKPPItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQSpravDKPPItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    Fname : WideString;
    FspravDKPPRefCode : Integer;
    FspravDKPPRefName : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property name : WideString read Fname write Fname;

    property spravDKPPRefCode : Integer read FspravDKPPRefCode write FspravDKPPRefCode;
    property spravDKPPRefName : WideString read FspravDKPPRefName write FspravDKPPRefName;
  end;

  ArrayOfRQSpravDKPPItemShort = array of RQSpravDKPPItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQSpravDKPPItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQSpravDKPPItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQSpravDKPPItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQSpravDKPPItemController/message/
  // soapAction: http://ksoe.org/RQSpravDKPPItemController/action/RQSpravDKPPItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQSpravDKPPItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQSpravDKPPItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQSpravDKPPItemControllerSoapPort = interface(IInvokable)
  ['{FD3F7571-6C3A-40F8-82C9-A4D1006E83C1}']
    function add(const aRQSpravDKPPItem: RQSpravDKPPItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQSpravDKPPItem: RQSpravDKPPItem); stdcall;
    function getObject(const anObjectCode: Integer): RQSpravDKPPItem; stdcall;
    function getList: RQSpravDKPPItemShortList; stdcall;
    function getFilteredList(const aRQSpravDKPPItemFilter: RQSpravDKPPItemFilter): RQSpravDKPPItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQSpravDKPPItemShortList; stdcall;
    function getScrollableFilteredList(const aRQSpravDKPPItemFilter: RQSpravDKPPItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQSpravDKPPItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQSpravDKPPItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQSpravDKPPItemFilter: RQSpravDKPPItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQSpravDKPPItemShort; stdcall;
  end;


implementation

  destructor RQSpravDKPPItem.Destroy;
  begin
    if Assigned(FspravDKPPRef) then
      spravDKPPRef.Free;
    inherited Destroy;
  end;

{
  destructor RQSpravDKPPItemFilter.Destroy;
  begin
    if Assigned(FspravDKPPRef) then
      spravDKPPRef.Free;
    inherited Destroy;
  end;
}

  destructor RQSpravDKPPItemFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor RQSpravDKPPItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQSpravDKPPItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQSpravDKPPItem');
  RemClassRegistry.RegisterXSClass(RQSpravDKPPItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQSpravDKPPItemRef');
  RemClassRegistry.RegisterXSClass(RQSpravDKPPItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQSpravDKPPItemFilter');
  RemClassRegistry.RegisterXSClass(RQSpravDKPPItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQSpravDKPPItemShort');
  RemClassRegistry.RegisterXSClass(RQSpravDKPPItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQSpravDKPPItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQSpravDKPPItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQSpravDKPPItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQSpravDKPPItemControllerSoapPort), 'http://ksoe.org/RQSpravDKPPItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQSpravDKPPItemControllerSoapPort), 'http://ksoe.org/RQSpravDKPPItemController/action/RQSpravDKPPItemController.%operationName%');


end.
