unit ENTechContragentTypeController;

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

  ENTechContragentType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechContragentTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechContragentType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTechContragentTypeFilter = class(TRemotable)
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

  ENTechContragentTypeFilter = class(ENTechContragentType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTechContragentTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTechContragentTypeShort = array of ENTechContragentTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTechContragentTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTechContragentTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTechContragentTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTechContragentTypeController/message/
  // soapAction: http://ksoe.org/ENTechContragentTypeController/action/ENTechContragentTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTechContragentTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTechContragentTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTechContragentTypeControllerSoapPort = interface(IInvokable)
  ['{8a1c8a1c-8a1c-8a1c-8a1c-8a1c8a1c8a1c}']
    function  add(const aENTechContragentType: ENTechContragentType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTechContragentType: ENTechContragentType); stdcall;
    function  getObject(const anObjectCode: Integer): ENTechContragentType; stdcall;
    function  getList: ENTechContragentTypeShortList; stdcall;
    function  getFilteredList(const aENTechContragentTypeFilter: ENTechContragentTypeFilter): ENTechContragentTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTechContragentTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENTechContragentTypeFilter: ENTechContragentTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTechContragentTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTechContragentTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTechContragentTypeFilter: ENTechContragentTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENTechContragentTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTechContragentType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechContragentType');
  RemClassRegistry.RegisterXSClass(ENTechContragentTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechContragentTypeRef');
  RemClassRegistry.RegisterXSClass(ENTechContragentTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechContragentTypeFilter');
  RemClassRegistry.RegisterXSClass(ENTechContragentTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechContragentTypeShort');
  RemClassRegistry.RegisterXSClass(ENTechContragentTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechContragentTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTechContragentTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTechContragentTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTechContragentTypeControllerSoapPort), 'http://ksoe.org/ENTechContragentTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTechContragentTypeControllerSoapPort), 'http://ksoe.org/ENTechContragentTypeController/action/ENTechContragentTypeController.%operationName%');


end.
