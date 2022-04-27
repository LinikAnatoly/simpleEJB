unit ENElementController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementTypeController 
   //,ENElementController
   //,ENElementController
   ,FINExecutorController
   ,ENGeographicDepartmentController
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

  ENElement            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElementRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement = class(TRemotable)
  private
    Fcode : Integer; 
    ForderField : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FtypeRef : ENElementTypeRef;
//???
    FelementInRef : ENElementRef;
//???
    FelementOutRef : ENElementRef;
//???
    FrenRef : EPRenRef;
//???
    FfinExecutor : FINExecutor;
    FgeoDepartmentRef : ENGeographicDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property orderField : TXSDecimal read ForderField write ForderField; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property typeRef : ENElementTypeRef read FtypeRef write FtypeRef; 
    property elementInRef : ENElementRef read FelementInRef write FelementInRef; 
    property elementOutRef : ENElementRef read FelementOutRef write FelementOutRef;
    property renRef : EPRenRef read FrenRef write FrenRef; 
    property finExecutor : FINExecutor read FfinExecutor write FfinExecutor;
    property geoDepartmentRef : ENGeographicDepartmentRef read FgeoDepartmentRef write FgeoDepartmentRef;
  end;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElementFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    ForderField : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FtypeRef : ENElementTypeRef;
//???
    FelementInRef : ENElementRef;
//???
    FelementOutRef : ENElementRef;
    FrenRef : EPRenRef;
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FfinExecutor : FINExecutor;
    FgeoDepartmentRef : ENGeographicDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property orderField : TXSDecimal read ForderField write ForderField; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property typeRef : ENElementTypeRef read FtypeRef write FtypeRef; 
    property elementInRef : ENElementRef read FelementInRef write FelementInRef; 
    property elementOutRef : ENElementRef read FelementOutRef write FelementOutRef;
    property renRef : EPRenRef read FrenRef write FrenRef;
    property invNumber : WideString read FinvNumber write FinvNumber ;
    property name : WideString read Fname write Fname; 
    property buhName : WideString read FbuhName write FbuhName;
    property finExecutor : FINExecutor read FfinExecutor write FfinExecutor;
    property geoDepartmentRef : ENGeographicDepartmentRef read FgeoDepartmentRef write FgeoDepartmentRef;

 end;


  ENElementShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
    FelementInRefCode : Integer; 
    FelementOutRefCode : Integer;
    FobjectName : WideString;
    FobjectInvNumber : WideString;

    FobjectBuhName : WideString;

    FrenRefCode : Integer;
    FrenRefName : WideString;
    FfinExecutorCode : Integer;
    FfinExecutorName : WideString;
    FfinExecutorFinCode : Integer;
    FfinExecutorFinTypeName : WideString;
    FfinExecutorFinTypeCode : Integer;
    FfinExecutorFinKindName : WideString;
    FfinExecutorFinKindCode : Integer;
    FfinExecutorFinCehName : WideString;
    FfinExecutorFinCehCode : Integer;
    FfinExecutorAxOrgId : WideString;
    FfinExecutorAxParentOrgId : WideString;
    FfinExecutorAxParentOrgName : WideString;
    FfinExecutorAxOrgTypeId : Integer;
    FfinExecutorAxOrgTypeName : WideString;
    FgeoDepartmentRefCode : Integer;
    FgeoDepartmentRefName : WideString;
    FgeoDepartmentRefCommentgen : WideString;
    FgeoDepartmentRefUserAdd : WideString;
    FgeoDepartmentRefDateAdd : TXSDateTime;
    FgeoDepartmentRefUserGen : WideString;
    FgeoDepartmentRefDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
 published
    property  code : Integer read Fcode write Fcode; 
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property elementInRefCode : Integer read FelementInRefCode write FelementInRefCode; 
    property elementOutRefCode : Integer read FelementOutRefCode write FelementOutRefCode;
    property objectName : WideString read FobjectName write FobjectName;
    property objectInvNumber : WideString read FobjectInvNumber write FobjectInvNumber;

    property objectBuhName : WideString read FobjectBuhName write FobjectBuhName;

    property renRefCode : Integer read FrenRefCode write FrenRefCode; 
    property renRefName : WideString read FrenRefName write FrenRefName;
    property finExecutorCode : Integer read FfinExecutorCode write FfinExecutorCode;
    property finExecutorName : WideString read FfinExecutorName write FfinExecutorName;
    property finExecutorFinCode : Integer read FfinExecutorFinCode write FfinExecutorFinCode;
    property finExecutorFinTypeName : WideString read FfinExecutorFinTypeName write FfinExecutorFinTypeName;
    property finExecutorFinTypeCode : Integer read FfinExecutorFinTypeCode write FfinExecutorFinTypeCode;
    property finExecutorFinKindName : WideString read FfinExecutorFinKindName write FfinExecutorFinKindName;
    property finExecutorFinKindCode : Integer read FfinExecutorFinKindCode write FfinExecutorFinKindCode;
    property finExecutorFinCehName : WideString read FfinExecutorFinCehName write FfinExecutorFinCehName;
    property finExecutorFinCehCode : Integer read FfinExecutorFinCehCode write FfinExecutorFinCehCode;
    property finExecutorAxOrgId : WideString read FfinExecutorAxOrgId write FfinExecutorAxOrgId;
    property finExecutorAxParentOrgId : WideString read FfinExecutorAxParentOrgId write FfinExecutorAxParentOrgId;
    property finExecutorAxParentOrgName : WideString read FfinExecutorAxParentOrgName write FfinExecutorAxParentOrgName;
    property finExecutorAxOrgTypeId : Integer read FfinExecutorAxOrgTypeId write FfinExecutorAxOrgTypeId;
    property finExecutorAxOrgTypeName : WideString read FfinExecutorAxOrgTypeName write FfinExecutorAxOrgTypeName;
property geoDepartmentRefCode : Integer read FgeoDepartmentRefCode write FgeoDepartmentRefCode;
    property geoDepartmentRefName : WideString read FgeoDepartmentRefName write FgeoDepartmentRefName;
    property geoDepartmentRefCommentgen : WideString read FgeoDepartmentRefCommentgen write FgeoDepartmentRefCommentgen;
    property geoDepartmentRefUserAdd : WideString read FgeoDepartmentRefUserAdd write FgeoDepartmentRefUserAdd;
    property geoDepartmentRefDateAdd : TXSDateTime read FgeoDepartmentRefDateAdd write FgeoDepartmentRefDateAdd;
    property geoDepartmentRefUserGen : WideString read FgeoDepartmentRefUserGen write FgeoDepartmentRefUserGen;
    property geoDepartmentRefDateEdit : TXSDateTime read FgeoDepartmentRefDateEdit write FgeoDepartmentRefDateEdit;
 end;

  ArrayOfENElementShort = array of ENElementShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENElementShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENElementShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENElementShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENElementController/message/
  // soapAction: http://ksoe.org/ENElementController/action/ENElementController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENElementControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENElementController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENElementControllerSoapPort = interface(IInvokable)
  ['{0072F781-C0B6-4F9D-BDA5-6A95748F0BFB}']
    function  add(const aENElement: ENElement): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENElement: ENElement); stdcall;
    function  getObject(const anObjectCode: Integer): ENElement; stdcall;
    function  getShortObject(const anObjectCode: Integer): ENElementShort; stdcall;
    function  getList: ENElementShortList; stdcall;
    function  getFilteredList(const aENElementFilter: ENElementFilter): ENElementShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENElementShortList; stdcall;
    function  getScrollableFilteredList(const aENElementFilter: ENElementFilter; const aFromPosition: Integer; const aQuantity: Integer): ENElementShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENElementShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENElementFilter: ENElementFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    
  end; 


implementation

  destructor ENElement.Destroy;
  begin
    if Assigned(ForderField) then
      orderField.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FelementInRef) then
      elementInRef.Free;
    if Assigned(FelementOutRef) then
      elementOutRef.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    if Assigned(FfinExecutor) then
      finExecutor.Free;
    if Assigned(FgeoDepartmentRef) then
      geoDepartmentRef.Free;
 inherited Destroy;
  end;

  destructor ENElementFilter.Destroy;
  begin
    if Assigned(ForderField) then
      orderField.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FelementInRef) then
      elementInRef.Free;
    if Assigned(FelementOutRef) then
      elementOutRef.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    

    if Assigned(FgeoDepartmentRef) then
      geoDepartmentRef.Free;
    inherited Destroy;
  end; 


  destructor ENElementShort.Destroy;
  begin
    if Assigned(FgeoDepartmentRefDateAdd) then
      geoDepartmentRefDateAdd.Free;
    if Assigned(FgeoDepartmentRefDateEdit) then
      geoDepartmentRefDateEdit.Free;
    inherited Destroy;
  end;
  
  destructor ENElementShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENElement, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement');
  RemClassRegistry.RegisterXSClass(ENElementRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElementRef');
  RemClassRegistry.RegisterXSClass(ENElementFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElementFilter');
  RemClassRegistry.RegisterXSClass(ENElementShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElementShort');
  RemClassRegistry.RegisterXSClass(ENElementShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElementShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENElementShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENElementShort');

  InvRegistry.RegisterInterface(TypeInfo(ENElementControllerSoapPort), 'http://ksoe.org/ENElementController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENElementControllerSoapPort), 'http://ksoe.org/ENElementController/action/ENElementController.%operationName%');


end.
