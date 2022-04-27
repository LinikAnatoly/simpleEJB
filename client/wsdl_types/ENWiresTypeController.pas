unit ENWiresTypeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,TKMaterialsController 
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

  ENWiresType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWiresTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWiresType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FisCabel : Integer; 
//???
    FmatWireRef : TKMaterialsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property  isCabel : Integer read FisCabel write FisCabel; 
    property matWireRef : TKMaterialsRef read FmatWireRef write FmatWireRef; 
  end;
  
{
  ENWiresTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FisCabel : Integer; 
//???
    FmatWireRef : TKMaterialsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property  isCabel : Integer read FisCabel write FisCabel; 
    property matWireRef : TKMaterialsRef read FmatWireRef write FmatWireRef; 
  end;
}

  ENWiresTypeFilter = class(ENWiresType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENWiresTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FisCabel : Integer; 
    FmatWireRefCode : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property  isCabel : Integer read FisCabel write FisCabel; 

    property matWireRefCode : Integer read FmatWireRefCode write FmatWireRefCode; //TKMaterialsRef read FmatWireRefCode write FmatWireRefCode; 
  end;

  ArrayOfENWiresTypeShort = array of ENWiresTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWiresTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWiresTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWiresTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWiresTypeController/message/
  // soapAction: http://ksoe.org/ENWiresTypeController/action/ENWiresTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWiresTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWiresTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWiresTypeControllerSoapPort = interface(IInvokable)
  ['{44304430-4430-4430-4430-443044304430}']
    function  add(const aENWiresType: ENWiresType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWiresType: ENWiresType); stdcall;
    function  getObject(const anObjectCode: Integer): ENWiresType; stdcall;
    function  getList: ENWiresTypeShortList; stdcall;
    function  getFilteredList(const aENWiresTypeFilter: ENWiresTypeFilter): ENWiresTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWiresTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENWiresTypeFilter: ENWiresTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWiresTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWiresTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENWiresTypeFilter: ENWiresTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENWiresType.Destroy;
  begin
    if Assigned(FmatWireRef) then
      matWireRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENWiresTypeFilter.Destroy;
  begin
    if Assigned(FmatWireRef) then
      matWireRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENWiresTypeFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  
  destructor ENWiresTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWiresType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresType');
  RemClassRegistry.RegisterXSClass(ENWiresTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresTypeRef');
  RemClassRegistry.RegisterXSClass(ENWiresTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresTypeFilter');
  RemClassRegistry.RegisterXSClass(ENWiresTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresTypeShort');
  RemClassRegistry.RegisterXSClass(ENWiresTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWiresTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWiresTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWiresTypeControllerSoapPort), 'http://ksoe.org/ENWiresTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWiresTypeControllerSoapPort), 'http://ksoe.org/ENWiresTypeController/action/ENWiresTypeController.%operationName%');


end.
