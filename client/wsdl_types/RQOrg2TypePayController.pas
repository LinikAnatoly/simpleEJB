unit RQOrg2TypePayController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQOrderItemTypePayController
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

  RQOrg2TypePay            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrg2TypePayRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrg2TypePay = class(TRemotable)
  private
    Fcode : Integer;
    Fid : Integer;
    Fcodeorg : WideString;
    Fname : WideString;
    Fokpo : WideString;
    Femail : WideString;
    FpaymentValue : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FtypePayRef : RQOrderItemTypePayRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  id : Integer read Fid write Fid;
    property codeorg : WideString read Fcodeorg write Fcodeorg;
    property name : WideString read Fname write Fname;
    property okpo : WideString read Fokpo write Fokpo;
    property email : WideString read Femail write Femail;
    property  paymentValue : Integer read FpaymentValue write FpaymentValue;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property typePayRef : RQOrderItemTypePayRef read FtypePayRef write FtypePayRef;
  end;

{
  RQOrg2TypePayFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fid : Integer;
    Fcodeorg : WideString;
    Fname : WideString;
    Fokpo : WideString;
    Femail : WideString;
    FpaymentValue : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FtypePayRef : RQOrderItemTypePayRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  id : Integer read Fid write Fid;
    property codeorg : WideString read Fcodeorg write Fcodeorg;
    property name : WideString read Fname write Fname;
    property okpo : WideString read Fokpo write Fokpo;
    property email : WideString read Femail write Femail;
    property  paymentValue : Integer read FpaymentValue write FpaymentValue;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property typePayRef : RQOrderItemTypePayRef read FtypePayRef write FtypePayRef;
  end;
}

  RQOrg2TypePayFilter = class(RQOrg2TypePay)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQOrg2TypePayShort = class(TRemotable)
  private
    Fcode : Integer;
    Fid : Integer;
    Fcodeorg : WideString;
    Fname : WideString;
    Fokpo : WideString;
    Femail : WideString;
    FpaymentValue : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FtypePayRefCode : Integer;
    FtypePayRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  id : Integer read Fid write Fid;
    property codeorg : WideString read Fcodeorg write Fcodeorg;
    property name : WideString read Fname write Fname;
    property okpo : WideString read Fokpo write Fokpo;
    property email : WideString read Femail write Femail;
    property  paymentValue : Integer read FpaymentValue write FpaymentValue;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property typePayRefCode : Integer read FtypePayRefCode write FtypePayRefCode;
    property typePayRefName : WideString read FtypePayRefName write FtypePayRefName;
  end;

  ArrayOfRQOrg2TypePayShort = array of RQOrg2TypePayShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrg2TypePayShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrg2TypePayShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrg2TypePayShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrg2TypePayController/message/
  // soapAction: http://ksoe.org/RQOrg2TypePayController/action/RQOrg2TypePayController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrg2TypePayControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrg2TypePayController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrg2TypePayControllerSoapPort = interface(IInvokable)
  ['{85088F0E-FD36-4D4D-B2E3-AA98632C5CFC}']
    function add(const aRQOrg2TypePay: RQOrg2TypePay): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrg2TypePay: RQOrg2TypePay); stdcall;
    function getObject(const anObjectCode: Integer): RQOrg2TypePay; stdcall;
    function getList: RQOrg2TypePayShortList; stdcall;
    function getFilteredList(const aRQOrg2TypePayFilter: RQOrg2TypePayFilter): RQOrg2TypePayShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrg2TypePayShortList; stdcall;
    function getScrollableFilteredList(const aRQOrg2TypePayFilter: RQOrg2TypePayFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrg2TypePayShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrg2TypePayShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQOrg2TypePayFilter: RQOrg2TypePayFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQOrg2TypePayShort; stdcall;

    function getLastContragentsListByMaterial(const aMaterialCode: Integer): RQOrg2TypePayShortList; stdcall;
  end;


implementation

  destructor RQOrg2TypePay.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtypePayRef) then
      typePayRef.Free;
    inherited Destroy;
  end;

{
  destructor RQOrg2TypePayFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtypePayRef) then
      typePayRef.Free;
    inherited Destroy;
  end;
}

  destructor RQOrg2TypePayFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQOrg2TypePayShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor RQOrg2TypePayShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrg2TypePay, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrg2TypePay');
  RemClassRegistry.RegisterXSClass(RQOrg2TypePayRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrg2TypePayRef');
  RemClassRegistry.RegisterXSClass(RQOrg2TypePayFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrg2TypePayFilter');
  RemClassRegistry.RegisterXSClass(RQOrg2TypePayShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrg2TypePayShort');
  RemClassRegistry.RegisterXSClass(RQOrg2TypePayShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrg2TypePayShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrg2TypePayShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrg2TypePayShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrg2TypePayControllerSoapPort), 'http://ksoe.org/RQOrg2TypePayController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrg2TypePayControllerSoapPort), 'http://ksoe.org/RQOrg2TypePayController/action/RQOrg2TypePayController.%operationName%');


end.
