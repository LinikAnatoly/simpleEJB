unit ENWiresCutController;

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

  ENWiresCut            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWiresCutRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWiresCut = class(TRemotable)
  private
    Fcode : Integer; 
    FwiresCut : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property wiresCut : TXSDecimal read FwiresCut write FwiresCut; 
  end;
  
{
  ENWiresCutFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FwiresCut : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property wiresCut : TXSDecimal read FwiresCut write FwiresCut; 
  end;
}

  ENWiresCutFilter = class(ENWiresCut)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENWiresCutShort = class(TRemotable)
  private
    Fcode : Integer; 
    FwiresCut : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property wiresCut : TXSDecimal read FwiresCut write FwiresCut; 

  end;

  ArrayOfENWiresCutShort = array of ENWiresCutShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWiresCutShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWiresCutShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWiresCutShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWiresCutController/message/
  // soapAction: http://ksoe.org/ENWiresCutController/action/ENWiresCutController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWiresCutControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWiresCutController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWiresCutControllerSoapPort = interface(IInvokable)
  ['{36f836f8-36f8-36f8-36f8-36f836f836f8}']
    function  add(const aENWiresCut: ENWiresCut): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWiresCut: ENWiresCut); stdcall;
    function  getObject(const anObjectCode: Integer): ENWiresCut; stdcall;
    function  getList: ENWiresCutShortList; stdcall;
    function  getFilteredList(const aENWiresCutFilter: ENWiresCutFilter): ENWiresCutShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWiresCutShortList; stdcall;
    function  getScrollableFilteredList(const aENWiresCutFilter: ENWiresCutFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWiresCutShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWiresCutShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENWiresCutFilter: ENWiresCutFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENWiresCut.Destroy;
  begin
    if Assigned(FwiresCut) then
      wiresCut.Free;
    inherited Destroy;
  end;

{  
  destructor ENWiresCutFilter.Destroy;
  begin
    if Assigned(FwiresCut) then
      wiresCut.Free;
    inherited Destroy;
  end; 
}

  destructor ENWiresCutFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENWiresCutShort.Destroy;
  begin
    if Assigned(FwiresCut) then
      wiresCut.Free;
    inherited Destroy;
  end; 
  
  destructor ENWiresCutShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWiresCut, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresCut');
  RemClassRegistry.RegisterXSClass(ENWiresCutRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresCutRef');
  RemClassRegistry.RegisterXSClass(ENWiresCutFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresCutFilter');
  RemClassRegistry.RegisterXSClass(ENWiresCutShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresCutShort');
  RemClassRegistry.RegisterXSClass(ENWiresCutShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresCutShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWiresCutShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWiresCutShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWiresCutControllerSoapPort), 'http://ksoe.org/ENWiresCutController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWiresCutControllerSoapPort), 'http://ksoe.org/ENWiresCutController/action/ENWiresCutController.%operationName%');


end.
