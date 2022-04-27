unit ENInvestProgramGroupsController;

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

  ENInvestProgramGroups            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInvestProgramGroupsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInvestProgramGroups = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fcommentgen : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
  end;
  
{
  ENInvestProgramGroupsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fcommentgen : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
  end;
}

  ENInvestProgramGroupsFilter = class(ENInvestProgramGroups)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENInvestProgramGroupsShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fcommentgen : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentgen : WideString read Fcommentgen write Fcommentgen;

  end;

  ArrayOfENInvestProgramGroupsShort = array of ENInvestProgramGroupsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENInvestProgramGroupsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENInvestProgramGroupsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENInvestProgramGroupsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENInvestProgramGroupsController/message/
  // soapAction: http://ksoe.org/ENInvestProgramGroupsController/action/ENInvestProgramGroupsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENInvestProgramGroupsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENInvestProgramGroupsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENInvestProgramGroupsControllerSoapPort = interface(IInvokable)
  ['{15b015b0-15b0-15b0-15b0-15b015b015b0}']
    function  add(const aENInvestProgramGroups: ENInvestProgramGroups): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENInvestProgramGroups: ENInvestProgramGroups); stdcall;
    function  getObject(const anObjectCode: Integer): ENInvestProgramGroups; stdcall;
    function  getList: ENInvestProgramGroupsShortList; stdcall;
    function  getFilteredList(const aENInvestProgramGroupsFilter: ENInvestProgramGroupsFilter): ENInvestProgramGroupsShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgramGroupsShortList; stdcall;
    function  getScrollableFilteredList(const aENInvestProgramGroupsFilter: ENInvestProgramGroupsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgramGroupsShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgramGroupsShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENInvestProgramGroupsFilter: ENInvestProgramGroupsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENInvestProgramGroupsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENInvestProgramGroups, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramGroups');
  RemClassRegistry.RegisterXSClass(ENInvestProgramGroupsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramGroupsRef');
  RemClassRegistry.RegisterXSClass(ENInvestProgramGroupsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramGroupsFilter');
  RemClassRegistry.RegisterXSClass(ENInvestProgramGroupsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramGroupsShort');
  RemClassRegistry.RegisterXSClass(ENInvestProgramGroupsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramGroupsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENInvestProgramGroupsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENInvestProgramGroupsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENInvestProgramGroupsControllerSoapPort), 'http://ksoe.org/ENInvestProgramGroupsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENInvestProgramGroupsControllerSoapPort), 'http://ksoe.org/ENInvestProgramGroupsController/action/ENInvestProgramGroupsController.%operationName%');


end.
