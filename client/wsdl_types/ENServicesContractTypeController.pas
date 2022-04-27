unit ENServicesContractTypeController;

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

  ENServicesContractType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesContractTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesContractType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENServicesContractTypeFilter = class(TRemotable)
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

  ENServicesContractTypeFilter = class(ENServicesContractType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENServicesContractTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENServicesContractTypeShort = array of ENServicesContractTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesContractTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesContractTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesContractTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesContractTypeController/message/
  // soapAction: http://ksoe.org/ENServicesContractTypeController/action/ENServicesContractTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesContractTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesContractTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesContractTypeControllerSoapPort = interface(IInvokable)
  ['{6d4b6d4b-6d4b-6d4b-6d4b-6d4b6d4b6d4b}']
    function  add(const aENServicesContractType: ENServicesContractType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesContractType: ENServicesContractType); stdcall;
    function  getObject(const anObjectCode: Integer): ENServicesContractType; stdcall;
    function  getList: ENServicesContractTypeShortList; stdcall;
    function  getFilteredList(const aENServicesContractTypeFilter: ENServicesContractTypeFilter): ENServicesContractTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesContractTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENServicesContractTypeFilter: ENServicesContractTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesContractTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesContractTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENServicesContractTypeFilter: ENServicesContractTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENServicesContractTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesContractType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractType');
  RemClassRegistry.RegisterXSClass(ENServicesContractTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractTypeRef');
  RemClassRegistry.RegisterXSClass(ENServicesContractTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractTypeFilter');
  RemClassRegistry.RegisterXSClass(ENServicesContractTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractTypeShort');
  RemClassRegistry.RegisterXSClass(ENServicesContractTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesContractTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesContractTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesContractTypeControllerSoapPort), 'http://ksoe.org/ENServicesContractTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesContractTypeControllerSoapPort), 'http://ksoe.org/ENServicesContractTypeController/action/ENServicesContractTypeController.%operationName%');


end.
