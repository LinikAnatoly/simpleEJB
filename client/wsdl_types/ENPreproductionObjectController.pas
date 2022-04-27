unit ENPreproductionObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
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

  ENPreproductionObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPreproductionObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPreproductionObject = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property element : ENElement read Felement write Felement; 
  end;
  
{
  ENPreproductionObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property element : ENElement read Felement write Felement; 
  end;
}

  ENPreproductionObjectFilter = class(ENPreproductionObject)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPreproductionObjectShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FcommentGen : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FelementCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property elementCode : Integer read FelementCode write FelementCode; 
  end;

  ArrayOfENPreproductionObjectShort = array of ENPreproductionObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPreproductionObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPreproductionObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPreproductionObjectShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPreproductionObjectController/message/
  // soapAction: http://ksoe.org/ENPreproductionObjectController/action/ENPreproductionObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPreproductionObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPreproductionObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPreproductionObjectControllerSoapPort = interface(IInvokable)
  ['{12921292-1292-1292-1292-129212921292}']
    function  add(const aENPreproductionObject: ENPreproductionObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPreproductionObject: ENPreproductionObject); stdcall;
    function  getObject(const anObjectCode: Integer): ENPreproductionObject; stdcall;
    function  getList: ENPreproductionObjectShortList; stdcall;
    function  getFilteredList(const aENPreproductionObjectFilter: ENPreproductionObjectFilter): ENPreproductionObjectShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPreproductionObjectShortList; stdcall;
    function  getScrollableFilteredList(const aENPreproductionObjectFilter: ENPreproductionObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPreproductionObjectShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPreproductionObjectShortList; stdcall;
  end; 


implementation

  destructor ENPreproductionObject.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;

{  
  destructor ENPreproductionObjectFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end; 
}

  destructor ENPreproductionObjectFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENPreproductionObjectShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENPreproductionObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPreproductionObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPreproductionObject');
  RemClassRegistry.RegisterXSClass(ENPreproductionObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPreproductionObjectRef');
  RemClassRegistry.RegisterXSClass(ENPreproductionObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPreproductionObjectFilter');
  RemClassRegistry.RegisterXSClass(ENPreproductionObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPreproductionObjectShort');
  RemClassRegistry.RegisterXSClass(ENPreproductionObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPreproductionObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPreproductionObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPreproductionObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPreproductionObjectControllerSoapPort), 'http://ksoe.org/ENPreproductionObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPreproductionObjectControllerSoapPort), 'http://ksoe.org/ENPreproductionObjectController/action/ENPreproductionObjectController.%operationName%');


end.
