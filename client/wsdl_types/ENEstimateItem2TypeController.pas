unit ENEstimateItem2TypeController;

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

  ENEstimateItem2Type            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItem2TypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItem2Type = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENEstimateItem2TypeFilter = class(TRemotable)
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

  ENEstimateItem2TypeFilter = class(ENEstimateItem2Type)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENEstimateItem2TypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENEstimateItem2TypeShort = array of ENEstimateItem2TypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEstimateItem2TypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateItem2TypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateItem2TypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENEstimateItem2TypeController/message/
  // soapAction: http://ksoe.org/ENEstimateItem2TypeController/action/ENEstimateItem2TypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENEstimateItem2TypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENEstimateItem2TypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENEstimateItem2TypeControllerSoapPort = interface(IInvokable)
  ['{129d129d-129d-129d-129d-129d129d129d}']
    function  add(const aENEstimateItem2Type: ENEstimateItem2Type): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENEstimateItem2Type: ENEstimateItem2Type); stdcall;
    function  getObject(const anObjectCode: Integer): ENEstimateItem2Type; stdcall;
    function  getList: ENEstimateItem2TypeShortList; stdcall;
    function  getFilteredList(const aENEstimateItem2TypeFilter: ENEstimateItem2TypeFilter): ENEstimateItem2TypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItem2TypeShortList; stdcall;
    function  getScrollableFilteredList(const aENEstimateItem2TypeFilter: ENEstimateItem2TypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItem2TypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItem2TypeShortList; stdcall;
  end; 


implementation


  
  destructor ENEstimateItem2TypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENEstimateItem2Type, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2Type');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2TypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2TypeRef');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2TypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2TypeFilter');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2TypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2TypeShort');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2TypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2TypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEstimateItem2TypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEstimateItem2TypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENEstimateItem2TypeControllerSoapPort), 'http://ksoe.org/ENEstimateItem2TypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENEstimateItem2TypeControllerSoapPort), 'http://ksoe.org/ENEstimateItem2TypeController/action/ENEstimateItem2TypeController.%operationName%');


end.
