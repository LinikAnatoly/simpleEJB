unit ENWiresFasteningController;

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

  ENWiresFastening            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWiresFasteningRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWiresFastening = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENWiresFasteningFilter = class(TRemotable)
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

  ENWiresFasteningFilter = class(ENWiresFastening)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENWiresFasteningShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENWiresFasteningShort = array of ENWiresFasteningShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWiresFasteningShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWiresFasteningShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWiresFasteningShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWiresFasteningController/message/
  // soapAction: http://ksoe.org/ENWiresFasteningController/action/ENWiresFasteningController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWiresFasteningControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWiresFasteningController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWiresFasteningControllerSoapPort = interface(IInvokable)
  ['{1fc61fc6-1fc6-1fc6-1fc6-1fc61fc61fc6}']
    function  add(const aENWiresFastening: ENWiresFastening): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWiresFastening: ENWiresFastening); stdcall;
    function  getObject(const anObjectCode: Integer): ENWiresFastening; stdcall;
    function  getList: ENWiresFasteningShortList; stdcall;
    function  getFilteredList(const aENWiresFasteningFilter: ENWiresFasteningFilter): ENWiresFasteningShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWiresFasteningShortList; stdcall;
    function  getScrollableFilteredList(const aENWiresFasteningFilter: ENWiresFasteningFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWiresFasteningShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWiresFasteningShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENWiresFasteningFilter: ENWiresFasteningFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENWiresFasteningShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWiresFastening, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresFastening');
  RemClassRegistry.RegisterXSClass(ENWiresFasteningRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresFasteningRef');
  RemClassRegistry.RegisterXSClass(ENWiresFasteningFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresFasteningFilter');
  RemClassRegistry.RegisterXSClass(ENWiresFasteningShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresFasteningShort');
  RemClassRegistry.RegisterXSClass(ENWiresFasteningShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresFasteningShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWiresFasteningShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWiresFasteningShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWiresFasteningControllerSoapPort), 'http://ksoe.org/ENWiresFasteningController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWiresFasteningControllerSoapPort), 'http://ksoe.org/ENWiresFasteningController/action/ENWiresFasteningController.%operationName%');


end.
