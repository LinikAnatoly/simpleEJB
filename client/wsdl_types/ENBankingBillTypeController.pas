unit ENBankingBillTypeController;

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

  ENBankingBillType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBankingBillTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBankingBillType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENBankingBillTypeFilter = class(TRemotable)
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

  ENBankingBillTypeFilter = class(ENBankingBillType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBankingBillTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENBankingBillTypeShort = array of ENBankingBillTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBankingBillTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBankingBillTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBankingBillTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBankingBillTypeController/message/
  // soapAction: http://ksoe.org/ENBankingBillTypeController/action/ENBankingBillTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBankingBillTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBankingBillTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBankingBillTypeControllerSoapPort = interface(IInvokable)
  ['{1f441f44-1f44-1f44-1f44-1f441f441f44}']
    function add(const aENBankingBillType: ENBankingBillType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBankingBillType: ENBankingBillType); stdcall;
    function getObject(const anObjectCode: Integer): ENBankingBillType; stdcall;
    function getList: ENBankingBillTypeShortList; stdcall;
    function getFilteredList(const aENBankingBillTypeFilter: ENBankingBillTypeFilter): ENBankingBillTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBankingBillTypeShortList; stdcall;
    function getScrollableFilteredList(const aENBankingBillTypeFilter: ENBankingBillTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBankingBillTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBankingBillTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBankingBillTypeFilter: ENBankingBillTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBankingBillTypeShort; stdcall;
  end;


implementation



  destructor ENBankingBillTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBankingBillType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBankingBillType');
  RemClassRegistry.RegisterXSClass(ENBankingBillTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBankingBillTypeRef');
  RemClassRegistry.RegisterXSClass(ENBankingBillTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBankingBillTypeFilter');
  RemClassRegistry.RegisterXSClass(ENBankingBillTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBankingBillTypeShort');
  RemClassRegistry.RegisterXSClass(ENBankingBillTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBankingBillTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBankingBillTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBankingBillTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBankingBillTypeControllerSoapPort), 'http://ksoe.org/ENBankingBillTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBankingBillTypeControllerSoapPort), 'http://ksoe.org/ENBankingBillTypeController/action/ENBankingBillTypeController.%operationName%');


end.
