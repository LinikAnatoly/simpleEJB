unit RQPlanPayKindController;

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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  RQPlanPayKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPayKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPayKind = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FtxtGen : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property txtGen : WideString read FtxtGen write FtxtGen;
  end;

{
  RQPlanPayKindFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FtxtGen : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property txtGen : WideString read FtxtGen write FtxtGen;
  end;
}

  RQPlanPayKindFilter = class(RQPlanPayKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPlanPayKindShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FtxtGen : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property txtGen : WideString read FtxtGen write FtxtGen;

  end;

  ArrayOfRQPlanPayKindShort = array of RQPlanPayKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPlanPayKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPlanPayKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPlanPayKindShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPlanPayKindController/message/
  // soapAction: http://ksoe.org/RQPlanPayKindController/action/RQPlanPayKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPlanPayKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPlanPayKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPlanPayKindControllerSoapPort = interface(IInvokable)
  ['{155d155d-155d-155d-155d-155d155d155d}']
    function add(const aRQPlanPayKind: RQPlanPayKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPlanPayKind: RQPlanPayKind); stdcall;
    function getObject(const anObjectCode: Integer): RQPlanPayKind; stdcall;
    function getList: RQPlanPayKindShortList; stdcall;
    function getFilteredList(const aRQPlanPayKindFilter: RQPlanPayKindFilter): RQPlanPayKindShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayKindShortList; stdcall;
    function getScrollableFilteredList(const aRQPlanPayKindFilter: RQPlanPayKindFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayKindShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayKindShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPlanPayKindFilter: RQPlanPayKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPlanPayKindShort; stdcall;
  end;


implementation



  destructor RQPlanPayKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPlanPayKind, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayKind');
  RemClassRegistry.RegisterXSClass(RQPlanPayKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayKindRef');
  RemClassRegistry.RegisterXSClass(RQPlanPayKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayKindFilter');
  RemClassRegistry.RegisterXSClass(RQPlanPayKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayKindShort');
  RemClassRegistry.RegisterXSClass(RQPlanPayKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPlanPayKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPlanPayKindShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPlanPayKindControllerSoapPort), 'http://ksoe.org/RQPlanPayKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPlanPayKindControllerSoapPort), 'http://ksoe.org/RQPlanPayKindController/action/RQPlanPayKindController.%operationName%');


end.
