unit ENPositionController;

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

  ENPosition            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPositionRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPosition = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FfinCode : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property  finCode : Integer read FfinCode write FfinCode; 
  end;

  ENPositionFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FfinCode : Integer; 
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property  finCode : Integer read FfinCode write FfinCode; 
  end;


  ENPositionShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPositionShort = array of ENPositionShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPositionShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPositionShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPositionShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPositionController/message/
  // soapAction: http://ksoe.org/ENPositionController/action/ENPositionController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPositionControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPositionController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPositionControllerSoapPort = interface(IInvokable)
  ['{1f061f06-1f06-1f06-1f06-1f061f061f06}']
    function  add(const aENPosition: ENPosition): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPosition: ENPosition); stdcall;
    function  getObject(const anObjectCode: Integer): ENPosition; stdcall;
    function  getList: ENPositionShortList; stdcall;
    function  getFilteredList(const aENPositionFilter: ENPositionFilter): ENPositionShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPositionShortList; stdcall;
    function  getScrollableFilteredList(const aENPositionFilter: ENPositionFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPositionShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPositionShortList; stdcall;
  end; 


implementation

  
  
  destructor ENPositionShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPosition, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPosition');
  RemClassRegistry.RegisterXSClass(ENPositionRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPositionRef');
  RemClassRegistry.RegisterXSClass(ENPositionFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPositionFilter');
  RemClassRegistry.RegisterXSClass(ENPositionShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPositionShort');
  RemClassRegistry.RegisterXSClass(ENPositionShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPositionShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPositionShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPositionShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPositionControllerSoapPort), 'http://ksoe.org/ENPositionController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPositionControllerSoapPort), 'http://ksoe.org/ENPositionController/action/ENPositionController.%operationName%');


end.
