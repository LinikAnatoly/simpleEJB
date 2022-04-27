unit ENServicesContragentTypeController;

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

  ENServicesContragentType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesContragentTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesContragentType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENServicesContragentTypeFilter = class(TRemotable)
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

  ENServicesContragentTypeFilter = class(ENServicesContragentType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENServicesContragentTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENServicesContragentTypeShort = array of ENServicesContragentTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesContragentTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesContragentTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesContragentTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesContragentTypeController/message/
  // soapAction: http://ksoe.org/ENServicesContragentTypeController/action/ENServicesContragentTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesContragentTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesContragentTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesContragentTypeControllerSoapPort = interface(IInvokable)
  ['{a297a297-a297-a297-a297-a297a297a297}']
    function  add(const aENServicesContragentType: ENServicesContragentType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesContragentType: ENServicesContragentType); stdcall;
    function  getObject(const anObjectCode: Integer): ENServicesContragentType; stdcall;
    function  getList: ENServicesContragentTypeShortList; stdcall;
    function  getFilteredList(const aENServicesContragentTypeFilter: ENServicesContragentTypeFilter): ENServicesContragentTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesContragentTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENServicesContragentTypeFilter: ENServicesContragentTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesContragentTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesContragentTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENServicesContragentTypeFilter: ENServicesContragentTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENServicesContragentTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesContragentType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContragentType');
  RemClassRegistry.RegisterXSClass(ENServicesContragentTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContragentTypeRef');
  RemClassRegistry.RegisterXSClass(ENServicesContragentTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContragentTypeFilter');
  RemClassRegistry.RegisterXSClass(ENServicesContragentTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContragentTypeShort');
  RemClassRegistry.RegisterXSClass(ENServicesContragentTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesContragentTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesContragentTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesContragentTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesContragentTypeControllerSoapPort), 'http://ksoe.org/ENServicesContragentTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesContragentTypeControllerSoapPort), 'http://ksoe.org/ENServicesContragentTypeController/action/ENServicesContragentTypeController.%operationName%');


end.
