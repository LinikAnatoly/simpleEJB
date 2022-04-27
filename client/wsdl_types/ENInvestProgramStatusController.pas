unit ENInvestProgramStatusController;

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

  ENInvestProgramStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInvestProgramStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInvestProgramStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENInvestProgramStatusFilter = class(TRemotable)
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

  ENInvestProgramStatusFilter = class(ENInvestProgramStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENInvestProgramStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENInvestProgramStatusShort = array of ENInvestProgramStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENInvestProgramStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENInvestProgramStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENInvestProgramStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENInvestProgramStatusController/message/
  // soapAction: http://ksoe.org/ENInvestProgramStatusController/action/ENInvestProgramStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENInvestProgramStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENInvestProgramStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENInvestProgramStatusControllerSoapPort = interface(IInvokable)
  ['{ca37ca37-ca37-ca37-ca37-ca37ca37ca37}']
    function add(const aENInvestProgramStatus: ENInvestProgramStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENInvestProgramStatus: ENInvestProgramStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENInvestProgramStatus; stdcall;
    function getList: ENInvestProgramStatusShortList; stdcall;
    function getFilteredList(const aENInvestProgramStatusFilter: ENInvestProgramStatusFilter): ENInvestProgramStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgramStatusShortList; stdcall;
    function getScrollableFilteredList(const aENInvestProgramStatusFilter: ENInvestProgramStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgramStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgramStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENInvestProgramStatusFilter: ENInvestProgramStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENInvestProgramStatusShort; stdcall;
  end;


implementation



  destructor ENInvestProgramStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENInvestProgramStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramStatus');
  RemClassRegistry.RegisterXSClass(ENInvestProgramStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramStatusRef');
  RemClassRegistry.RegisterXSClass(ENInvestProgramStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramStatusFilter');
  RemClassRegistry.RegisterXSClass(ENInvestProgramStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramStatusShort');
  RemClassRegistry.RegisterXSClass(ENInvestProgramStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENInvestProgramStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENInvestProgramStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENInvestProgramStatusControllerSoapPort), 'http://ksoe.org/ENInvestProgramStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENInvestProgramStatusControllerSoapPort), 'http://ksoe.org/ENInvestProgramStatusController/action/ENInvestProgramStatusController.%operationName%');


end.
