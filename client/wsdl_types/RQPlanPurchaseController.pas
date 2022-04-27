unit RQPlanPurchaseController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQPlanPurchaseStatusController
   //,RQPlanPurchaseController
   ,RQPlanPurchaseKindController
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

  RQPlanPurchase            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPurchaseRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPurchase = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FyearGen : Integer;
    Fversion : Integer;
    FcommentGen : WideString;
    FdateAdd : TXSDateTime;
    FdateEdit : TXSDateTime;
    FuserAdd : WideString;
    FuserEdit : WideString;
    Fmodify_time : Int64;
//???
    FstatusRef : RQPlanPurchaseStatusRef;
//???
    FparentRef : RQPlanPurchaseRef;
//???
    FkindRef : RQPlanPurchaseKindRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  yearGen : Integer read FyearGen write FyearGen;
    property  version : Integer read Fversion write Fversion;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property userEdit : WideString read FuserEdit write FuserEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : RQPlanPurchaseStatusRef read FstatusRef write FstatusRef;
    property parentRef : RQPlanPurchaseRef read FparentRef write FparentRef;
    property kindRef : RQPlanPurchaseKindRef read FkindRef write FkindRef;
  end;

{
  RQPlanPurchaseFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FyearGen : Integer;
    Fversion : Integer;
    FcommentGen : WideString;
    FdateAdd : DateTime;
    FdateEdit : DateTime;
    FuserAdd : WideString;
    FuserEdit : WideString;
    Fmodify_time : Int64;
//???
    FstatusRef : RQPlanPurchaseStatusRef;
//???
    FparentRef : RQPlanPurchaseRef;
//???
    FkindRef : RQPlanPurchaseKindRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  yearGen : Integer read FyearGen write FyearGen;
    property  version : Integer read Fversion write Fversion;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateAdd : DateTime;
    property dateEdit : DateTime;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property userEdit : WideString read FuserEdit write FuserEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : RQPlanPurchaseStatusRef read FstatusRef write FstatusRef;
    property parentRef : RQPlanPurchaseRef read FparentRef write FparentRef;
    property kindRef : RQPlanPurchaseKindRef read FkindRef write FkindRef;
  end;
}

  RQPlanPurchaseFilter = class(RQPlanPurchase)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPlanPurchaseShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FyearGen : Integer;
    Fversion : Integer;
    FcommentGen : WideString;
    FdateAdd : TXSDateTime;
    FdateEdit : TXSDateTime;
    FuserAdd : WideString;
    FuserEdit : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FparentRefCode : Integer;
    FparentRefName : WideString;
    FparentRefYearGen : Integer;
    FparentRefVersion : Integer;
    FparentRefCommentGen : WideString;
    FparentRefDateAdd : TXSDateTime;
    FparentRefDateEdit : TXSDateTime;
    FparentRefUserAdd : WideString;
    FparentRefUserEdit : WideString;
    FkindRefCode : Integer;
    FkindRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  yearGen : Integer read FyearGen write FyearGen;
    property  version : Integer read Fversion write Fversion;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property userEdit : WideString read FuserEdit write FuserEdit;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property parentRefCode : Integer read FparentRefCode write FparentRefCode;
    property parentRefName : WideString read FparentRefName write FparentRefName;
    property parentRefYearGen : Integer read FparentRefYearGen write FparentRefYearGen;
    property parentRefVersion : Integer read FparentRefVersion write FparentRefVersion;
    property parentRefCommentGen : WideString read FparentRefCommentGen write FparentRefCommentGen;
    property parentRefDateAdd : TXSDateTime read FparentRefDateAdd write FparentRefDateAdd;
    property parentRefDateEdit : TXSDateTime read FparentRefDateEdit write FparentRefDateEdit;
    property parentRefUserAdd : WideString read FparentRefUserAdd write FparentRefUserAdd;
    property parentRefUserEdit : WideString read FparentRefUserEdit write FparentRefUserEdit;
    property kindRefCode : Integer read FkindRefCode write FkindRefCode;
    property kindRefName : WideString read FkindRefName write FkindRefName;
  end;

  ArrayOfRQPlanPurchaseShort = array of RQPlanPurchaseShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPlanPurchaseShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPlanPurchaseShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPlanPurchaseShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPlanPurchaseController/message/
  // soapAction: http://ksoe.org/RQPlanPurchaseController/action/RQPlanPurchaseController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPlanPurchaseControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPlanPurchaseController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPlanPurchaseControllerSoapPort = interface(IInvokable)
  ['{978018E8-C618-45B9-BD5A-C0DEA829DDB8}']
    function add(const aRQPlanPurchase: RQPlanPurchase): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPlanPurchase: RQPlanPurchase); stdcall;
    function getObject(const anObjectCode: Integer): RQPlanPurchase; stdcall;
    function getList: RQPlanPurchaseShortList; stdcall;
    function getFilteredList(const aRQPlanPurchaseFilter: RQPlanPurchaseFilter): RQPlanPurchaseShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPlanPurchaseShortList; stdcall;
    function getScrollableFilteredList(const aRQPlanPurchaseFilter: RQPlanPurchaseFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPurchaseShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPurchaseShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPlanPurchaseFilter: RQPlanPurchaseFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPlanPurchaseShort; stdcall;

    function makePurchaseItemTender(const aPurchaseCode : Integer;
                                    const aSpravDKPPCode: Integer;
                                    const aCountSymbolGroupdkPP : Integer;
                                    const aSpravDKPPCodeServices: Integer;
                                    const aCountSymbolGroupdkPPServices : Integer;
                                    const aSpravDKPPCodeWorks: Integer;
                                    const aCountSymbolGroupdkPPWorks : Integer
                                     ): Integer; stdcall;

    procedure removePurchaseItemTender(const rqPlanPurchaseCode: Integer); stdcall;

    procedure approved(const anObjectCode: Integer); stdcall;
    procedure unApproved(const anObjectCode: Integer); stdcall;

    procedure addInPresentPlanPurchase(const aRQPlanPurchase: RQPlanPurchase); stdcall;
  end;


implementation

  destructor RQPlanPurchase.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPlanPurchaseFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPlanPurchaseFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPlanPurchaseShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FparentRefDateAdd) then
      parentRefDateAdd.Free;
    if Assigned(FparentRefDateEdit) then
      parentRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor RQPlanPurchaseShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPlanPurchase, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchase');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseRef');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseFilter');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseShort');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPlanPurchaseShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPlanPurchaseShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPlanPurchaseControllerSoapPort), 'http://ksoe.org/RQPlanPurchaseController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPlanPurchaseControllerSoapPort), 'http://ksoe.org/RQPlanPurchaseController/action/RQPlanPurchaseController.%operationName%');


end.

