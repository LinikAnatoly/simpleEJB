unit ENRoadTypeController;

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

  ENRoadType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRoadTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRoadType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENRoadTypeFilter = class(TRemotable)
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


  ENRoadTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENRoadTypeShort = array of ENRoadTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRoadTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRoadTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRoadTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRoadTypeController/message/
  // soapAction: http://ksoe.org/ENRoadTypeController/action/ENRoadTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRoadTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRoadTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRoadTypeControllerSoapPort = interface(IInvokable)
  ['{3d483d48-3d48-3d48-3d48-3d483d483d48}']
    function  add(const aENRoadType: ENRoadType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRoadType: ENRoadType); stdcall;
    function  getObject(const anObjectCode: Integer): ENRoadType; stdcall;
    function  getList: ENRoadTypeShortList; stdcall;
    function  getFilteredList(const aENRoadTypeFilter: ENRoadTypeFilter): ENRoadTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRoadTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENRoadTypeFilter: ENRoadTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRoadTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRoadTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENRoadTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRoadType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRoadType');
  RemClassRegistry.RegisterXSClass(ENRoadTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRoadTypeRef');
  RemClassRegistry.RegisterXSClass(ENRoadTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRoadTypeFilter');
  RemClassRegistry.RegisterXSClass(ENRoadTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRoadTypeShort');
  RemClassRegistry.RegisterXSClass(ENRoadTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRoadTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRoadTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRoadTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRoadTypeControllerSoapPort), 'http://ksoe.org/ENRoadTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRoadTypeControllerSoapPort), 'http://ksoe.org/ENRoadTypeController/action/ENRoadTypeController.%operationName%');


end.
