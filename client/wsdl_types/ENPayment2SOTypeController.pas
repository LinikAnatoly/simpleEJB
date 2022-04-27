unit ENPayment2SOTypeController;

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

  ENPayment2SOType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPayment2SOTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPayment2SOType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENPayment2SOTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;
}

  ENPayment2SOTypeFilter = class(ENPayment2SOType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPayment2SOTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPayment2SOTypeShort = array of ENPayment2SOTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPayment2SOTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPayment2SOTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPayment2SOTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPayment2SOTypeController/message/
  // soapAction: http://ksoe.org/ENPayment2SOTypeController/action/ENPayment2SOTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPayment2SOTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPayment2SOTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPayment2SOTypeControllerSoapPort = interface(IInvokable)
  ['{8aaf8aaf-8aaf-8aaf-8aaf-8aaf8aaf8aaf}']
    function add(const aENPayment2SOType: ENPayment2SOType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPayment2SOType: ENPayment2SOType); stdcall;
    function getObject(const anObjectCode: Integer): ENPayment2SOType; stdcall;
    function getList: ENPayment2SOTypeShortList; stdcall;
    function getFilteredList(const aENPayment2SOTypeFilter: ENPayment2SOTypeFilter): ENPayment2SOTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPayment2SOTypeShortList; stdcall;
    function getScrollableFilteredList(const aENPayment2SOTypeFilter: ENPayment2SOTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPayment2SOTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPayment2SOTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPayment2SOTypeFilter: ENPayment2SOTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPayment2SOTypeShort; stdcall;
  end;


implementation



  destructor ENPayment2SOTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPayment2SOType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPayment2SOType');
  RemClassRegistry.RegisterXSClass(ENPayment2SOTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPayment2SOTypeRef');
  RemClassRegistry.RegisterXSClass(ENPayment2SOTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPayment2SOTypeFilter');
  RemClassRegistry.RegisterXSClass(ENPayment2SOTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPayment2SOTypeShort');
  RemClassRegistry.RegisterXSClass(ENPayment2SOTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPayment2SOTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPayment2SOTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPayment2SOTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPayment2SOTypeControllerSoapPort), 'http://ksoe.org/ENPayment2SOTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPayment2SOTypeControllerSoapPort), 'http://ksoe.org/ENPayment2SOTypeController/action/ENPayment2SOTypeController.%operationName%');


end.
