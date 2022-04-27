unit ENActIncomeStatusController;

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

  ENActIncomeStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncomeStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncomeStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENActIncomeStatusFilter = class(TRemotable)
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

  ENActIncomeStatusFilter = class(ENActIncomeStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENActIncomeStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENActIncomeStatusShort = array of ENActIncomeStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActIncomeStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActIncomeStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActIncomeStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActIncomeStatusController/message/
  // soapAction: http://ksoe.org/ENActIncomeStatusController/action/ENActIncomeStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActIncomeStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActIncomeStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActIncomeStatusControllerSoapPort = interface(IInvokable)
  ['{17a117a1-17a1-17a1-17a1-17a117a117a1}']
    function  add(const aENActIncomeStatus: ENActIncomeStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActIncomeStatus: ENActIncomeStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENActIncomeStatus; stdcall;
    function  getList: ENActIncomeStatusShortList; stdcall;
    function  getFilteredList(const aENActIncomeStatusFilter: ENActIncomeStatusFilter): ENActIncomeStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENActIncomeStatusFilter: ENActIncomeStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENActIncomeStatusFilter: ENActIncomeStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENActIncomeStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActIncomeStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeStatus');
  RemClassRegistry.RegisterXSClass(ENActIncomeStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeStatusRef');
  RemClassRegistry.RegisterXSClass(ENActIncomeStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeStatusFilter');
  RemClassRegistry.RegisterXSClass(ENActIncomeStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeStatusShort');
  RemClassRegistry.RegisterXSClass(ENActIncomeStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActIncomeStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActIncomeStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActIncomeStatusControllerSoapPort), 'http://ksoe.org/ENActIncomeStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActIncomeStatusControllerSoapPort), 'http://ksoe.org/ENActIncomeStatusController/action/ENActIncomeStatusController.%operationName%');


end.
