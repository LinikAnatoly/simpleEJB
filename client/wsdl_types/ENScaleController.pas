unit ENScaleController;

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

  ENScale            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENScaleRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENScale = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENScaleFilter = class(TRemotable)
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

  ENScaleFilter = class(ENScale)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENScaleShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENScaleShort = array of ENScaleShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENScaleShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENScaleShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENScaleShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENScaleController/message/
  // soapAction: http://ksoe.org/ENScaleController/action/ENScaleController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENScaleControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENScaleController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENScaleControllerSoapPort = interface(IInvokable)
  ['{1b101b10-1b10-1b10-1b10-1b101b101b10}']
    function  add(const aENScale: ENScale): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENScale: ENScale); stdcall;
    function  getObject(const anObjectCode: Integer): ENScale; stdcall;
    function  getList: ENScaleShortList; stdcall;
    function  getFilteredList(const aENScaleFilter: ENScaleFilter): ENScaleShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENScaleShortList; stdcall;
    function  getScrollableFilteredList(const aENScaleFilter: ENScaleFilter; const aFromPosition: Integer; const aQuantity: Integer): ENScaleShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENScaleShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENScaleFilter: ENScaleFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENScaleShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENScale, 'http://ksoe.org/EnergyproControllerService/type/', 'ENScale');
  RemClassRegistry.RegisterXSClass(ENScaleRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENScaleRef');
  RemClassRegistry.RegisterXSClass(ENScaleFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENScaleFilter');
  RemClassRegistry.RegisterXSClass(ENScaleShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENScaleShort');
  RemClassRegistry.RegisterXSClass(ENScaleShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENScaleShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENScaleShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENScaleShort');

  InvRegistry.RegisterInterface(TypeInfo(ENScaleControllerSoapPort), 'http://ksoe.org/ENScaleController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENScaleControllerSoapPort), 'http://ksoe.org/ENScaleController/action/ENScaleController.%operationName%');


end.
