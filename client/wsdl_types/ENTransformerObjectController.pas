unit ENTransformerObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTransformerTypeController 
   ,ENElementController 
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

  ENTransformerObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransformerObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransformerObject = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbuildNumber : WideString;
    FbuildYear : Integer; 
    FvoltageHi : TXSDecimal;
    FvoltageLow : TXSDecimal;
    FnomPower : TXSDecimal;
    FbuhName : WideString;
    FinvNumber : WideString;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FtransformerType : ENTransformerType;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property  buildYear : Integer read FbuildYear write FbuildYear; 
    property voltageHi : TXSDecimal read FvoltageHi write FvoltageHi; 
    property voltageLow : TXSDecimal read FvoltageLow write FvoltageLow; 
    property nomPower : TXSDecimal read FnomPower write FnomPower; 
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property transformerType : ENTransformerType read FtransformerType write FtransformerType; 
    property element : ENElement read Felement write Felement; 
  end;

  ENTransformerObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FbuildNumber : WideString;
    FbuildYear : Integer; 
    FvoltageHi : TXSDecimal;
    FvoltageLow : TXSDecimal;
    FnomPower : TXSDecimal;
    FbuhName : WideString;
    FinvNumber : WideString;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FtransformerType : ENTransformerType;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property  buildYear : Integer read FbuildYear write FbuildYear; 
    property voltageHi : TXSDecimal read FvoltageHi write FvoltageHi; 
    property voltageLow : TXSDecimal read FvoltageLow write FvoltageLow; 
    property nomPower : TXSDecimal read FnomPower write FnomPower; 
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property transformerType : ENTransformerType read FtransformerType write FtransformerType; 
    property element : ENElement read Felement write Felement; 
  end;


  ENTransformerObjectShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbuildNumber : WideString;
    FbuildYear : Integer; 
    FvoltageHi : TXSDecimal;
    FvoltageLow : TXSDecimal;
    FnomPower : TXSDecimal;
    FbuhName : WideString;
    FinvNumber : WideString;
    FtransformerTypeCode : Integer; 
    FtransformerTypeName : WideString;
    FelementCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property  buildYear : Integer read FbuildYear write FbuildYear; 
    property voltageHi : TXSDecimal read FvoltageHi write FvoltageHi; 
    property voltageLow : TXSDecimal read FvoltageLow write FvoltageLow; 
    property nomPower : TXSDecimal read FnomPower write FnomPower; 
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;

    property transformerTypeCode : Integer read FtransformerTypeCode write FtransformerTypeCode; 
    property transformerTypeName : WideString read FtransformerTypeName write FtransformerTypeName; 
    property elementCode : Integer read FelementCode write FelementCode; 
  end;

  ArrayOfENTransformerObjectShort = array of ENTransformerObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransformerObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransformerObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransformerObjectShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransformerObjectController/message/
  // soapAction: http://ksoe.org/ENTransformerObjectController/action/ENTransformerObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransformerObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransformerObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransformerObjectControllerSoapPort = interface(IInvokable)
  ['{10df10df-10df-10df-10df-10df10df10df}']
    function  add(const aENTransformerObject: ENTransformerObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransformerObject: ENTransformerObject); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransformerObject; stdcall;
    function  getList: ENTransformerObjectShortList; stdcall;
    function  getFilteredList(const aENTransformerObjectFilter: ENTransformerObjectFilter): ENTransformerObjectShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransformerObjectShortList; stdcall;
    function  getScrollableFilteredList(const aENTransformerObjectFilter: ENTransformerObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransformerObjectShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransformerObjectShortList; stdcall;
  end; 


implementation

  destructor ENTransformerObject.Destroy;
  begin
    if Assigned(FvoltageHi) then
      voltageHi.Free;
    if Assigned(FvoltageLow) then
      voltageLow.Free;
    if Assigned(FnomPower) then
      nomPower.Free;
    if Assigned(FtransformerType) then
      transformerType.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;
  
  destructor ENTransformerObjectFilter.Destroy;
  begin
    if Assigned(FvoltageHi) then
      voltageHi.Free;
    if Assigned(FvoltageLow) then
      voltageLow.Free;
    if Assigned(FnomPower) then
      nomPower.Free;
    if Assigned(FtransformerType) then
      transformerType.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransformerObjectShort.Destroy;
  begin
    if Assigned(FvoltageHi) then
      voltageHi.Free;
    if Assigned(FvoltageLow) then
      voltageLow.Free;
    if Assigned(FnomPower) then
      nomPower.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransformerObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransformerObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerObject');
  RemClassRegistry.RegisterXSClass(ENTransformerObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerObjectRef');
  RemClassRegistry.RegisterXSClass(ENTransformerObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerObjectFilter');
  RemClassRegistry.RegisterXSClass(ENTransformerObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerObjectShort');
  RemClassRegistry.RegisterXSClass(ENTransformerObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransformerObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransformerObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransformerObjectControllerSoapPort), 'http://ksoe.org/ENTransformerObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransformerObjectControllerSoapPort), 'http://ksoe.org/ENTransformerObjectController/action/ENTransformerObjectController.%operationName%');


end.
