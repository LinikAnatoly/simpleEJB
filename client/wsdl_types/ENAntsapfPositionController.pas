unit ENAntsapfPositionController;

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

  ENAntsapfPosition            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAntsapfPositionRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAntsapfPosition = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENAntsapfPositionFilter = class(TRemotable)
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

  ENAntsapfPositionFilter = class(ENAntsapfPosition)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAntsapfPositionShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENAntsapfPositionShort = array of ENAntsapfPositionShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAntsapfPositionShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAntsapfPositionShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAntsapfPositionShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAntsapfPositionController/message/
  // soapAction: http://ksoe.org/ENAntsapfPositionController/action/ENAntsapfPositionController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAntsapfPositionControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAntsapfPositionController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAntsapfPositionControllerSoapPort = interface(IInvokable)
  ['{15811581-1581-1581-1581-158115811581}']
    function  add(const aENAntsapfPosition: ENAntsapfPosition): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAntsapfPosition: ENAntsapfPosition); stdcall;
    function  getObject(const anObjectCode: Integer): ENAntsapfPosition; stdcall;
    function  getList: ENAntsapfPositionShortList; stdcall;
    function  getFilteredList(const aENAntsapfPositionFilter: ENAntsapfPositionFilter): ENAntsapfPositionShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAntsapfPositionShortList; stdcall;
    function  getScrollableFilteredList(const aENAntsapfPositionFilter: ENAntsapfPositionFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAntsapfPositionShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAntsapfPositionShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAntsapfPositionFilter: ENAntsapfPositionFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENAntsapfPositionShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAntsapfPosition, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAntsapfPosition');
  RemClassRegistry.RegisterXSClass(ENAntsapfPositionRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAntsapfPositionRef');
  RemClassRegistry.RegisterXSClass(ENAntsapfPositionFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAntsapfPositionFilter');
  RemClassRegistry.RegisterXSClass(ENAntsapfPositionShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAntsapfPositionShort');
  RemClassRegistry.RegisterXSClass(ENAntsapfPositionShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAntsapfPositionShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAntsapfPositionShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAntsapfPositionShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAntsapfPositionControllerSoapPort), 'http://ksoe.org/ENAntsapfPositionController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAntsapfPositionControllerSoapPort), 'http://ksoe.org/ENAntsapfPositionController/action/ENAntsapfPositionController.%operationName%');


end.
