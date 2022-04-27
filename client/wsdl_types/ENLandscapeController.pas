unit ENLandscapeController;

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

  ENLandscape            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLandscapeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLandscape = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENLandscapeFilter = class(TRemotable)
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

  ENLandscapeFilter = class(ENLandscape)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENLandscapeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENLandscapeShort = array of ENLandscapeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENLandscapeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENLandscapeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENLandscapeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENLandscapeController/message/
  // soapAction: http://ksoe.org/ENLandscapeController/action/ENLandscapeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENLandscapeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENLandscapeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENLandscapeControllerSoapPort = interface(IInvokable)
  ['{14b014b0-14b0-14b0-14b0-14b014b014b0}']
    function  add(const aENLandscape: ENLandscape): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENLandscape: ENLandscape); stdcall;
    function  getObject(const anObjectCode: Integer): ENLandscape; stdcall;
    function  getList: ENLandscapeShortList; stdcall;
    function  getFilteredList(const aENLandscapeFilter: ENLandscapeFilter): ENLandscapeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENLandscapeShortList; stdcall;
    function  getScrollableFilteredList(const aENLandscapeFilter: ENLandscapeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENLandscapeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENLandscapeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENLandscapeFilter: ENLandscapeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENLandscapeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENLandscape, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLandscape');
  RemClassRegistry.RegisterXSClass(ENLandscapeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLandscapeRef');
  RemClassRegistry.RegisterXSClass(ENLandscapeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLandscapeFilter');
  RemClassRegistry.RegisterXSClass(ENLandscapeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLandscapeShort');
  RemClassRegistry.RegisterXSClass(ENLandscapeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLandscapeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENLandscapeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENLandscapeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENLandscapeControllerSoapPort), 'http://ksoe.org/ENLandscapeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENLandscapeControllerSoapPort), 'http://ksoe.org/ENLandscapeController/action/ENLandscapeController.%operationName%');


end.
