unit ENServicesContractKindController;

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

  ENServicesContractKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesContractKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesContractKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENServicesContractKindFilter = class(TRemotable)
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

  ENServicesContractKindFilter = class(ENServicesContractKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENServicesContractKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENServicesContractKindShort = array of ENServicesContractKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesContractKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesContractKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesContractKindShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesContractKindController/message/
  // soapAction: http://ksoe.org/ENServicesContractKindController/action/ENServicesContractKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesContractKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesContractKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesContractKindControllerSoapPort = interface(IInvokable)
  ['{13ca13ca-13ca-13ca-13ca-13ca13ca13ca}']
    function  add(const aENServicesContractKind: ENServicesContractKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesContractKind: ENServicesContractKind); stdcall;
    function  getObject(const anObjectCode: Integer): ENServicesContractKind; stdcall;
    function  getList: ENServicesContractKindShortList; stdcall;
    function  getFilteredList(const aENServicesContractKindFilter: ENServicesContractKindFilter): ENServicesContractKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesContractKindShortList; stdcall;
    function  getScrollableFilteredList(const aENServicesContractKindFilter: ENServicesContractKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesContractKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesContractKindShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENServicesContractKindFilter: ENServicesContractKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENServicesContractKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesContractKind, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractKind');
  RemClassRegistry.RegisterXSClass(ENServicesContractKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractKindRef');
  RemClassRegistry.RegisterXSClass(ENServicesContractKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractKindFilter');
  RemClassRegistry.RegisterXSClass(ENServicesContractKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractKindShort');
  RemClassRegistry.RegisterXSClass(ENServicesContractKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContractKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesContractKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesContractKindShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesContractKindControllerSoapPort), 'http://ksoe.org/ENServicesContractKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesContractKindControllerSoapPort), 'http://ksoe.org/ENServicesContractKindController/action/ENServicesContractKindController.%operationName%');


end.
