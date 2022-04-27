unit ENTransformerTypeController;

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

  ENTransformerType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransformerTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransformerType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENTransformerTypeFilter = class(TRemotable)
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


  ENTransformerTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTransformerTypeShort = array of ENTransformerTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransformerTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransformerTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransformerTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransformerTypeController/message/
  // soapAction: http://ksoe.org/ENTransformerTypeController/action/ENTransformerTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransformerTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransformerTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransformerTypeControllerSoapPort = interface(IInvokable)
  ['{48154815-4815-4815-4815-481548154815}']
    function  add(const aENTransformerType: ENTransformerType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransformerType: ENTransformerType); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransformerType; stdcall;
    function  getList: ENTransformerTypeShortList; stdcall;
    function  getFilteredList(const aENTransformerTypeFilter: ENTransformerTypeFilter): ENTransformerTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransformerTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENTransformerTypeFilter: ENTransformerTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransformerTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransformerTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENTransformerTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransformerType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerType');
  RemClassRegistry.RegisterXSClass(ENTransformerTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerTypeRef');
  RemClassRegistry.RegisterXSClass(ENTransformerTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerTypeFilter');
  RemClassRegistry.RegisterXSClass(ENTransformerTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerTypeShort');
  RemClassRegistry.RegisterXSClass(ENTransformerTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransformerTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransformerTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransformerTypeControllerSoapPort), 'http://ksoe.org/ENTransformerTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransformerTypeControllerSoapPort), 'http://ksoe.org/ENTransformerTypeController/action/ENTransformerTypeController.%operationName%');


end.
