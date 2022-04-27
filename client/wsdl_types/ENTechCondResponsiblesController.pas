unit ENTechCondResponsiblesController;

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

  ENTechCondResponsibles            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechCondResponsiblesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechCondResponsibles = class(TRemotable)
  private
    Fcode : Integer; 
    FresponsibleFIO : WideString;
    FresponsibleTabNumber : Integer; 
    FresponsiblePosition : WideString;
    FresponsibleDepName : WideString;
    FresponsibleDepCode : WideString;
    FresponsiblePhone : WideString;
    Fpower : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property responsibleFIO : WideString read FresponsibleFIO write FresponsibleFIO;
    property  responsibleTabNumber : Integer read FresponsibleTabNumber write FresponsibleTabNumber; 
    property responsiblePosition : WideString read FresponsiblePosition write FresponsiblePosition;
    property responsibleDepName : WideString read FresponsibleDepName write FresponsibleDepName;
    property responsibleDepCode : WideString read FresponsibleDepCode write FresponsibleDepCode;
    property responsiblePhone : WideString read FresponsiblePhone write FresponsiblePhone;
    property  power : Integer read Fpower write Fpower; 
  end;
  
{
  ENTechCondResponsiblesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FresponsibleFIO : WideString;
    FresponsibleTabNumber : Integer; 
    FresponsiblePosition : WideString;
    FresponsibleDepName : WideString;
    FresponsibleDepCode : WideString;
    FresponsiblePhone : WideString;
    Fpower : Integer; 
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property responsibleFIO : WideString read FresponsibleFIO write FresponsibleFIO;
    property  responsibleTabNumber : Integer read FresponsibleTabNumber write FresponsibleTabNumber; 
    property responsiblePosition : WideString read FresponsiblePosition write FresponsiblePosition;
    property responsibleDepName : WideString read FresponsibleDepName write FresponsibleDepName;
    property responsibleDepCode : WideString read FresponsibleDepCode write FresponsibleDepCode;
    property responsiblePhone : WideString read FresponsiblePhone write FresponsiblePhone;
    property  power : Integer read Fpower write Fpower; 
  end;
}

  ENTechCondResponsiblesFilter = class(ENTechCondResponsibles)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTechCondResponsiblesShort = class(TRemotable)
  private
    Fcode : Integer; 
    FresponsibleFIO : WideString;
    FresponsibleTabNumber : Integer; 
    FresponsiblePosition : WideString;
    FresponsibleDepName : WideString;
    FresponsibleDepCode : WideString;
    FresponsiblePhone : WideString;
    Fpower : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property responsibleFIO : WideString read FresponsibleFIO write FresponsibleFIO;
    property  responsibleTabNumber : Integer read FresponsibleTabNumber write FresponsibleTabNumber; 
    property responsiblePosition : WideString read FresponsiblePosition write FresponsiblePosition;
    property responsibleDepName : WideString read FresponsibleDepName write FresponsibleDepName;
    property responsibleDepCode : WideString read FresponsibleDepCode write FresponsibleDepCode;
    property responsiblePhone : WideString read FresponsiblePhone write FresponsiblePhone;
    property  power : Integer read Fpower write Fpower; 

  end;

  ArrayOfENTechCondResponsiblesShort = array of ENTechCondResponsiblesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTechCondResponsiblesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTechCondResponsiblesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTechCondResponsiblesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTechCondResponsiblesController/message/
  // soapAction: http://ksoe.org/ENTechCondResponsiblesController/action/ENTechCondResponsiblesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTechCondResponsiblesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTechCondResponsiblesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTechCondResponsiblesControllerSoapPort = interface(IInvokable)
['{B46900FC-1F03-4545-8F46-997B42172D7E}']
    function  add(const aENTechCondResponsibles: ENTechCondResponsibles): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTechCondResponsibles: ENTechCondResponsibles); stdcall;
    function  getObject(const anObjectCode: Integer): ENTechCondResponsibles; stdcall;
    function  getList: ENTechCondResponsiblesShortList; stdcall;
    function  getFilteredList(const aENTechCondResponsiblesFilter: ENTechCondResponsiblesFilter): ENTechCondResponsiblesShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTechCondResponsiblesShortList; stdcall;
    function  getScrollableFilteredList(const aENTechCondResponsiblesFilter: ENTechCondResponsiblesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTechCondResponsiblesShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTechCondResponsiblesShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTechCondResponsiblesFilter: ENTechCondResponsiblesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENTechCondResponsiblesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTechCondResponsibles, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCondResponsibles');
  RemClassRegistry.RegisterXSClass(ENTechCondResponsiblesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCondResponsiblesRef');
  RemClassRegistry.RegisterXSClass(ENTechCondResponsiblesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCondResponsiblesFilter');
  RemClassRegistry.RegisterXSClass(ENTechCondResponsiblesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCondResponsiblesShort');
  RemClassRegistry.RegisterXSClass(ENTechCondResponsiblesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCondResponsiblesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTechCondResponsiblesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTechCondResponsiblesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTechCondResponsiblesControllerSoapPort), 'http://ksoe.org/ENTechCondResponsiblesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTechCondResponsiblesControllerSoapPort), 'http://ksoe.org/ENTechCondResponsiblesController/action/ENTechCondResponsiblesController.%operationName%');


end.
