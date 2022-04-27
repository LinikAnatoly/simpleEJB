unit ENIPPurposeProgramController;

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

  ENIPPurposeProgram            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPPurposeProgramRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPPurposeProgram = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENIPPurposeProgramFilter = class(TRemotable)
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

  ENIPPurposeProgramFilter = class(ENIPPurposeProgram)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENIPPurposeProgramShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENIPPurposeProgramShort = array of ENIPPurposeProgramShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENIPPurposeProgramShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENIPPurposeProgramShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENIPPurposeProgramShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENIPPurposeProgramController/message/
  // soapAction: http://ksoe.org/ENIPPurposeProgramController/action/ENIPPurposeProgramController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENIPPurposeProgramControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENIPPurposeProgramController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENIPPurposeProgramControllerSoapPort = interface(IInvokable)
  ['{f3b8f3b8-f3b8-f3b8-f3b8-f3b8f3b8f3b8}']
    function add(const aENIPPurposeProgram: ENIPPurposeProgram): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENIPPurposeProgram: ENIPPurposeProgram); stdcall;
    function getObject(const anObjectCode: Integer): ENIPPurposeProgram; stdcall;
    function getList: ENIPPurposeProgramShortList; stdcall;
    function getFilteredList(const aENIPPurposeProgramFilter: ENIPPurposeProgramFilter): ENIPPurposeProgramShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENIPPurposeProgramShortList; stdcall;
    function getScrollableFilteredList(const aENIPPurposeProgramFilter: ENIPPurposeProgramFilter; const aFromPosition: Integer; const aQuantity: Integer): ENIPPurposeProgramShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENIPPurposeProgramShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENIPPurposeProgramFilter: ENIPPurposeProgramFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENIPPurposeProgramShort; stdcall;
  end;


implementation



  destructor ENIPPurposeProgramShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENIPPurposeProgram, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPPurposeProgram');
  RemClassRegistry.RegisterXSClass(ENIPPurposeProgramRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPPurposeProgramRef');
  RemClassRegistry.RegisterXSClass(ENIPPurposeProgramFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPPurposeProgramFilter');
  RemClassRegistry.RegisterXSClass(ENIPPurposeProgramShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPPurposeProgramShort');
  RemClassRegistry.RegisterXSClass(ENIPPurposeProgramShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPPurposeProgramShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENIPPurposeProgramShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENIPPurposeProgramShort');

  InvRegistry.RegisterInterface(TypeInfo(ENIPPurposeProgramControllerSoapPort), 'http://ksoe.org/ENIPPurposeProgramController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENIPPurposeProgramControllerSoapPort), 'http://ksoe.org/ENIPPurposeProgramController/action/ENIPPurposeProgramController.%operationName%');


end.
