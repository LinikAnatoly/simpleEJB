unit FKTrans2AXTransController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
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

  FKTrans2AXTrans            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FKTrans2AXTransRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FKTrans2AXTrans = class(TRemotable)
  private
    Fcode : Integer;
    FmonthGen : Integer;
    FyearGen : Integer;
    FtaskOwner : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property taskOwner : WideString read FtaskOwner write FtaskOwner;
  end;

{
  FKTrans2AXTransFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FmonthGen : Integer;
    FyearGen : Integer;
    FtaskOwner : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property taskOwner : WideString read FtaskOwner write FtaskOwner;
  end;
}

  FKTrans2AXTransFilter = class(FKTrans2AXTrans)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  FKTrans2AXTransShort = class(TRemotable)
  private
    Fcode : Integer;
    FmonthGen : Integer;
    FyearGen : Integer;
    FtaskOwner : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property taskOwner : WideString read FtaskOwner write FtaskOwner;

  end;

  ArrayOfFKTrans2AXTransShort = array of FKTrans2AXTransShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FKTrans2AXTransShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFKTrans2AXTransShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFKTrans2AXTransShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FKTrans2AXTransController/message/
  // soapAction: http://ksoe.org/FKTrans2AXTransController/action/FKTrans2AXTransController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FKTrans2AXTransControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FKTrans2AXTransController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FKTrans2AXTransControllerSoapPort = interface(IInvokable)
  ['{2aa92aa9-2aa9-2aa9-2aa9-2aa92aa92aa9}']
    function add(const aFKTrans2AXTrans: FKTrans2AXTrans): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFKTrans2AXTrans: FKTrans2AXTrans); stdcall;
    function getObject(const anObjectCode: Integer): FKTrans2AXTrans; stdcall;
    function getList: FKTrans2AXTransShortList; stdcall;
    function getFilteredList(const aFKTrans2AXTransFilter: FKTrans2AXTransFilter): FKTrans2AXTransShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FKTrans2AXTransShortList; stdcall;
    function getScrollableFilteredList(const aFKTrans2AXTransFilter: FKTrans2AXTransFilter; const aFromPosition: Integer; const aQuantity: Integer): FKTrans2AXTransShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FKTrans2AXTransShortList; stdcall;
    function getScrollableFilteredCodeArray(const aFKTrans2AXTransFilter: FKTrans2AXTransFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): FKTrans2AXTransShort; stdcall;

    procedure addFKTrans2EN(const FKTrans2AXTransCode: Integer); stdcall;

  end;


implementation



  destructor FKTrans2AXTransShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FKTrans2AXTrans, 'http://ksoe.org/EnergyproControllerService/type/', 'FKTrans2AXTrans');
  RemClassRegistry.RegisterXSClass(FKTrans2AXTransRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FKTrans2AXTransRef');
  RemClassRegistry.RegisterXSClass(FKTrans2AXTransFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FKTrans2AXTransFilter');
  RemClassRegistry.RegisterXSClass(FKTrans2AXTransShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FKTrans2AXTransShort');
  RemClassRegistry.RegisterXSClass(FKTrans2AXTransShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FKTrans2AXTransShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFKTrans2AXTransShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFKTrans2AXTransShort');

  InvRegistry.RegisterInterface(TypeInfo(FKTrans2AXTransControllerSoapPort), 'http://ksoe.org/FKTrans2AXTransController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FKTrans2AXTransControllerSoapPort), 'http://ksoe.org/FKTrans2AXTransController/action/FKTrans2AXTransController.%operationName%');


end.
