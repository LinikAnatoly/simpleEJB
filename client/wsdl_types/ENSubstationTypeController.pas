unit ENSubstationTypeController;

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

  ENSubstationType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubstationTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubstationType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENSubstationTypeFilter = class(TRemotable)
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


  ENSubstationTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENSubstationTypeShort = array of ENSubstationTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubstationTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubstationTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubstationTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubstationTypeController/message/
  // soapAction: http://ksoe.org/ENSubstationTypeController/action/ENSubstationTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubstationTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubstationTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubstationTypeControllerSoapPort = interface(IInvokable)
  ['{1ad61ad6-1ad6-1ad6-1ad6-1ad61ad61ad6}']
    function  add(const aENSubstationType: ENSubstationType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubstationType: ENSubstationType); stdcall;
    function  getObject(const anObjectCode: Integer): ENSubstationType; stdcall;
    function  getList: ENSubstationTypeShortList; stdcall;
    function  getFilteredList(const aENSubstationTypeFilter: ENSubstationTypeFilter): ENSubstationTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubstationTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENSubstationTypeFilter: ENSubstationTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSubstationTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubstationTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENSubstationTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubstationType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstationType');
  RemClassRegistry.RegisterXSClass(ENSubstationTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstationTypeRef');
  RemClassRegistry.RegisterXSClass(ENSubstationTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstationTypeFilter');
  RemClassRegistry.RegisterXSClass(ENSubstationTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstationTypeShort');
  RemClassRegistry.RegisterXSClass(ENSubstationTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstationTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubstationTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubstationTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSubstationTypeControllerSoapPort), 'http://ksoe.org/ENSubstationTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubstationTypeControllerSoapPort), 'http://ksoe.org/ENSubstationTypeController/action/ENSubstationTypeController.%operationName%');


end.
