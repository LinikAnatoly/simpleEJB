unit ENActIncomeCreatMetodController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
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

  ENActIncomeCreatMetod            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncomeCreatMetodRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncomeCreatMetod = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENActIncomeCreatMetodFilter = class(TRemotable)
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

  ENActIncomeCreatMetodFilter = class(ENActIncomeCreatMetod)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActIncomeCreatMetodShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENActIncomeCreatMetodShort = array of ENActIncomeCreatMetodShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActIncomeCreatMetodShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActIncomeCreatMetodShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActIncomeCreatMetodShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActIncomeCreatMetodController/message/
  // soapAction: http://ksoe.org/ENActIncomeCreatMetodController/action/ENActIncomeCreatMetodController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActIncomeCreatMetodControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActIncomeCreatMetodController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActIncomeCreatMetodControllerSoapPort = interface(IInvokable)
  ['{ED49CF82-6D61-4B3A-93BD-65F61B67D4BE}']
    function add(const aENActIncomeCreatMetod: ENActIncomeCreatMetod): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActIncomeCreatMetod: ENActIncomeCreatMetod); stdcall;
    function getObject(const anObjectCode: Integer): ENActIncomeCreatMetod; stdcall;
    function getList: ENActIncomeCreatMetodShortList; stdcall;
    function getFilteredList(const aENActIncomeCreatMetodFilter: ENActIncomeCreatMetodFilter): ENActIncomeCreatMetodShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeCreatMetodShortList; stdcall;
    function getScrollableFilteredList(const aENActIncomeCreatMetodFilter: ENActIncomeCreatMetodFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeCreatMetodShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeCreatMetodShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActIncomeCreatMetodFilter: ENActIncomeCreatMetodFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActIncomeCreatMetodShort; stdcall;
  end;


implementation



  destructor ENActIncomeCreatMetodShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActIncomeCreatMetod, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeCreatMetod');
  RemClassRegistry.RegisterXSClass(ENActIncomeCreatMetodRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeCreatMetodRef');
  RemClassRegistry.RegisterXSClass(ENActIncomeCreatMetodFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeCreatMetodFilter');
  RemClassRegistry.RegisterXSClass(ENActIncomeCreatMetodShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeCreatMetodShort');
  RemClassRegistry.RegisterXSClass(ENActIncomeCreatMetodShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeCreatMetodShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActIncomeCreatMetodShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActIncomeCreatMetodShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActIncomeCreatMetodControllerSoapPort), 'http://ksoe.org/ENActIncomeCreatMetodController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActIncomeCreatMetodControllerSoapPort), 'http://ksoe.org/ENActIncomeCreatMetodController/action/ENActIncomeCreatMetodController.%operationName%');


end.
