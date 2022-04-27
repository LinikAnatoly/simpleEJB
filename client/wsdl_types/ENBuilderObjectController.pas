unit ENBuilderObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENBuilderObjectTypeController 
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

  ENBuilderObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilderObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilderObject = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FcommentGen : WideString;
    FdateGen : TXSDate;
    FuserGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FobjectType : ENBuilderObjectType;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property  yearBuild : Integer read FyearBuild write FyearBuild; 
    property  yearWorkingStart : Integer read FyearWorkingStart write FyearWorkingStart; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property objectType : ENBuilderObjectType read FobjectType write FobjectType; 
    property element : ENElement read Felement write Felement; 
  end;

  ENBuilderObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FcommentGen : WideString;
    FdateGen : TXSDate;
    FuserGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FobjectType : ENBuilderObjectType;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property  yearBuild : Integer read FyearBuild write FyearBuild; 
    property  yearWorkingStart : Integer read FyearWorkingStart write FyearWorkingStart; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property objectType : ENBuilderObjectType read FobjectType write FobjectType; 
    property element : ENElement read Felement write Felement; 
  end;


  ENBuilderObjectShort = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FuserGen : WideString;
    FobjectTypeCode : Integer; 
    FobjectTypeName : WideString;
    FelementCode : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property  yearBuild : Integer read FyearBuild write FyearBuild; 
    property  yearWorkingStart : Integer read FyearWorkingStart write FyearWorkingStart; 
    property userGen : WideString read FuserGen write FuserGen;

    property objectTypeCode : Integer read FobjectTypeCode write FobjectTypeCode; 
    property objectTypeName : WideString read FobjectTypeName write FobjectTypeName; 
    property elementCode : Integer read FelementCode write FelementCode; 
  end;

  ArrayOfENBuilderObjectShort = array of ENBuilderObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBuilderObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBuilderObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBuilderObjectShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBuilderObjectController/message/
  // soapAction: http://ksoe.org/ENBuilderObjectController/action/ENBuilderObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBuilderObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBuilderObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBuilderObjectControllerSoapPort = interface(IInvokable)
  ['{856d856d-856d-856d-856d-856d856d856d}']
    function  add(const aENBuilderObject: ENBuilderObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBuilderObject: ENBuilderObject); stdcall;
    function  getObject(const anObjectCode: Integer): ENBuilderObject; stdcall;
    function  getList: ENBuilderObjectShortList; stdcall;
    function  getFilteredList(const aENBuilderObjectFilter: ENBuilderObjectFilter): ENBuilderObjectShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBuilderObjectShortList; stdcall;
    function  getScrollableFilteredList(const aENBuilderObjectFilter: ENBuilderObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBuilderObjectShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBuilderObjectShortList; stdcall;
  end; 


implementation

  destructor ENBuilderObject.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FobjectType) then
      objectType.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;
  
  destructor ENBuilderObjectFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FobjectType) then
      objectType.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENBuilderObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBuilderObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilderObject');
  RemClassRegistry.RegisterXSClass(ENBuilderObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilderObjectRef');
  RemClassRegistry.RegisterXSClass(ENBuilderObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilderObjectFilter');
  RemClassRegistry.RegisterXSClass(ENBuilderObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilderObjectShort');
  RemClassRegistry.RegisterXSClass(ENBuilderObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilderObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBuilderObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBuilderObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBuilderObjectControllerSoapPort), 'http://ksoe.org/ENBuilderObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBuilderObjectControllerSoapPort), 'http://ksoe.org/ENBuilderObjectController/action/ENBuilderObjectController.%operationName%');


end.
