unit ENGeneralContractsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
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

  ENGeneralContracts            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGeneralContractsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGeneralContracts = class(TRemotable)
  private
    Fcode : Integer;
    FfinDocID : Integer;
    FfinDocCode : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FcommentGen : WideString;
    FpartnerId : Integer;
    FpartnerCode : WideString;
    FpartnerName : WideString;
    FcontractRegDate : TXSDate;
    FcontractStartDate : TXSDate;
    FcontractEndDate : TXSDate;
    FaxContractId : WideString;
    FaxContractCode : WideString;
    FaxContractNumber : WideString;
    FaxContractAccount : WideString;
    FaxContractDate : TXSDate;
    FaxContractCommentGen : WideString;
    FaxContractGroupCode : WideString;
    FaxPartnerCode : WideString;
    FaxPartnerName : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  partnerId : Integer read FpartnerId write FpartnerId;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property contractRegDate : TXSDate read FcontractRegDate write FcontractRegDate;
    property contractStartDate : TXSDate read FcontractStartDate write FcontractStartDate;
    property contractEndDate : TXSDate read FcontractEndDate write FcontractEndDate;
    property axContractId : WideString read FaxContractId write FaxContractId;
    property axContractCode : WideString read FaxContractCode write FaxContractCode;
    property axContractNumber : WideString read FaxContractNumber write FaxContractNumber;
    property axContractAccount : WideString read FaxContractAccount write FaxContractAccount;
    property axContractDate : TXSDate read FaxContractDate write FaxContractDate;
    property axContractCommentGen : WideString read FaxContractCommentGen write FaxContractCommentGen;
    property axContractGroupCode : WideString read FaxContractGroupCode write FaxContractGroupCode;
    property axPartnerCode : WideString read FaxPartnerCode write FaxPartnerCode;
    property axPartnerName : WideString read FaxPartnerName write FaxPartnerName;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
  end;

{
  ENGeneralContractsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FfinDocID : Integer;
    FfinDocCode : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FcommentGen : WideString;
    FpartnerId : Integer;
    FpartnerCode : WideString;
    FpartnerName : WideString;
    FcontractRegDate : TXSDate;
    FcontractStartDate : TXSDate;
    FcontractEndDate : TXSDate;
    FaxContractId : WideString;
    FaxContractCode : WideString;
    FaxContractNumber : WideString;
    FaxContractAccount : WideString;
    FaxContractDate : TXSDate;
    FaxContractCommentGen : WideString;
    FaxContractGroupCode : WideString;
    FaxPartnerCode : WideString;
    FaxPartnerName : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  partnerId : Integer read FpartnerId write FpartnerId;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property contractRegDate : TXSDate read FcontractRegDate write FcontractRegDate;
    property contractStartDate : TXSDate read FcontractStartDate write FcontractStartDate;
    property contractEndDate : TXSDate read FcontractEndDate write FcontractEndDate;
    property axContractId : WideString read FaxContractId write FaxContractId;
    property axContractCode : WideString read FaxContractCode write FaxContractCode;
    property axContractNumber : WideString read FaxContractNumber write FaxContractNumber;
    property axContractAccount : WideString read FaxContractAccount write FaxContractAccount;
    property axContractDate : TXSDate read FaxContractDate write FaxContractDate;
    property axContractCommentGen : WideString read FaxContractCommentGen write FaxContractCommentGen;
    property axContractGroupCode : WideString read FaxContractGroupCode write FaxContractGroupCode;
    property axPartnerCode : WideString read FaxPartnerCode write FaxPartnerCode;
    property axPartnerName : WideString read FaxPartnerName write FaxPartnerName;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
  end;
}

  ENGeneralContractsFilter = class(ENGeneralContracts)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENGeneralContractsShort = class(TRemotable)
  private
    Fcode : Integer;
    FfinDocID : Integer;
    FfinDocCode : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FcommentGen : WideString;
    FpartnerId : Integer;
    FpartnerCode : WideString;
    FpartnerName : WideString;
    FcontractRegDate : TXSDate;
    FcontractStartDate : TXSDate;
    FcontractEndDate : TXSDate;
    FaxContractId : WideString;
    FaxContractCode : WideString;
    FaxContractNumber : WideString;
    FaxContractAccount : WideString;
    FaxContractDate : TXSDate;
    FaxContractCommentGen : WideString;
    FaxContractGroupCode : WideString;
    FaxPartnerCode : WideString;
    FaxPartnerName : WideString;
    FuserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  partnerId : Integer read FpartnerId write FpartnerId;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property contractRegDate : TXSDate read FcontractRegDate write FcontractRegDate;
    property contractStartDate : TXSDate read FcontractStartDate write FcontractStartDate;
    property contractEndDate : TXSDate read FcontractEndDate write FcontractEndDate;
    property axContractId : WideString read FaxContractId write FaxContractId;
    property axContractCode : WideString read FaxContractCode write FaxContractCode;
    property axContractNumber : WideString read FaxContractNumber write FaxContractNumber;
    property axContractAccount : WideString read FaxContractAccount write FaxContractAccount;
    property axContractDate : TXSDate read FaxContractDate write FaxContractDate;
    property axContractCommentGen : WideString read FaxContractCommentGen write FaxContractCommentGen;
    property axContractGroupCode : WideString read FaxContractGroupCode write FaxContractGroupCode;
    property axPartnerCode : WideString read FaxPartnerCode write FaxPartnerCode;
    property axPartnerName : WideString read FaxPartnerName write FaxPartnerName;
    property userGen : WideString read FuserGen write FuserGen;

  end;

  ArrayOfENGeneralContractsShort = array of ENGeneralContractsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENGeneralContractsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENGeneralContractsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENGeneralContractsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENGeneralContractsController/message/
  // soapAction: http://ksoe.org/ENGeneralContractsController/action/ENGeneralContractsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENGeneralContractsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENGeneralContractsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENGeneralContractsControllerSoapPort = interface(IInvokable)
  ['{F98B103D-F081-4F57-B62C-5F484DACF2F5}']
    function add(const aENGeneralContracts: ENGeneralContracts): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENGeneralContracts: ENGeneralContracts); stdcall;
    function getObject(const anObjectCode: Integer): ENGeneralContracts; stdcall;
    function getList: ENGeneralContractsShortList; stdcall;
    function getFilteredList(const aENGeneralContractsFilter: ENGeneralContractsFilter): ENGeneralContractsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENGeneralContractsShortList; stdcall;
    function getScrollableFilteredList(const aENGeneralContractsFilter: ENGeneralContractsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENGeneralContractsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENGeneralContractsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENGeneralContractsFilter: ENGeneralContractsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENGeneralContractsShort; stdcall;
  end;


implementation

  destructor ENGeneralContracts.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcontractRegDate) then
      contractRegDate.Free;
    if Assigned(FcontractStartDate) then
      contractStartDate.Free;
    if Assigned(FcontractEndDate) then
      contractEndDate.Free;
    if Assigned(FaxContractDate) then
      axContractDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

{
  destructor ENGeneralContractsFilter.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcontractRegDate) then
      contractRegDate.Free;
    if Assigned(FcontractStartDate) then
      contractStartDate.Free;
    if Assigned(FcontractEndDate) then
      contractEndDate.Free;
    if Assigned(FaxContractDate) then
      axContractDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;
}

  destructor ENGeneralContractsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENGeneralContractsShort.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcontractRegDate) then
      contractRegDate.Free;
    if Assigned(FcontractStartDate) then
      contractStartDate.Free;
    if Assigned(FcontractEndDate) then
      contractEndDate.Free;
    if Assigned(FaxContractDate) then
      axContractDate.Free;
    inherited Destroy;
  end;

  destructor ENGeneralContractsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENGeneralContracts, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeneralContracts');
  RemClassRegistry.RegisterXSClass(ENGeneralContractsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeneralContractsRef');
  RemClassRegistry.RegisterXSClass(ENGeneralContractsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeneralContractsFilter');
  RemClassRegistry.RegisterXSClass(ENGeneralContractsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeneralContractsShort');
  RemClassRegistry.RegisterXSClass(ENGeneralContractsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeneralContractsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENGeneralContractsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENGeneralContractsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENGeneralContractsControllerSoapPort), 'http://ksoe.org/ENGeneralContractsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENGeneralContractsControllerSoapPort), 'http://ksoe.org/ENGeneralContractsController/action/ENGeneralContractsController.%operationName%');


end.
