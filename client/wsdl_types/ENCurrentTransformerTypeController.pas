unit ENCurrentTransformerTypeController;

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

  ENCurrentTransformerType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCurrentTransformerTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCurrentTransformerType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENCurrentTransformerTypeFilter = class(TRemotable)
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

  ENCurrentTransformerTypeFilter = class(ENCurrentTransformerType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENCurrentTransformerTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENCurrentTransformerTypeShort = array of ENCurrentTransformerTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCurrentTransformerTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCurrentTransformerTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCurrentTransformerTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCurrentTransformerTypeController/message/
  // soapAction: http://ksoe.org/ENCurrentTransformerTypeController/action/ENCurrentTransformerTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCurrentTransformerTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCurrentTransformerTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCurrentTransformerTypeControllerSoapPort = interface(IInvokable)
  ['{3b783b78-3b78-3b78-3b78-3b783b783b78}']
    function  add(const aENCurrentTransformerType: ENCurrentTransformerType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCurrentTransformerType: ENCurrentTransformerType); stdcall;
    function  getObject(const anObjectCode: Integer): ENCurrentTransformerType; stdcall;
    function  getList: ENCurrentTransformerTypeShortList; stdcall;
    function  getFilteredList(const aENCurrentTransformerTypeFilter: ENCurrentTransformerTypeFilter): ENCurrentTransformerTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCurrentTransformerTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENCurrentTransformerTypeFilter: ENCurrentTransformerTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCurrentTransformerTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCurrentTransformerTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENCurrentTransformerTypeFilter: ENCurrentTransformerTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENCurrentTransformerTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCurrentTransformerType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCurrentTransformerType');
  RemClassRegistry.RegisterXSClass(ENCurrentTransformerTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCurrentTransformerTypeRef');
  RemClassRegistry.RegisterXSClass(ENCurrentTransformerTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCurrentTransformerTypeFilter');
  RemClassRegistry.RegisterXSClass(ENCurrentTransformerTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCurrentTransformerTypeShort');
  RemClassRegistry.RegisterXSClass(ENCurrentTransformerTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCurrentTransformerTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCurrentTransformerTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCurrentTransformerTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCurrentTransformerTypeControllerSoapPort), 'http://ksoe.org/ENCurrentTransformerTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCurrentTransformerTypeControllerSoapPort), 'http://ksoe.org/ENCurrentTransformerTypeController/action/ENCurrentTransformerTypeController.%operationName%');


end.
